# UI redesign implementation plan

Status: Approved for implementation. Based on the
[specifications](./ui-redesign-spec.md).

## 1. Establish the design system

- Refresh shared `material_ui` colors, typography, spacing, and component
  styles for light, dark, and branded themes.
- Define accessible metadata-kind colors for chips, while preserving branded
  theme identities.
- Reuse existing shared components where practical.

## 2. Redesign the match page

- Create a focused improvisation view with previous/next controls and a list
  picker, and retain position changes.
- Give details a clearer hierarchy and use metadata chips. Keep timer controls
  visible on the main view.
- Combine points and penalties into compact team-oriented rows when statistics
  are enabled.
- Preserve existing match actions, timer behavior, and integration
  restrictions. Account for the current timer implementation and Kaisel
  navigation introduced by the recent pull.
- Adapt the layout for phone and tablet sizes and both orientations, with
  scrolling as a last resort.

## 3. Redesign tag input

- Provide inline suggestions for existing tags and create new tags on text
  submission.
- Show selected tags as removable chips across match, pacing, and team forms.
- Preserve validation and stored tag data, and ensure removing a tag affects
  only the current item.

## 4. Refresh the remaining app

- Apply the shared design system across screens.
- Improve navigation while retaining the four existing main destinations.
- Revisit workflows, including pacing, using expanders and drag-and-drop as
  inspiration. Discuss significant workflow choices before implementing them.

## 5. Validate

- Add focused widget tests for changed behavior, including match navigation,
  timer and statistics visibility, tag interactions, and responsive layouts.
- Run relevant existing tests and Flutter analysis.
- Check light, dark, and branded themes, localization, touch targets, text
  scaling, and phone and tablet layouts in both orientations.
- Verify the no-scroll goal using a representative match with two teams, one
  penalty, and one line of notes. Baseline:
  a 360 x 800 logical-pixel phone in portrait at default text scale.
- Check that scrolling remains available when content, viewport size, or
  enlarged text prevents a readable fit.
