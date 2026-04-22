# Breadfast Design Skill — Changelog

---

## V1.2 — 2026-04-21

### Structure
- Split components into separate files under `components/`
  - `nav-bar.md` — AdminNav, NAV_ITEMS, App Shell
  - `buttons.md` — Primary, Secondary, Text
  - `inputs.md` — Input, Search, Dropdown/Filter
  - `data-display.md` — Table, Card, Badge, Empty State
- Added "Step 2 — Load Component Files" table to `SKILL.md`
- `SKILL.md` is now a lightweight index (320 lines, down from 805)

### Layout
- Reorganized `SKILL.md` into numbered sections (1–8)
- Moved Typography earlier (section 3) — needed before components
- Merged orphaned Brand Identity bullets into a clean summary table
- Removed duplicate `---` dividers
- Moved Do's and Don'ts to the end (section 8)

### Components
- Replaced emoji `🔍` and `▾` in nav/dropdown with Ant Design icons (`<SearchOutlined />`, `<DownOutlined />`)
- Added `<InboxOutlined />` to Empty State component
- Added filter row layout example to `inputs.md`
- Added action cell example to data table in `data-display.md`
- Added scheduled empty state variant to `data-display.md`

---

## V1.1 — 2026-04-21

### Nav Bar
- Replaced custom hand-rolled sidebar with real Breadfast admin nav bar extracted from live product HTML
- Added complete `NAV_ITEMS` array — 40 nav entries with exact labels, route keys, submenu keys, and Ant icons
- Switched to Ant Design `<Menu theme="dark" mode="inline">` component
- Updated First Step block to ask for `activeKey` and `openKey` instead of folder/sub-page
- Nav bar now correctly named "Breadfast admin panel navigation bar" (not "sidebar")

### Icons
- Added Ant Design Icons as the standard icon library
- Added install instructions, import pattern, sizing table, and common icon map (24 entries)
- Added two usage examples (button with icon, table actions)

### First Step
- Added mandatory pre-build gate: ask about nav bar before writing any code
- If yes → ask for section + page name in the same message
- If user already mentioned section/page → confirm before building

---

## V1.0 — 2026-04-21

### Initial release
- Brand identity tokens (colors, typography, spacing, radius, borders)
- CSS variables block
- React component patterns: Button (Primary, Secondary, Text), Card, Input, Search, Dropdown, Table, Badge, Empty State
- Custom hand-rolled sidebar navigation component
- Do's and Don'ts
