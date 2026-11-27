# AI usage disclosure

## Tools used

| Tool | Version / model | Used for |
|---|---|---|
| Gemini | 2.5 Pro | Helped plan folder structure, suggested library versions, explained go_router shell routes |
| ChatGPT | 4o | Helped write test boilerplate and explained a Riverpod bug I couldn't figure out |

## What was generated and where

| File / function | Member | AI-use level | What the tool produced | What we changed | How we verified it |
|---|---|---|---|---|---|
| `lib/core/router/app_router.dart` | Leawi Taddesse | 2 | Suggested how to nest shell routes in go_router after I had a broken attempt | Kept the structure but rewrote the actual routes to match our screens | Manually navigated every tab and detail screen, ran `flutter analyze --fatal-infos` |
| `test/features/seats/presentation/seat_browser_screen_test.dart` | Leawi Taddesse | 3 | Generated a first draft of widget tests | Added a missing test case and fixed the assertions because they didn't match our actual widget text | Read through it line by line, ran `flutter test` |
| `lib/features/catalog/domain/` (all files) | Rame Mahamat | 3 | Gave me a skeleton for the `@freezed` models and repository interfaces | Had to add the helper methods myself (`matchesQuery`, `validated`, `toMarkdown`) because AI left them out, and I fixed the field names to match the wireframes | Unit tested every helper, ran `flutter analyze --fatal-infos` |
| `lib/features/catalog/data/` (all files) | Rame Mahamat | 3 | Drafted the in-memory repo classes | Wrote all the seed data myself (books, notes) since AI just put in placeholder strings; also added the `FakeAiOutcome` enum it didn't think of | Wrote tests for each repo class, caught a sorting bug in the notes repo and fixed it |
| `lib/features/catalog/presentation/` (providers) | Rame Mahamat | 3 | Gave me the Riverpod provider structure | The `aiConsentProvider` it generated was a standalone Notifier which broke the sync with the AI toggle on Screen 2 — replaced it with a derived `Provider<bool>` reading `userPreferencesProvider` | Ran all tests after integrating with the main branch merge, caught a stale provider reference and fixed it |
| `lib/features/catalog/presentation/` (screens + widgets) | Rame Mahamat | 3 | Generated rough screen layouts from my description of the wireframes | Redid the spacing, chips, and all the error state text to actually match the designs; AI also didn't handle the scroll overflow on the AI summary screen buttons | Widget tests at 360×800 passed with no overflow, `flutter test` all green |

## Which tasks did we do without an assistant first?

- **Team design rules:** We agreed on the Material 3 theme, spacing constants, and color palette as a team before touching code or asking AI anything.
- **Domain modelling:** I (Rame) designed the `BookItem`, `StudyNote`, and `AiStudySummary` models from the proposal on my own first — only asked AI to suggest the `@freezed` syntax after I had the fields figured out.
- **Seat browser filter logic:** Leawi wrote the filter chip state and seat grid logic himself; asked AI later only to double-check the Riverpod `select` usage.
- **PR reviews:** We reviewed each other's PRs ourselves before merging, without AI.

## Problems found in AI output

- Generated `aiConsentProvider` as a standalone `StateNotifier<bool>` — this meant the toggle on the booking screen and the consent modal were out of sync. Had to change it to read from `userPreferencesProvider` instead.
- Generated a Riverpod `watch` call inside a button callback instead of `read` — broke reactivity rules. Fixed before committing.
- Left placeholder strings like `"TODO: add books here"` in seed data — wrote all 8 books and 2 notes manually.

## Individual declaration

| Name | I wrote or reviewed and can explain these files | I entered no passwords, keys or personal data into an AI tool (yes / no) | Signature |
|---|---|---|---|
| Leawi Taddesse | **Wrote:** `lib/core/router/app_router.dart`, `lib/features/seats/` (except `seat_detail_screen.dart`), `test/features/seats/`; **Reviewed:** `lib/features/reservations/`, `test/features/reservations/` | yes | Leawi Taddesse |
| Rame Mahamat | **Wrote:** `lib/features/catalog/` (all domain, data, presentation), `test/features/catalog/`; **Reviewed:** `lib/features/reservations/presentation/my_reservations_screen.dart` | yes | Rame Mahamat |
| | | | |
| | | | |

Date: 2026-11-27
