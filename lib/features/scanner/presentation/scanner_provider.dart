import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_routes.dart';
import '../data/fake_scanner_service.dart';
import '../domain/camera_permission_status.dart';
import '../domain/scan_code_parser.dart';
import '../domain/scan_target.dart';
import '../domain/scanner_mode.dart';
import '../domain/scanner_service.dart';
import 'scanner_state.dart';

final scannerServiceProvider = Provider<ScannerService>((ref) {
  return FakeScannerService();
});

final scannerProvider =
    AsyncNotifierProvider<ScannerNotifier, ScannerState>(ScannerNotifier.new);

class ScannerNotifier extends AsyncNotifier<ScannerState> {
  ScannerService get _service => ref.read(scannerServiceProvider);

  @override
  Future<ScannerState> build() async {
    var permission = CameraPermissionStatus.unavailable;
    try {
      permission = await ref.watch(scannerServiceProvider).checkPermission();
    } catch (_) {
      // Hardware / platform error: fall back to manual entry.
    }
    return ScannerState(mode: ScannerMode.deskQr, permission: permission);
  }

  void _update(ScannerState Function(ScannerState current) change) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(change(current));
  }

  void setMode(ScannerMode mode) {
    _update((s) => s.copyWith(mode: mode, errorMessage: null));
  }

  void clearError() {
    _update((s) => s.copyWith(errorMessage: null));
  }

  Future<void> requestPermission() async {
    final permission = await _service.requestPermission();
    _update((s) => s.copyWith(permission: permission));
  }

  Future<void> openSettings() async {
    await _service.openSettings();
    final permission = await _service.checkPermission();
    _update((s) => s.copyWith(permission: permission));
  }

  /// Validates a typed or scanned [raw] code for the current mode.
  /// Returns the route to open, or `null` (and sets an error message).
  String? resolveCode(String raw) {
    final current = state.value;
    if (current == null) return null;

    final target = ScanCodeParser.parse(current.mode, raw);
    if (target == null) {
      final message = switch (current.mode) {
        ScannerMode.deskQr => 'Enter a seat code like A-101.',
        ScannerMode.bookIsbn => 'Enter a 10 or 13 digit ISBN.',
      };
      _update((s) => s.copyWith(errorMessage: message));
      return null;
    }

    _update((s) => s.copyWith(errorMessage: null));
    return switch (target.type) {
      ScanTargetType.seat => AppRoutes.seatDetail(target.value),
      ScanTargetType.book => AppRoutes.bookDetail(target.value),
    };
  }

  /// Runs one (simulated) camera scan and resolves its result to a route.
  Future<String?> scan() async {
    final mode = state.value?.mode;
    if (mode == null) return null;
    final code = await _service.scanCode(mode);
    if (code == null) return null;
    return resolveCode(code);
  }
}
