# UI redesign specifications

Status: Approved for implementation.

## Goals and scope

- Refresh the entire app with a modern, balanced, more colorful design using
  `material_ui`.
- Improve workflows as well as visuals. Preserve existing capabilities and
  localization, even where interactions are redesigned.
- Use consistent colors, typography, spacing, and components while keeping
  information readable and controls usable.
- Keep light and dark modes and refresh branded themes while preserving their
  recognizable identities.
- Explore improvements to main navigation while retaining the four main
  destinations: pacing, matches, teams, and settings.
- Use the pacing page's expanders and drag-and-drop as inspiration, while
  allowing its workflow to be redesigned.

## Match page

- Focus the main view on one improvisation. Provide previous and next controls
  and a list picker to jump directly to an improvisation.
- Preserve the ability to change an improvisation's position; explore a more
  convenient interaction.
- Replace the current text-heavy details card with a clearer hierarchy. Make
  the improvisation's theme, metadata, and notes easy to read.
- Use colorful chips for improvisation fields, including theme, type, and
  category, with colors assigned by metadata kind rather than by individual
  value. Show notes as text instead of a chip.
- Keep play/pause, stop, and reset controls visible on the main match view.
- When statistics are enabled, present points and penalties in compact
  team-oriented rows. Do not show these controls when statistics are disabled.
- Preserve existing match capabilities, including editing, summary,
  scoreboard, sharing, and integration-dependent actions and restrictions.

## Responsive behavior

- Support phones and tablets in portrait and landscape.
- Aim to show the timer, improvisation details, points, and every penalty
  without page scrolling for a representative match with two teams, one penalty,
  and one line of notes.
- Allow page scrolling as a last resort when content cannot reasonably fit.
  Readability and usable controls take priority, particularly on small
  viewports and with enlarged system text.
- The reference viewport for the no-scroll target is described in the
  [plan](./ui-redesign-plan.md).

## Tag input

- Redesign the shared tag input used in match, pacing, and team forms.
- Suggest existing tags inline as the user types and create new tags when the
  user submits the text.
- Display selected tags as chips with visible remove controls. Removal is
  immediate and affects only the current item, not other items using the tag.
- Preserve existing validation and stored tag data.

## Open design details

Exact layouts, palette values, responsive breakpoints, and specific workflow
changes outside the decisions above remain to be refined. Significant workflow
choices should be discussed before implementation.
