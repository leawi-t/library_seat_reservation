import 'camera_permission_status.dart';
import 'scanner_mode.dart';

/// Abstraction over the device camera scanner.
///
/// Milestone 1 uses [FakeScannerService]; the real `mobile_scanner` +
/// `permission_handler` implementation replaces it in the final submission.
abstract class ScannerService {
  Future<CameraPermissionStatus> checkPermission();

  Future<CameraPermissionStatus> requestPermission();

  /// Opens the OS app-settings page (for permanently denied permission).
  Future<void> openSettings();

  /// Returns the next scanned code, or `null` if nothing was scanned.
  /// [mode] tells a real scanner which barcode formats to accept.
  Future<String?> scanCode(ScannerMode mode);
}
