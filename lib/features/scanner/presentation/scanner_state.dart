import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/camera_permission_status.dart';
import '../domain/scanner_mode.dart';

part 'scanner_state.freezed.dart';

@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState({
    required ScannerMode mode,
    required CameraPermissionStatus permission,
    String? errorMessage,
  }) = _ScannerState;
}
