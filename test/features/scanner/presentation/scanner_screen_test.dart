import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:library_seat_reservation/features/scanner/data/fake_scanner_service.dart';
import 'package:library_seat_reservation/features/scanner/domain/camera_permission_status.dart';
import 'package:library_seat_reservation/features/scanner/presentation/scanner_provider.dart';
import 'package:library_seat_reservation/features/scanner/presentation/scanner_screen.dart';

Future<void> pumpScanner(
  WidgetTester tester,
  CameraPermissionStatus permission,
) async {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ScannerScreen(),
      ),
      GoRoute(
        path: '/seats/:seatId',
        builder: (context, state) => Scaffold(
          body: Text('opened ${state.pathParameters['seatId']}'),
        ),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        scannerServiceProvider
            .overrideWithValue(FakeScannerService(initialPermission: permission)),
      ],
      child: MaterialApp.router(routerConfig: router),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('granted: shows the viewfinder and the manual field',
      (tester) async {
    await pumpScanner(tester, CameraPermissionStatus.granted);

    expect(find.text('Point at the desk QR code'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('denied: shows rationale, manual entry, and recovers on grant',
      (tester) async {
    await pumpScanner(tester, CameraPermissionStatus.denied);

    expect(find.text('Camera access needed'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    await tester.tap(find.text('Grant Camera Access'));
    await tester.pumpAndSettle();

    expect(find.text('Point at the desk QR code'), findsOneWidget);
  });

  testWidgets('permanently denied: offers Open App Settings', (tester) async {
    await pumpScanner(tester, CameraPermissionStatus.permanentlyDenied);

    expect(find.text('Open App Settings'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('manual seat code navigates to the seat detail route',
      (tester) async {
    await pumpScanner(tester, CameraPermissionStatus.denied);

    await tester.enterText(find.byType(TextField), 'A-101');
    await tester.tap(find.widgetWithText(FilledButton, 'Check in'));
    await tester.pumpAndSettle();

    expect(find.text('opened seat_a101'), findsOneWidget);
  });

  testWidgets('invalid manual code shows an error and does not navigate',
      (tester) async {
    await pumpScanner(tester, CameraPermissionStatus.granted);

    await tester.enterText(find.byType(TextField), 'nonsense');
    await tester.tap(find.widgetWithText(FilledButton, 'Check in'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a seat code like A-101.'), findsOneWidget);
    expect(find.byType(ScannerScreen), findsOneWidget);
  });
}
