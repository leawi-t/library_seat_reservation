import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:library_seat_reservation/features/seats/domain/seat.dart';
import 'package:library_seat_reservation/features/seats/domain/seat_repository.dart';
import 'package:library_seat_reservation/features/seats/presentation/seat_browser_screen.dart';
import 'package:library_seat_reservation/features/seats/presentation/seats_provider.dart';

void main() {
  final testSeats = [
    const Seat(
      id: 'seat-101',
      code: 'A-101',
      floorArea: 'Ground Floor',
      hasPowerOutlet: true,
      isQuietZone: true,
      isAvailable: true,
    ),
    const Seat(
      id: 'seat-102',
      code: 'A-102',
      floorArea: 'Ground Floor',
      hasPowerOutlet: false,
      isQuietZone: false,
      isAvailable: true,
    ),
  ];

  group('SeatBrowserScreen', () {
    testWidgets('displays seats returned by the repository', (tester) async {
      await _pumpSeatBrowser(tester, _FakeSeatRepository(testSeats));

      expect(find.text('A-101'), findsOneWidget);
      expect(find.text('A-102'), findsOneWidget);
      expect(find.text('Ground Floor'), findsOneWidget);
    });

    testWidgets('filters out seats without a power outlet', (tester) async {
      await _pumpSeatBrowser(tester, _FakeSeatRepository(testSeats));

      // Both seats should initially be visible.
      expect(find.text('A-101'), findsOneWidget);
      expect(find.text('A-102'), findsOneWidget);

      // Enable the Power Outlet filter.
      await tester.tap(find.widgetWithText(FilterChip, 'Power Outlet'));
      await tester.pumpAndSettle();

      expect(find.text('A-101'), findsOneWidget);
      expect(find.text('A-102'), findsNothing);
    });

    testWidgets('navigates to the selected seat detail screen', (tester) async {
      await _pumpSeatBrowser(tester, _FakeSeatRepository(testSeats));

      await tester.tap(find.text('A-101'));
      await tester.pumpAndSettle();

      expect(find.text('Seat detail: seat-101'), findsOneWidget);
    });
  });
}

/// Builds the screen with a fake repository and a test router.
Future<void> _pumpSeatBrowser(
  WidgetTester tester,
  SeatRepository repository,
) async {
  final router = GoRouter(
    initialLocation: '/seats',
    routes: [
      GoRoute(
        path: '/seats',
        builder: (context, state) => const SeatBrowserScreen(),
      ),
      GoRoute(
        path: '/seats/:seatId',
        builder: (context, state) {
          final seatId = state.pathParameters['seatId']!;
          return Scaffold(body: Center(child: Text('Seat detail: $seatId')));
        },
      ),
    ],
  );

  addTearDown(router.dispose);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [seatRepositoryProvider.overrideWith((ref) => repository)],
      child: MaterialApp.router(routerConfig: router),
    ),
  );

  await tester.pumpAndSettle();
}

/// A controlled repository implementation for widget tests.
class _FakeSeatRepository implements SeatRepository {
  _FakeSeatRepository(this._seats);

  final List<Seat> _seats;

  @override
  Future<List<Seat>> getSeats() async => _seats;

  @override
  Future<Seat?> getSeatById(String id) async {
    for (final seat in _seats) {
      if (seat.id == id) {
        return seat;
      }
    }
    return null;
  }

  @override
  Future<Seat> reserveSeat(String id) {
    throw UnimplementedError(
      'reserveSeat is not needed in these widget tests.',
    );
  }
}
