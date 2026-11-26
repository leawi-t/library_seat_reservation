import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/app.dart';

void main() {
  testWidgets('App smoke test loads Seat Browser screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Library Seats'), findsOneWidget);
    expect(find.text('Seat Browser (Screen 1)'), findsOneWidget);
  });
}
