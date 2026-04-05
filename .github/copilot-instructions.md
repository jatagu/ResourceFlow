# ResourceFlow AL Coding Instructions

## Project Structure
- Keep all AL source files under `src/`.
- Use categorized folders:
  - `src/Tables`
  - `src/TableExtensions`
  - `src/Pages`
  - `src/PageExtensions`
  - `src/Enums`
  - `src/Codeunits`
  - `src/PermissionSets`
  - `src/Translations`

## Naming Convention
- File names must be explicit and type-based: `<Entity><Type>.al`.
- Examples:
  - Table: `JobTaskTable.al`
  - Table extension: `JobTaskTableExtension.al`
  - Page: `JobTaskListPage.al`
  - Enum: `TaskStatusEnum.al`
  - Codeunit: `PlanningCodeunit.al`

## Object IDs
- Use object IDs from `59100` onward.
- IDs must run per categorized folder (per object type), not globally across all folders.
- Each folder starts from `59100`.
- Example: `src/Tables` starts `59100...`, `src/Pages` starts `59100...`, `src/Enums` starts `59100...`.
- Keep IDs running consistently inside each folder and avoid gaps when possible.
- In table extensions, field IDs start from `1` and continue locally within the extension.
- If field IDs clash with existing fields from dependent apps, continue from the next available free field ID.

## Validation Rules
- Implement business validations in `OnValidate` triggers where relevant.
- Prefer explicit and user-friendly `Error(...)` messages.

## Localization
- Keep XLF translation files in `src/Translations`.
- Add trans-units for user-facing captions and option values.
