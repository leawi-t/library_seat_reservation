import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/scanner/data/fake_scanner_service.dart';
import 'package:library_seat_reservation/features/scanner/domain/camera_permission_status.dart';
import 'package:library_seat_reservation/features/scanner/domain/scanner_mode.dart';
import 'package:library_seat_reservation/features/scanner/presentation/scanner_provider.dart';

ProviderContainer makeContainer(CameraPermissionStatus permission) {
  final container = ProviderContainer(
    overrides: [
      scannerServiceProvider
          .overrideWithValue(FakeScannerService(initialPermission: permission)),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('denied permission becomes granted after a re-request', () async {
    final container = makeContainer(CameraPermissionStatus.denied);
    final initial = await container.read(scannerProvider.future);
    expect(initial.permission, CameraPermissionStatus.denied);

    await container.read(scannerProvider.notifier).requestPermission();

    expect(
      container.read(scannerProvider).value!.permission,
      CameraPermissionStatus.granted,
    );
  });

  test('permanently denied stays denied on re-request, settings fixes it',
      () async {
    final container = makeContainer(CameraPermissionStatus.permanentlyDenied);
    await container.read(scannerProvider.future);
    final notifier = container.read(scannerProvider.notifier);

    await notifier.requestPermission();
    expect(
      container.read(scannerProvider).value!.permission,
      CameraPermissionStatus.permanentlyDenied,
    );

    await notifier.openSettings();
    expect(
      container.read(scannerProvider).value!.permission,
      CameraPermissionStatus.granted,
    );
  });

  test('resolveCode returns the route for a valid code in each mode',
      () async {
    final container = makeContainer(CameraPermissionStatus.granted);
    await container.read(scannerProvider.future);
    final notifier = container.read(scannerProvider.notifier);

    expect(notifier.resolveCode('A-101'), '/seats/seat_a101');

    notifier.setMode(ScannerMode.bookIsbn);
    expect(notifier.resolveCode('978-1-119-80036-1'), '/catalog/9781119800361');
  });

  test('resolveCode sets an error for invalid input and clears it later',
      () async {
    final container = makeContainer(CameraPermissionStatus.granted);
    await container.read(scannerProvider.future);
    final notifier = container.read(scannerProvider.notifier);

    expect(notifier.resolveCode('hello'), isNull);
    expect(container.read(scannerProvider).value!.errorMessage, isNotNull);

    expect(notifier.resolveCode('A-101'), isNotNull);
    expect(container.read(scannerProvider).value!.errorMessage, isNull);
  });

  test('scan() resolves the simulated scan result to a route', () async {
    final container = makeContainer(CameraPermissionStatus.granted);
    await container.read(scannerProvider.future);

    final route = await container.read(scannerProvider.notifier).scan();

    expect(route, '/seats/seat_a101');
  });
}
