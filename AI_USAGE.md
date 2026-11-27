# AI usage disclosure

## Tools used

| Tool | Version / model | Used for |
|---|---|---|
| Gemini | 4 Neon | Initial scaffold architecture and placeholder screens, checking compatible library versions, planning consistent team design rules, and verifying PR consistency |
| ChatGPT | 6 Luna | Generating widget test scaffolding, understanding bugs, and reviewing file implementations |

## What was generated and where

| File / function | Member | AI-use level | What the tool produced | What we changed | How we verified it |
|---|---|---|---|---|---|
| `lib/core/router/app_router.dart` | Leawi Taddesse | 2 | Suggestions on how to improve our attempted `go_router` design | Refined the route structure and shell branches based on suggestions | Ran `flutter analyze --fatal-infos` and manually tested tab and detail navigation |
| `test/features/seats/presentation/seat_browser_screen_test.dart` | Leawi Taddesse | 3 | Drafted widget tests for `SeatBrowserScreen` to match Milestone 1 requirements | Added an extra test case and adjusted assertions to match our UI | Reviewed line by line for logical issues and ran `flutter test` and `flutter analyze --fatal-infos` |

## Which tasks did we do without an assistant first?

- **Application theme and design rules:** Planned and agreed on the Material 3 theme, spacing, and consistency rules as a team before writing code.
- **Seat domain model & repository contract:** Designed the `Seat` `@freezed` model, `SeatRepository` interface, and campus-specific in-memory seed data directly from our proposal before asking an assistant for verification.
- **Initial screen & filter implementations:** Attempted the core structure of `SeatBrowserScreen` and Riverpod filter providers first, using AI only when stuck or to verify edge cases.
- **Peer PR review:** Reviewed the `reservations` feature PR (`lib/features/reservations/`) for architecture and theme consistency before using AI as a second check.

## Problems found in AI output

- Caught generated code that used a deprecated Riverpod API incompatible with the package version in `pubspec.yaml`; updated it to the current Riverpod syntax and verified with `flutter analyze --fatal-infos`.

## Individual declaration

| Name | I wrote or reviewed and can explain these files | I entered no passwords, keys or personal data into an AI tool (yes / no) | Signature |
|---|---|---|---|
| Leawi Taddesse | **Wrote:** `lib/core/router/app_router.dart`, `lib/features/seats/` (except `seat_detail_screen.dart`), `test/features/seats/`; **Reviewed:** `lib/features/reservations/`, `test/features/reservations/` | yes | Leawi Taddesse |
| | | | |
| | | | |
| | | | |

Date: 2026-11-27