import '../domain/camera_permission_status.dart';
import '../domain/scanner_mode.dart';
import '../domain/scanner_service.dart';

/// In-memory scanner that simulates camera permission states.
class FakeScannerService implements ScannerService {
    FakeScannerService({
    CameraPermissionStatus initialPermission = CameraPermissionStatus.granted,
  }) : _permission = initialPermission;

  CameraPermissionStatus _permission;

  @override
  Future<CameraPermissionStatus> checkPermission() async => _permission;

  /// `denied` can be re-requested and becomes granted; `permanentlyDenied`
  /// and `unavailable` stay as they are, like on a real device.
  @override
  Future<CameraPermissionStatus> requestPermission() async {
    if (_permission == CameraPermissionStatus.denied) {
      _permission = CameraPermissionStatus.granted;
    }
    return _permission;
  }

  /// Simulates the user enabling the camera in system settings.
  @override
  Future<void> openSettings() async {
    if (_permission == CameraPermissionStatus.permanentlyDenied) {
      _permission = CameraPermissionStatus.granted;
    }
  }

  @override
  Future<String?> scanCode(ScannerMode mode) async {
    return switch (mode) {
      ScannerMode.deskQr => 'SEAT-A-101',
      ScannerMode.bookIsbn => '9781119800361',
    };
  }
}
