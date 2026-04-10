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
    

Good luck with the refactoring! Let me know if you want me to dig deeper into any specific part. 🛠️