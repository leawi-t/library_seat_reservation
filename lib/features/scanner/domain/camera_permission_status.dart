/// The camera permission outcomes the scanner screen must handle.
enum CameraPermissionStatus {
  granted,
  denied,
  permanentlyDenied,

  /// No usable camera (emulator, hardware error, restricted device).
  unavailable,
}
