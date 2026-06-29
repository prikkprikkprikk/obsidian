# Bases Concepts & How to Help

Conceptual background for Obsidian Bases. Read this when helping the user *design* a base or reason about what Bases can/can't do — the syntax details live in `SKILL.md` and `FUNCTIONS_REFERENCE.md`.

## What Bases Are

Bases provide **query-based database views** over notes. Think of them as saved searches that display filtered notes in table or card layouts.

**Critical architectural concept:** Bases use a **filter paradigm**, not a container paradigm like Notion databases.

- Every Base starts with ALL notes in the vault
- Filters narrow down which notes appear
- Notes don't "belong to" a Base — they match (or don't match) filter criteria
- The same note can appear in multiple Bases simultaneously
- No note creation from within Base views (notes must be created separately)

## Core Concepts

### Filter-First Thinking
- User creates notes first → Base filters display them
- NOT: create database → add items to it
- Filters query across all vault files using properties in YAML frontmatter

### Context-Aware Features
- `this.file` enables dynamic filtering based on the currently open note
- Embedded Bases can show different content depending on which note contains them
- This is unique to Obsidian — Notion can't do this

### Property System
- All properties are stored in YAML frontmatter in note files
- Properties are vault-wide, not Base-specific
- Built-in file properties and custom properties (Text, Number, Checkbox, Date, Date & Time, List, Links) — see `SKILL.md` for the file-property reference

## How to Help With Bases

### Creating a Base
1. Help identify which existing notes the user wants to view
2. Determine filtering criteria (folder, tags, properties)
3. Start simple (tag-based or folder-based filters) before complex formulas
4. Remind that notes must exist first — suggest templates if needed

### Notion-Like Workflows — current limitations
- No kanban, calendar, or timeline views (yet — on roadmap)
- No inline note creation from a Base view
- No formal Relation/Rollup properties
- No collaboration features

Workarounds:
- Templater/QuickAdd for quick note creation with properties
- Formulas and links for relationships between notes
- Card view + status property as the closest kanban substitute
- Tasks or Dataview plugins for features Bases lacks

### Formulas
- JavaScript-like syntax; can reference other properties, calculate, query relationships
- Advanced feature — offer simple examples first
- Remember `this.file` for context-aware formulas in embedded Bases

## Common Workflows to Support

- **Project/Task Management** — filter by folder/tags; checkbox properties for status; multiple views (All, Active, Completed)
- **Content/Reading Lists** — tag-based filtering; date properties (started, finished); card view with image properties; embed in MOCs/index notes
- **Personal CRM/Contacts** — person notes with properties (company, role, last contact); link properties to connect people to projects
- **Research/Literature Notes** — filter by topic tags or folder; date properties; backlinks and formulas for related notes; embed in research notes for context-aware displays

## Bases vs Notion (for context)

| Feature | Notion | Obsidian Bases |
|---------|--------|----------------|
| Paradigm | Container (add items TO database) | Filter (query ACROSS all notes) |
| View Types | 7+ (table, kanban, calendar, timeline, list, gallery, chart) | table, cards, list, map — more coming |
| Note Creation | Create directly in database view | Must create separately, then appears in Base |
| Relationships | Formal Relation + Rollup properties | Manual via links + formulas |
| Collaboration | Built-in real-time | Personal use only |
| Performance | Slows with large databases | Fast even with 10,000+ notes |
| Data Storage | Cloud, proprietary | Local, plain Markdown |
| Context-Aware | No | Yes (`this.file`) |

## Conceptual Troubleshooting

**"My note isn't showing in the Base"**
- Check if the note matches ALL filter criteria
- Verify properties are in YAML frontmatter
- Check "All views" filters vs "This view" filters
- Confirm property names match exactly (case-sensitive)

**"I want to create a note from the Base"**
- Not possible currently — intentional design
- Suggest a template via Command Palette or QuickAdd; ensure the template includes the properties the Base filters on

**"Can I do X like in Notion?"**
- Check the comparison table above
- View-type gaps (kanban, grouping) → mention roadmap
- Collaboration → Obsidian is personal-first
- Relations/rollups → formulas + links workaround

## High-Level Principles

1. **Always check if the user's notes exist** before suggesting Base filters
2. **Start simple** (tags/folders) before complex formulas
3. **Bases are views, not containers** — reinforce this mental model
4. **Can't create from a Base** — the biggest workflow difference from Notion
5. **Speed is a feature** — Bases are fast even on large vaults
6. **Plain text is forever** — emphasize data portability when relevant

## Version Notes

- Bases is a core plugin (released v1.9.10, Aug 2025).
- **Breaking changes in v1.9.2 (June 2025)** shifted from functional syntax to object-oriented method chaining: `contains(file.name, "Books")` → `file.name.contains("Books")`; `not()` → `!`; date functions simplified. All skill examples use post-v1.9.2 syntax.
