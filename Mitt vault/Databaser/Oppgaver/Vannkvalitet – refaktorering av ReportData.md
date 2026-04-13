---
Prosjekt:
  - "[[IVAR]]"
Oppgavestatus: I arbeid
---
## Logic Flow Overview

Here's the full data pipeline from API to frontend:

### 1. **`ReportDataTile` (frontend entry point)**

The tile's `prepare()` method kicks everything off. It determines a **mode**:

- **`MODE_LIST`** — shows a list of facility articles grouped by municipality (no API call needed).
- **`MODE_ARTICLE`** — a specific article is selected via `?aid=` GET parameter, and water quality summary data is fetched from the API and displayed.

In article mode, `prepare()` calls `getSummaryItems()`.

### 2. **`ReportDataTile::getSummaryItems()`**

Reads three article elements from the CMS:

- `report_tags` (text) — newline-separated tag strings like `L430_REN01_REN_LA01_SUR;m;1`
- `calcium_value_average_last_year` (number)
- `magnesium_value` (number)

Then hands off to:

### 3. **`ReportDataSummaryGenerator` (orchestrator)**

The **constructor** does all the work (which is worth noting for your refactoring):

1. **`parseTags()`** — splits each tag string by `;` into `[tag, interval, prioritize]`, validates them, and groups by interval.
2. **For each interval group**, calls **`getDataSummary()`**, which:
    - Creates a `ReportDataClientCurl` → `ReportDataHandler` (fresh instances every call — another thing to note).
    - Makes **two API calls** via the handler:
        - **Tag table** (`getTagTableRows`) — fetches metadata (name, unit, limits, etc.) using `INTERVAL_DAY`.
        - **Report table** (`getReportTableRow`) — fetches the actual measured values using the tag's own interval.
    - **`combineTagTableAndReportTable()`** — joins the metadata with the measured values to produce `ReportDataSummaryItem[]` objects. Also calculates a synthetic "water hardness" item when calcium data is present.

### 4. **`ReportDataHandler` (data transformer)**

- Calls `ReportDataClient::getData()` to get raw JSON from the API.
- Parses it into `GoogleChartsDataTable` objects (the API returns Google Charts–formatted JSON).
- For the tag table specifically, converts rows into `ReportDataTagDataTableRow` objects via `getReportDataTagDataTableRows()`.

### 5. **`ReportDataTagDataTableRow` (💥 the problem class)**

Its constructor iterates over every key in the API response array and **throws an exception if any key doesn't match a declared property**:

```

if (!property_exists($this, $property)) {    throw new CtInvalidVariableValueException('Non-existing property [' . $property . ']');}
```

So when the API provider added a new column (e.g. `$linkedData` or anything else), this strict mapping broke everything.

### 6. **`ReportDataSummaryItem` (the DTO — your question)**

**Yes, your assumption is correct.** `ReportDataSummaryItem` is a pure DTO / value object. It:

- Takes all its values through the constructor and casts them to strings/bool.
- Exposes only getters — no setters, no mutation, no side effects.
- Has one minor behavior method (`isHardness()`), but that's just a convenience check used in the Twig template to exclude hardness rows from the main table.

It has zero responsibility for data fetching or transformation.

---

### Visual summary of the call chain

```

ReportDataTile::prepare()
  └─ getSummaryItems()
       └─ ReportDataSummaryGenerator::__construct()
            ├─ parseTags()                          // validate & group tag strings
            └─ getDataSummary() (per interval group)
                 ├─ ReportDataClientCurl::getData()  // HTTP call → raw JSON
                 │    └─ (authenticates via OAuth token)
                 ├─ ReportDataHandler::getGoogleChartsDataTables()
                 │    └─ GoogleChartsDataTable::createDataTableFromChartsData()
                 ├─ getTagTableRows()
                 │    └─ handler→getReportDataTagDataTableRows()
                 │         └─ new ReportDataTagDataTableRow($cells)  ← 💥 BREAKS HERE
                 ├─ getReportTableRow()
                 └─ combineTagTableAndReportTable()
                      └─ new ReportDataSummaryItem(...)              ← pure DTO
```

### Key observations for your refactoring

1. **The root cause** is `ReportDataTagDataTableRow::__construct()` — it uses a strict allowlist approach. Any unknown key from the API causes a hard failure.
    
2. **Only a few properties are actually used downstream.** If you trace what `combineTagTableAndReportTable()` reads from `ReportDataTagDataTableRow`, it's just: `getName()`, `getTitle()`, `getUnit()`, `getLogIntervalMinValue()`, and `getLogIntervalMaxValue()`. The other ~40 properties are never consumed.
    
3. **The `ReportDataSummaryGenerator` constructor does all the heavy lifting** (API calls, data transformation). This means if any step throws, the entire generator fails and `getSummaryItems()` returns nothing, which makes `prepare()` return `false`, blanking the whole tile.
    
4. **`ReportDataClientCurl` and `ReportDataConfig` are instantiated directly** inside `getDataSummary()` — no dependency injection — making it hard to test or swap implementations.
    


---

## Further improvement suggestions

Here's what I'd consider tackling next, roughly by impact:

### 1. **`ReportDataSummaryGenerator` constructor doing too much**

The constructor makes HTTP calls, parses data, and builds summary items. This makes it impossible to unit test without hitting the real API. Consider extracting the work into a dedicated method (e.g. `generate()`) so the constructor only stores parameters, and the caller does `$generator->generate()->getSummaryItems()`.

### 2. **Hard-coded dependencies in `getDataSummary()`**

`new ReportDataClientCurl(new ReportDataConfig('production'))` is instantiated inside the method on every call. The `ReportDataHandler` (or at least the `ReportDataClient`) should be injected — either through the constructor or as a method parameter. This would also enable testing with a mock client.

### 3. **Duplicate API calls**

`getTagTableRows()` and `getReportTableRow()` each call `$handler->getGoogleChartsDataTables($parameters)` separately with different parameters, but `getDataSummary()` also creates two separate `ReportDataParameters` objects. It's worth verifying whether the API could return both tables in a single call, which would cut the HTTP requests in half.

### 4. **Error resilience in `combineTagTableAndReportTable()`**

Now that `ReportDataTagData` gracefully handles unknown API keys, the _next_ weak point is `combineTagTableAndReportTable()`. If `getName()` or `getTitle()` returns `null`, things will break downstream (e.g. `parseTagTableRowTitle()` expects a `string`). Consider adding null checks or default values there.

### 5. **The `ReportDataConfig` constructor signature**

It accepts a `'production'` string argument but the constructor takes no parameters — this has been silently ignored. Minor cleanup.

### 6. **Unit tests**

There don't appear to be any tests for the ReportData classes. With the dependency injection improvement from point 2, you could write tests for `ReportDataSummaryGenerator`, `ReportDataTagData`, and `ReportDataSummaryItem` with mock data.

---

## Summary for continuation in a new chat

> **Project:** ivar2025 (CorePublish/SiteComponents, PHP 8.1)
> 
> **What we're refactoring:** The `ReportData` module under `include/classes/Ivar/ReportData/`. It fetches water quality measurement data from an external API (returns Google Charts DataTable JSON format, not actual Google Sheets), transforms it, and displays it in a frontend tile.
> 
> **Problem:** The API provider added a new column, causing `ReportDataTagDataTableRow`'s constructor to throw (it used a strict allowlist of properties). This crashed the entire frontend tile.
> 
> **Completed so far:**
> 
> - **Renamed** `ReportDataTagDataTableRow` → `ReportDataTagData`. Stripped ~40 unused properties down to the 5 actually consumed: `name`, `title`, `unit`, `logInterval_minValue`, `logInterval_maxValue`.
> - **Flipped the constructor logic** — now iterates own properties and extracts from `$data`, silently ignoring unknown keys. Uses `str_replace('_', '.', $property)` to map property names to dot-notation API keys.
> - **Refactored `ReportDataSummaryItem`** — converted to `public readonly` promoted constructor properties, removed all getters. Changed `limitLow`/`limitHigh` from `string` to `int`, `rawValue` from `string` to `float`. Twig templates work unchanged (Twig checks public properties before getters).
> - **Fixed type mismatches** in `combineTagTableAndReportTable()` — added `(string)`, `(int)` casts where `ReportDataTagData` getters return nullable types.
> - **Updated class comments** to accurately reflect the classes' roles.
> 
> **Still to do:** Constructor-does-too-much in `ReportDataSummaryGenerator`, dependency injection for `ReportDataClientCurl`/`ReportDataHandler`, null safety in `combineTagTableAndReportTable()`, `ReportDataConfig` constructor cleanup, and unit tests.