# Claude's Complete Guide to Obsidian Bases

**Last Updated:** October 2025  
**Purpose:** Comprehensive reference combining conceptual understanding with technical syntax for AI assistant to help with Obsidian Bases

---

## Quick Overview

Obsidian Bases is a core plugin released in version 1.9.10 (August 18, 2025) that transforms your vault into dynamic, filterable database views using YAML frontmatter properties. This guide combines conceptual understanding with comprehensive technical documentation on .base file syntax, filter expressions, and advanced features based on the latest v1.9.2+ syntax.

**Version requirement**: Obsidian 1.9.0+ with Catalyst membership (early access as of October 2025). **Major breaking changes** occurred in v1.9.2 (June 2025), shifting from functional syntax to object-oriented method chaining. The syntax changed from `contains(file.name, "Books")` to `file.name.contains("Books")`, `not()` became `!`, and date functions were simplified. All examples here reflect post-v1.9.2 syntax.

---

## Part I: Conceptual Foundation

### What Bases Are

Obsidian Bases provides **query-based database views** over your notes. Think of them as saved searches that display filtered notes in table or card layouts.

**Critical architectural concept:** Bases use a **filter paradigm**, not a container paradigm like Notion databases.

- Every Base starts with ALL notes in the vault
- Filters narrow down which notes appear
- Notes don't "belong to" a Base—they match (or don't match) filter criteria
- Same note can appear in multiple Bases simultaneously
- No note creation from within Base views (must create separately)

### Core Concepts to Remember

#### Filter-First Thinking
- User creates notes first → Base filters display them
- NOT: Create database → Add items to it
- Filters query across all vault files using properties in YAML frontmatter

#### Context-Aware Features
- `this.file` variable enables dynamic filtering based on currently open note
- Embedded Bases can show different content depending on which note contains them
- This is unique to Obsidian—Notion can't do this

#### Property System
- All properties stored in YAML frontmatter in note files
- Built-in file properties: `file.name`, `file.path`, `file.folder`, `file.tags`, `file.ctime`, `file.mtime`, `file.size`, `file.links`, `file.inlinks`
- Custom properties: Text, Number, Checkbox, Date, Date & Time, List, Links
- Properties are vault-wide, not Base-specific

### How to Help User Work With Bases

#### When User Wants to Create a Base
1. Help them identify which existing notes they want to view
2. Determine filtering criteria (folder, tags, properties)
3. Suggest starting simple (tag-based or folder-based filters)
4. Remind them notes must exist first—suggest templates if needed

#### When User Wants Notion-Like Workflows
**Be aware of limitations:**
- No kanban, calendar, or timeline views (yet—on roadmap)
- No inline note creation from Base view
- No formal Relation/Rollup properties
- No collaboration features

**Suggest workarounds:**
- Use Templater/QuickAdd for quick note creation with properties
- Use formulas and links for relationships between notes
- Consider Tasks or Dataview plugins for features Bases lacks

#### When User Asks About Formulas
- Formulas use JavaScript-like syntax
- Can reference other properties, perform calculations, query relationships
- Advanced feature—offer simple examples first
- Remember `this.file` for context-aware formulas in embedded Bases

### Common User Workflows to Support

#### Project/Task Management
- Filter by folder or tags to show project-related notes
- Use checkbox properties for task status
- Suggest multiple views (All, Active, Completed)
- Remind: no kanban yet, so card view + status property is closest alternative

#### Content/Reading Lists
- Tag-based filtering (books, articles, videos)
- Date properties for tracking (started, finished)
- Card view with image properties for visual appeal
- Suggest embedding in MOCs or index notes

#### Personal CRM/Contacts
- Person notes with properties (company, role, last contact)
- Multiple views by category or relationship type
- Link properties to connect people to projects

#### Research/Literature Notes
- Filter by topic tags or folder structure
- Date properties for publication/reading dates
- Use backlinks and formulas to show related notes
- Embed in research project notes for context-aware displays

### Key Differences from Notion (for context)

| Feature | Notion | Obsidian Bases |
|---------|--------|----------------|
| Paradigm | Container (add items TO database) | Filter (query ACROSS all notes) |
| View Types | 7+ (table, kanban, calendar, timeline, list, gallery, chart) | 2 (table, card) - more coming |
| Note Creation | Create directly in database view | Must create separately, then appears in Base |
| Relationships | Formal Relation + Rollup properties | Manual via links + formulas |
| Collaboration | Built-in real-time | Personal use only |
| Performance | Slows with large databases | Fast even with 10,000+ notes |
| Data Storage | Cloud, proprietary | Local, plain Markdown |
| Context-Aware | No | Yes (`this.file` variable) |

### Quick Troubleshooting

**"My note isn't showing in the Base"**
- Check if note matches ALL filter criteria
- Verify properties are in YAML frontmatter
- Check "All views" filters vs "This view" filters
- Confirm property names match exactly (case-sensitive)

**"I want to create a note from the Base"**
- Not possible currently—this is intentional design
- Suggest: Create template, use Command Palette, or QuickAdd plugin
- Ensure template includes necessary properties for Base filter

**"Can I do X like in Notion?"**
- Check the comparison table above
- If it's a view type issue, mention roadmap (kanban, grouping, etc. coming)
- If it's collaboration, explain Obsidian is personal-first
- If it's relations/rollups, suggest formulas + links workaround

### User Context Notes

**User's background:**
- Self-taught PHP developer, comfortable with technical concepts
- Familiar with TDD, uses Pest framework
- Learning React (async JS is weak point)
- Migrating from Notion to Obsidian for cost and data ownership
- On temporary work leave, transitioning skills

**How to help effectively:**
- Can handle technical explanations (formulas, YAML)
- May need hand-holding on JavaScript-style syntax for formulas
- Appreciates efficiency and best practices
- Values data ownership and local control
- Likely comfortable with CLI/git for version control

### Remember (High-Level Principles)

1. **Always check if user's notes exist before suggesting Base filters**
2. **Start simple** (tags/folders) before complex formulas
3. **Bases are views, not containers** - reinforce this mental model
4. **Can't create from Base** - biggest workflow difference from Notion
5. **Speed is a feature** - Bases are blazing fast, unlike Notion
6. **Plain text is forever** - emphasize data portability when relevant

---

## Part II: Technical Reference

## .base file structure and YAML schema

Bases are stored as `.base` files containing valid YAML. You can edit them via the GUI or directly in source mode. The root-level schema supports four optional keys plus one required key:

```yaml
# Global filters (optional) - applied to all views
filters:
  and:
    - file.hasTag("project")
    - status != "archived"

# Formula properties (optional) - computed values
formulas:
  days_old: "(now() - file.ctime) / 86400000"
  priority_score: "if(priority, priority * 2, 0)"

# Property display config (optional)
properties:
  status:
    displayName: "Current Status"
  formula.days_old:
    displayName: "Age (days)"

# Views array (required) - at least one view needed
views:
  - type: table
    name: "Active Projects"
    filters:
      and:
        - status == "active"
    limit: 50
    group_by: "category"
    order:
      - priority
      - file.mtime
    sort:
      - column: priority
        direction: DESC
```

### Root-level keys explained

**filters** (string or filter object): Global filters narrow the entire dataset before view-specific filters apply. Supports single filter strings or nested objects with `and`, `or`, `not` keys. All view filters are combined with global filters using AND logic.

**formulas** (object): Define computed properties using JavaScript-like expressions. Access via `formula.property_name` in filters and views. Formulas can reference other formulas but circular dependencies are prohibited. Always defined as strings in YAML; output type determined by return value.

**properties** (object): Configure property metadata. Currently only supports `displayName` for UI column headers. Applies to note properties (`note.property`), file properties (`file.name`), and formula properties (`formula.computed`).

**views** (array): Defines different visualizations of filtered data. Each view object requires `type` and `name`. View-specific configurations depend on type (table, cards, map). Built-in types include `table`, `cards`, `list`, `map`. Plugin developers can register custom view types via API.

### View configuration keys

Every view in the `views` array accepts these keys:

- **type** (required): View type identifier (`table`, `cards`, `list`, `map`)
- **name** (required): Display name shown in view switcher
- **filters** (optional): View-specific filters using same syntax as global filters
- **limit** (table): Maximum rows to display
- **group_by** (table): Property name to group results by
- **order** (table): Array of property names defining sort priority
- **columnSize** (table): Object mapping property names to pixel widths
- **sort** (table): Array of sort configurations with `column` and `direction` (ASC/DESC)
- **lat, long, title** (map): Map-specific coordinate and marker properties

## Complete filter syntax reference

### Filter expression types

Filters evaluate to truthy/falsey values. Two forms exist:

**Single filter statement** (string):
```yaml
filters: 'status == "active"'
```

**Filter object** (recursive structure):
```yaml
filters:
  and:
    - file.hasTag("book")
    - or:
      - price > 10
      - rating >= 4
  not:
    - file.inFolder("Archive")
```

### Logical operators

**YAML structure operators** (`and`, `or`, `not`):
```yaml
filters:
  and:  # All conditions must be true
    - condition1
    - condition2
  or:   # At least one condition must be true
    - condition3
    - condition4
  not:  # Inverts all nested conditions
    - condition5
```

**Inline operators** (`&&`, `||`, `!`):
```javascript
status == "active" && priority > 5
file.hasTag("fiction") || file.hasTag("non-fiction")
!archived
```

### Comparison operators

All standard comparison operators work with appropriate types:

- **Equality**: `==`, `!=` (works with any type)
- **Numeric**: `>`, `<`, `>=`, `<=` (numbers and dates)
- **Arithmetic**: `+`, `-`, `*`, `/`, `%` (numbers)

**Critical requirement**: Arithmetic operators must be surrounded by spaces: `radius * (2 * 3.14)` not `radius*(2*3.14)`.

Examples:
```javascript
status != "done"
price > 100
file.size >= 1000
(price / quantity) > 10
active && !archived
```

### Built-in file properties

File properties are available for all file types including attachments:

| Property | Type | Description |
|----------|------|-------------|
| `file.name` | string | Filename without extension |
| `file.path` | string | Full file path |
| `file.folder` | string | Containing folder path |
| `file.ext` | string | File extension |
| `file.size` | number | File size in bytes |
| `file.ctime` | date | Creation timestamp |
| `file.mtime` | date | Modification timestamp |
| `file.tags` | list | All tags (frontmatter + inline) |
| `file.links` | list | All outgoing internal links |
| `file.backlinks` | list | All incoming links (v1.9.7+) |

File date properties expose granular fields:
```javascript
file.ctime.year        // 2025
file.ctime.month       // 1-12
file.ctime.day         // 1-31
file.ctime.hour        // 0-23
file.ctime.minute      // 0-59
file.ctime.second      // 0-59
file.ctime.weekday     // 0-6 (Sunday=0)
file.ctime.weekNumber  // Week number in year
```

### File methods

**file.hasTag(...tags)**: Returns true if file contains any of the provided tags (checks both frontmatter and inline tags).
```javascript
file.hasTag("book")
file.hasTag("fiction", "non-fiction")  // OR logic
```

**file.hasLink(file|string)**: Returns true if file contains link to specified note.
```javascript
file.hasLink("Other Note")
file.hasLink(this.file)  // Backlinks
```

**file.inFolder(path)**: Returns true if file resides in specified folder.
```javascript
file.inFolder("Projects")
file.inFolder(this.file.folder)  // Same folder as current
```

**file.asLink(display?)**: Converts file to Link object.
```javascript
file.asLink()
file.asLink("Custom Display Text")
```

## Property types and filtering methods

### Accessing properties

Three property namespaces exist:

1. **Note properties** (frontmatter): `property_name` or `note.property_name`
2. **File properties** (built-in): `file.property_name`
3. **Formula properties** (computed): `formula.property_name`

Properties with spaces or special characters require bracket notation:
```javascript
note["Property Name"]
note["My-Property"]
value["Multi Word Key"]
```

### Text property filtering

```javascript
// Exact comparison
title == "My Note"
author != "Unknown"

// String methods (case-sensitive by default)
title.contains("Guide")
title.startsWith("Chapter")
title.endsWith("Draft")

// Case-insensitive comparison
title.toLowerCase().contains("obsidian")
file.name.toLowerCase() == "my note"

// Multiple substring matching
file.name.toLowerCase().containsAny("guide", "tutorial", "howto")
file.name.containsAll("obsidian", "bases")
```

**String methods reference**:
- `.contains(substring)`: Check if string contains value
- `.containsAll(...substrings)`: All substrings must be present
- `.containsAny(...substrings)`: At least one substring present
- `.startsWith(prefix)`: String starts with prefix
- `.endsWith(suffix)`: String ends with suffix
- `.toLowerCase()`: Convert to lowercase
- `.toUpperCase()`: Convert to uppercase
- `.trim()`: Remove whitespace
- `.split(separator)`: Split into array
- `.replace(pattern, replacement)`: Replace pattern
- `.slice(start, end?)`: Extract substring

### Number property filtering

```javascript
// Direct comparison
age > 25
price >= 10.5
rating <= 5

// Arithmetic operations
price * quantity > 100
(price / age).toFixed(2) > "5.00"

// Number methods
price.round() == 10
age.abs() >= 18
value.toFixed(2)  // Format to 2 decimals
value.ceil()
value.floor()
```

### Date property filtering

**Modern syntax (v1.9.2+)**:
```javascript
// Current date comparisons
property == today()
file.ctime.date() == today()
file.mtime.date() == today()

// Date arithmetic with duration strings
file.mtime >= today() - "7d"
dueDate >= today() + "7d"
file.ctime > now() - "1 week"

// Date comparison operators
date1 < date2    // Before
date1 > date2    // After
date1 == date2   // Equals

// Date component access
createdDate.year == 2025
createdDate.month == 12
createdDate.hour >= 9

// Date formatting
createdDate.format("YYYY-MM-DD")
file.mtime.format("dddd, MMM YYYY")
```

**Duration units**: `y/year/years`, `M/month/months`, `w/week/weeks`, `d/day/days`, `h/hour/hours`, `m/minute/minutes`, `s/second/seconds`. Duration strings must be quoted: `"7d"` not `7d`.

**Date functions**:
- `date(string)`: Parse date string
- `today()`: Current date (time = 00:00:00)
- `now()`: Current date and time
- `date.format(formatString)`: Format using Moment.js patterns
- `date.date()`: Remove time component
- `date.time()`: Get time as string
- `date.relative()`: Relative time string ("2 days ago")

### Boolean property filtering

```javascript
// Direct boolean checks
isComplete == true
isPublished != false

// Truthy/falsey evaluation
isActive
!isArchived
```

### List property filtering

**Critical distinction**: List `contains()` checks for exact element matches, not substring matches within elements.

```javascript
// Basic contains
tags.contains("important")
authors.containsAll("Author1", "Author2")
categories.containsAny("fiction", "sci-fi")

// Ensure property is treated as list (handles single values)
list(property).contains(value)

// List access and length
tags[0] == "primary-tag"  // First element
tags[-1]                   // Last element
tags.length > 3

// Filter list elements
list(sources).filter(value.contains("Book"))
list(sources).filter(value.contains("Book")).length > 5

// Map transformation
list(items).map(value.toLowerCase())
```

**List methods reference**:
- `.contains(value)`: Check if list contains exact value
- `.containsAll(...values)`: All values must be present
- `.containsAny(...values)`: At least one value present
- `.length`: Number of elements
- `[index]`: Access by index (0-based, negative for reverse)
- `.filter(condition)`: Filter elements matching condition
- `.map(expression)`: Transform each element
- `.sort()`: Sort elements
- `.reverse()`: Reverse order
- `.unique()`: Remove duplicates
- `.flat()`: Flatten nested arrays
- `.slice(start, end?)`: Extract subarray
- `.join(separator)`: Join into string

### Link property filtering

**Links are a distinct type, not strings**. This affects how you filter them.

```javascript
// Link comparison
author == this
author == link("Person Name")

// Link in list property
authors.contains(this)
authors.contains(link("Author Name"))

// Check if property links to specific note
director.contains(link("Director Name"))

// File link methods
file.hasLink("Textbook")
file.hasLink(this.file)      // Backlinks
this.file.hasLink(file)      // Outlinks

// Work with link display text (convert to string)
link_property.toString().contains("MATCH")
list(links).filter(value.toString().split("|")[1].contains("MATCH"))
```

When working with links in lists, use `.toString()` to access display text, as links won't match string comparisons otherwise.

## Advanced filtering features

### The this.file context variable

`this.file` (or just `this`) provides context-aware filtering that adapts based on the currently active note:

**Behavior by context**:
- In tabs/windows/sidebar: References the currently active/focused tab
- When embedded: References the note containing the embedding
- Multiple instances: All reference the same "active" note

**Available properties**:
- `this.file.name`: Current file name
- `this.file.path`: Current file path
- `this.file.folder`: Current file folder
- `this.file.ext`: Current file extension
- `this[property]`: Current file's property value

**Practical patterns**:

```javascript
// Show notes created on same date as current daily note
date(created).format("YYYY-MM-DD") == this.file.name

// Show notes in same folder as current note
file.inFolder(this.file.folder)

// Filter based on current note's property value
Resource.containsAny(this["Resource"])

// Show all notes except the base file itself
this.file.ext != 'base'

// Backlinks (notes linking to current note)
file.hasLink(this.file)

// Outlinks (notes current note links to)
this.file.hasLink(file)
```

### Filtering by links, inlinks, and outlinks

**Core link filtering syntax**:

```javascript
// Backlinks - files linking TO current note
file.hasLink(this.file)
file.hasLink(this.file.name)

// Outlinks - files current note links TO
this.file.hasLink(file)

// Bidirectional links
file.hasLink(this.file) && this.file.hasLink(file)

// Count links
file.links.length          // Outgoing link count
file.backlinks.length      // Incoming link count (v1.9.7+)

// Section links
file.links.filter(value.startsWith(this.file.name+"#")).length > 0

// "Privileged" links pattern (links ending with #)
file.links.contains(this.file.name+"#")
```

**Advanced backlinks filtering (v1.9.7+)**:

```javascript
// Filter backlinks by folder
file.backlinks.filter(value.asFile().path.contains("Folder")).length

// Filter backlinks by property
file.backlinks.filter(value.asFile().properties.status == "active").length

// Unrequited outlinks (links not reciprocated)
file.links.filter(!file.backlinks.map(value.asFile()).unique()
  .filter(value.path != file.path)
  .map(value.name).contains(value)).length > 5
```

**Key pattern**: Use `.asFile()` to access file properties from link lists.

**Performance note**: `file.backlinks` has performance implications on large tables and doesn't auto-refresh; manual reload required.

### Date and time filtering patterns

**Common date filtering recipes**:

```javascript
// Files created today
file.ctime.date() == today()

// Files modified in last 7 days
file.mtime >= today() - "7d"

// Files created this year
file.ctime.year == 2025

// Due in next 7 days
dueDate >= today() && dueDate <= today() + "7d"

// Overdue tasks
dueDate < today() && status != "done"

// Same day in previous years ("On This Day")
file.ctime.format("MM-DD") == today().format("MM-DD")

// Date range
date(file.name.slice(2)) >= this.file.name.slice(2) &&
date(file.name.slice(2)) <= date(this.file.name.slice(2)) + "3 days"
```

**Date parsing from strings**:

```javascript
// Parse date from filename
date(file.name.slice(2))

// Parse custom format (DD.MM.YYYY to standard)
date(
  lastSeen.toString().slice(6) + "-" + 
  lastSeen.toString().slice(3,5) + "-" + 
  lastSeen.toString().slice(0,2)
)

// Extract week number from date
date(file.name.slice(2)).format("WW")
```

### Regex pattern matching

**Syntax**: `/pattern/.matches(string)`

```javascript
// Match daily note format (ø YYYY-MM-DD)
/ø \d{4}-\d{2}-\d{2}/.matches(file.name)

// Match four-digit year
/\d{4}/.matches(value)

// Email pattern (simplified)
/.+@.+\..+/.matches(email)

// Custom naming convention
/^[A-Z]{3}-\d{4}/.matches(file.name)
```

**Common regex components**:
- `\d`: Any digit
- `\d{4}`: Exactly 4 digits
- `.+`: One or more of any character
- `.*`: Zero or more of any character
- `[a-z]`: Any lowercase letter
- `^`: Start of string
- `$`: End of string

Often string methods suffice without regex:
```javascript
// Instead of regex
value.startsWith("prefix")
value.endsWith("suffix")
value.contains("substring")
```

### Formula syntax and patterns

**Formula declaration**:

```yaml
formulas:
  formula_name: "expression"
  days_old: "(now() - file.ctime) / 86400000"
  priority_score: "if(priority, priority * 2, 0)"
```

**Object-oriented chaining (v1.9.2+)**:
```javascript
// Modern: method chaining
property.split(' ').sort()[0].toLowerCase()

// Deprecated: function wrapping
lower(first(sort(split(property, ' '))))
```

**Referencing formulas**:
```javascript
formula["formula name"]  // With spaces
formula.formulaName      // Without spaces
```

**Conditional logic**:
```javascript
// Basic if: if(condition, trueResult)
if(updated != this.file.name, updated.format("YYYY-MM-DD HH:mm"))

// With else: if(condition, trueResult, falseResult)
if(duration < 86400000, "Same day", duration)

// Nested conditionals
if(status == "urgent", "🔴 " + title, 
   if(status == "important", "🟡 " + title, title))
```

**Type conversion functions**:
```javascript
link(value)      // Convert to link type
date(value)      // Convert to date type
list(value)      // Ensure array type
value.toString() // Convert to string
number(value)    // Convert to number
```

**Common formula patterns**:

```javascript
// Time to read calculation
(wordCount / 200).toFixed(0) + " min"

// Percentage complete
(completed / total * 100).toFixed(1) + "%"

// Days until/since
((dueDate - today()) / 86400000).toFixed(0)

// Visual indicators
if(status == "urgent", "🔴", if(status == "active", "🟢", "⚪"))

// Link with custom display
link(file, title)
link(date(file.name).format("YYYY-MM-DD"), date(file.name).format("dddd, MMM"))
```

### Nested property access

**Direct property access**:
```javascript
property           // Current note's property
note.property      // Explicit current note
file.property      // File properties
```

**Properties with spaces require brackets**:
```javascript
note["Property Name"]
this["Property Name"]
value["Multi Word Key"]
```

**Access properties from file objects**:

When working with file objects (from backlinks, maps, etc.), user properties require the `.properties` accessor while built-in file properties are accessed directly:

```javascript
// Built-in properties - direct access
value.asFile().name
value.asFile().path
value.asFile().mtime

// User properties - via .properties
value.asFile().properties.propertyName
value.asFile().properties.status

// Example: Filter backlinks by property
file.backlinks.filter(value.asFile().properties.category == "important")
```

**Deep nesting example**:
```javascript
// Get property from backlinked files, transform, and aggregate
file.backlinks
  .map(value.asFile())
  .filter(value.properties.category == "important")
  .map(value.properties.priority)
  .sort()
  .reverse()[0]
```

### Null and undefined handling

**Check if property exists**:
```javascript
note.keys().contains("propertyName")

// Property exists but has no value
note.keys().contains("myProperty") && (!myProperty || myProperty == null)

// Property doesn't exist
!note.keys().contains("myProperty")
```

**Safe access patterns**:
```javascript
// Check before accessing
property && property.contains("value")

// Logical OR for fallback
property || defaultValue

// Conditional display
if(property, "Value: " + property)
if(date, date.format("YYYY-MM-DD"))
```

**Distinguish empty string from null**:
```javascript
property == ""      // Empty string
property == null    // Null/undefined
!property           // Both null AND empty string
```

**Robust list handling**:
```javascript
// Ensure list type (handles null/single values gracefully)
list(property)

// Safe length check
property ? property.length : 0
```

## Practical examples

### Daily note integration

```yaml
filters:
  or:
    - file.hasLink(this.file.name)
    - date(created).format("YYYY-MM-DD") == this.file.name

formulas:
  created_time: created.format("HH:mm")
  updated_date: if(date(updated).format("YYYY-MM-DD") != this.file.name, updated.format("YYYY-MM-DD HH:mm"))

views:
  - type: table
    name: Daily notes
    filters:
      and:
        - '!file.hasTag("daily")'
    order:
      - file.name
      - formula.created_time
```

Embed in daily notes with `![[Daily.base]]`.

### Backlinks with metadata

```yaml
filters:
  and:
    - file.hasLink(this)

properties:
  file.name:
    displayName: Note
  file.mtime:
    displayName: Modified
  tags:
    displayName: Tags

views:
  - type: table
    name: Backlinks
    sort:
      - column: file.mtime
        direction: DESC
```

Drag to sidebar for dynamic context-aware backlinks.

### Project task management

```yaml
filters:
  and:
    - file.hasTag("task")

views:
  - type: table
    name: TODAY
    filters:
      and:
        - dueDate == today()
  
  - type: table
    name: OVERDUE
    filters:
      and:
        - dueDate < today()
        - status != "completed"
  
  - type: table
    name: NEXT 7 DAYS
    filters:
      and:
        - dueDate >= today()
        - dueDate < today() + "7d"
```

### Academic paper tracker

```yaml
filters:
  and:
    - file.hasTag("paper/XAIP")

formulas:
  Paper: if(Summary == "Unread", link(file,"🟥 " + file.name), link(file,"🟩 " + file.name))
  Created: file.ctime.relative()

views:
  - type: table
    name: Reading List
    filters:
      and:
        - Summary == "Unread"
    properties:
      - formula.Paper
      - title
      - year
  
  - type: table
    name: Read Papers
    filters:
      and:
        - Summary != "Unread"
    sort:
      - column: year
        direction: DESC
```

### Parent-child note navigation

```yaml
filters:
  or:
    - Parent.toString().contains(this.file.name)
    - Parent == this.Parent
    - Related.toString().contains(this.file.name)

views:
  - type: table
    name: Child Notes
    filters:
      and:
        - Parent.toString().contains(this.file.name)
  
  - type: table
    name: Siblings
    filters:
      and:
        - Parent == this.Parent
        - file.name != this.file.name
```

Drag to sidebar for hierarchical navigation.

### "On This Day" journal

```yaml
filters:
  and:
    - file.inFolder("Journal")
    - file.name.slice(5,10) == this.file.name.slice(5,10)
    - file.name != this.file.name

views:
  - type: table
    name: On This Day
    sort:
      - column: file.name
        direction: DESC
```

Shows journal entries from same day in previous years.

## Edge cases and gotchas

### Breaking changes in v1.9.2 (June 2025)

**Major syntax overhaul** - examples before June 2025 may not work:

```javascript
// OLD (pre-v1.9.2)
taggedWith(file.file, "cat")
contains(file.name, "Books")
not(condition)
date(file.ctime) == date(now())
dateModify(date, "7d")

// NEW (v1.9.2+)
file.hasTag("cat")
file.name.contains("Books")
!condition
file.ctime.date() == today()
date + "7d"
```

Functions became methods, `not()` became `!`, and date handling was simplified.

### Property naming constraints

**Properties with spaces/special characters need brackets**:
```javascript
note["Property Name"]     // Spaces
note["My-Property"]       // Dashes
note["Property (2)"]      // Parentheses
```

**Case sensitivity is enforced** - `Property` ≠ `property`, function names are case-sensitive.

### Type-related gotchas

**Links are NOT strings** - use `.toString()` for string operations:
```javascript
// Won't match display text
list_property.filter(value.contains("MATCH"))

// Matches both note name and display text
list_property.filter(value.toString().contains("MATCH"))
```

**Duration strings must be quoted**:
```javascript
today() - "7d"    // Correct
today() - 7d      // Error
```

**Date properties need conversion**:
```javascript
property.Review == today()       // Error if property is string
date(property.Review) == today() // Correct
```

### Context behavior variations

**this.file meaning changes by context**:
- In sidebar: References currently active tab
- In embedded base: References containing note
- Multiple instances: All reference same "active" note

This can make bases appear empty when viewing the .base file itself if you filter with `this.file.ext != 'base'`.

### Performance considerations

- Complex formulas on tens of thousands of notes can slow down
- `file.backlinks` has performance impact on tables and doesn't auto-refresh
- Use global filters to reduce dataset early before applying complex view filters
- Avoid complex regex on large datasets

### Current limitations

**Bases cannot query note body content** - only YAML frontmatter properties are accessible. Inline metadata (like Dataview's `Rating:: 5`) is invisible.

**Inline editing limitations** - Can edit tags, text, numbers, dates, lists. Cannot edit file path, file name, or calculated formulas.

**View types limited** - Currently only table, cards, list, map views (as of October 2025). No calendar, board, or timeline views yet.

**No content aggregation** - Cannot pull tasks from note content or aggregate from multiple properties across notes (sum, average, etc.). These features are on the roadmap.

## Case sensitivity rules

Formulas are **strictly case-sensitive**:
- Property names: `Property` ≠ `property`
- Function names: `contains()` ≠ `Contains()`
- String comparisons: Case-sensitive by default

**Making comparisons case-insensitive**:
```javascript
title.toLowerCase().contains("obsidian")
file.name.toLowerCase() == "my note"
tags.filter(value.toLowerCase() == "book").length > 0
```

## Complete function reference

### Global functions

```javascript
// Date functions
date(string)                   // Parse date
today()                        // Current date (00:00:00)
now()                          // Current date and time

// Conditional
if(condition, trueResult, falseResult?)

// Type conversion
list(value)                    // Ensure array type
link(path, display?)           // Create link
image(source)                  // Create image object
number(string)                 // Convert to number

// Aggregation
max(...numbers)                // Maximum value
min(...numbers)                // Minimum value
```

### String methods

```javascript
.contains(substring)
.containsAll(...substrings)
.containsAny(...substrings)
.startsWith(prefix)
.endsWith(suffix)
.toLowerCase()
.toUpperCase()
.trim()
.split(separator)
.replace(pattern, replacement)
.slice(start, end?)
.toString()
```

### Number methods

```javascript
.toFixed(decimals)             // Format to decimal places
.abs()                         // Absolute value
.round()                       // Round to integer
.floor()                       // Round down
.ceil()                        // Round up
```

### Date methods

```javascript
.format(formatString)          // Moment.js format
.date()                        // Remove time component
.time()                        // Get time as string
.relative()                    // Relative time ("2 days ago")
.year, .month, .day           // Date components
.hour, .minute, .second
.weekday, .weekNumber
```

### List methods

```javascript
.contains(value)
.containsAll(...values)
.containsAny(...values)
.filter(condition)
.map(expression)
.sort()
.reverse()
.unique()
.flat()
.slice(start, end?)
.join(separator)
.length                        // Property, not method
[index]                        // Access by index
```

### Regular expression

```javascript
/pattern/.matches(string)      // Test regex match
```

## Common filter recipes

**Filter by tags**:
```javascript
file.hasTag("project")
file.hasTag("fiction", "non-fiction")  // OR logic
tags.contains("important")
```

**Filter by links**:
```javascript
file.hasLink(this)              // Backlinks
this.file.hasLink(file)         // Outlinks
property.contains(this)         // List property links to this
```

**Filter by folder**:
```javascript
file.inFolder("Projects")
file.inFolder(this.file.folder) // Same folder
file.path.contains("Work/")
```

**Filter by date**:
```javascript
file.ctime.date() == today()
file.mtime >= today() - "7d"
dueDate >= today() && dueDate < today() + "7d"
```

**Property existence**:
```javascript
myProperty                      // Has value
note.keys().contains("myProperty") && (!myProperty || myProperty == null)  // Exists but empty
!note.keys().contains("myProperty")  // Doesn't exist
```

## Official resources

- **Obsidian Help - Bases**: https://help.obsidian.md/bases
- **Bases Syntax**: https://help.obsidian.md/bases/syntax
- **Functions Reference**: https://help.obsidian.md/bases/functions
- **Create a Base**: https://help.obsidian.md/bases/create-base
- **Migration Guide**: https://forum.obsidian.md/t/bases-migration-quick-start-guide/101571

## Best practices for developers

**Use two-level filtering** - Apply broad filters globally, specific refinements per view. This reduces the dataset early and improves performance.

**Reuse complex logic in formulas** - Define once, reference everywhere to stay DRY and maintain consistency.

**Embrace context-aware bases** - Use `this.file` for dynamic sidebar bases that update as you navigate. Perfect for backlinks, related notes, and hierarchical navigation.

**Test formulas in advanced mode** - Switch to advanced mode (code view) to test complex expressions directly in YAML rather than through UI dropdowns.

**Be mindful of types** - Links, dates, and strings are distinct types. Use appropriate conversion functions (`link()`, `date()`, `.toString()`) when needed.

**Handle null gracefully** - Always check for property existence before complex operations, especially with optional properties.

This comprehensive reference reflects the Obsidian Bases syntax as of October 2025 (version 1.9.2+). The syntax is still evolving during the early access phase, so consult official documentation for the latest updates.