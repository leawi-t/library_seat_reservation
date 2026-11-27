# Milestone 1 — LibSpace

## What is done and what is not

### Done
- **Feature-first architecture:** Organized the codebase under `lib/core/` (`router`, `theme`, `widgets`) and `lib/features/{seats,catalog,scanner,reservations}/{domain,data,presentation}`.
- **Screens & navigation:** Implemented all 5 proposed screens (`SeatBrowserScreen`, `SeatDetailScreen`, `BookCatalogScreen`, `ScannerScreen`, and `MyReservationsScreen`) connected via `go_router` using a 4-tab `StatefulShellRoute` bottom navigation bar and parameterized detail routing (`/seats/:seatId`).
- **State & models:** Defined immutable `@freezed` domain models and Riverpod state providers backed by abstract repository and service interfaces with in-memory implementations.
- **Automated tests:** Wrote unit and widget tests covering repository operations, filter logic, reservation rollback, and screen rendering/navigation.

### Not yet done (planned for Milestone 2 & Final)
- Real local persistence (`shared_preferences`) surviving app restarts.
- Firebase Authentication and Cloud Firestore integration with emulator and security rule tests.
- Live Open Library REST API integration for book search and ISBN lookup.
- Native camera (`mobile_scanner`), local notifications (`flutter_local_notifications`), and Gemini AI API integration.
- GitHub Actions CI pipeline and `development` / `production` build flavours.

## Pull requests per member

| Member (GitHub) | Pull requests authored | Pull requests reviewed |
|---|---|---|
| Leawi Taddesse (`leawi-t`) | PR #1 (initial architecture & router scaffold), PR #2 (seats domain & repository), PR #4 (seat browser screen & filters) | PR #3 (`reservations` & `seat_detail_screen`), PR #6 (AI_USAGE.md) |
| Latera (`laterat`) | PR #3 (`reservations` feature & `seat_detail_screen`) | PR #2 (seats domain & repository), PR #4 (seat browser screen & filters) |
| Nahim (`nahim13`) | PR #5 (`feat: scanner screen (Screen 4) with permission states and manual entry`) | PR #1 (initial architecture & router scaffold), PR #7 (`catalog` feature) |
| Rame (`Ra58ad`) | PR #7 (`catalog` screen & fake AI helper) | PR #5 (`feat: scanner screen (Screen 4) with permission states and manual entry`) |

## Self-score

- **All proposed screens present and navigable (3 / 3):** All five screens from `PROPOSAL.md` (`SeatBrowserScreen`, `SeatDetailScreen`, `BookCatalogScreen`, `ScannerScreen`, and `MyReservationsScreen`) are implemented and reachable through `appRouterProvider` via the 4-tab `MainShell` bottom bar and the parameterized `/seats/:seatId` route.
- **Feature-first structure; state in providers, not widgets (2 / 2):** Every feature is separated into `domain/`, `data/`, and `presentation/` folders with `@freezed` models and repository interfaces injected through Riverpod providers (`seatsProvider`, `reservationsProvider`, `catalogProvider`, `scannerProvider`), keeping all business logic out of widget `build()` methods.
- **Tests present; analyzer and tests clean in the pasted output (1 / 1):** More than five unit and widget tests under `test/features/` pass via `flutter test`, and `flutter analyze --fatal-infos` reports zero issues on the tagged commit as shown in the output below.
- **Repository hygiene: branches, pull requests, readable history (1 / 1):** All changes were developed on descriptive `feat/*` branches and merged into `main` via peer-reviewed pull requests with every member authoring and reviewing at least one PR.
- **Individual oral check (pending — up to 3 / 3):** All four members have reviewed the shared architecture, router, and cross-feature providers in preparation for the individual lab oral check following the deadline.

## One thing our group will change before Milestone 2

Merge feature pull requests earlier in the week rather than on deadline day so cross-feature integration details (such as moving shared utilities like `clock_provider.dart` into `lib/core/`) are caught and reviewed with plenty of buffer time.

## Analyzer and test output

### `flutter analyze --fatal-infos`
```text
Analyzing library_seat_reservation...
No issues found! (ran in 9.0s)
```

### `flutter test`
```text
00:09 +51: All tests passed!
```