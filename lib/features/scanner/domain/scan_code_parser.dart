import 'scan_target.dart';
import 'scanner_mode.dart';

/// Pure parsing of scanned / typed codes. No Flutter, no state.
final class ScanCodeParser {
  const ScanCodeParser._();

  // "B-01", "b01", "A-101" or "SEAT-A-101" (what a desk QR encodes).
  static final RegExp _seatPattern = RegExp(r'^(?:SEAT-)?([A-Z])-?(\d{2,3})$');

  // ISBN-13 (13 digits) or ISBN-10 (9 digits + digit or X).
  static final RegExp _isbnPattern = RegExp(r'^(?:\d{13}|\d{9}[\dX])$');

  static final RegExp _isbnSeparators = RegExp(r'[\s-]');

  /// Returns the target for [raw] in the given [mode], or `null` if invalid.
  static ScanTarget? parse(ScannerMode mode, String raw) {
    final cleaned = raw.trim().toUpperCase();
    return switch (mode) {
      ScannerMode.deskQr => _parseSeat(cleaned),
      ScannerMode.bookIsbn => _parseIsbn(cleaned),
    };
  }

  static ScanTarget? _parseSeat(String code) {
    final match = _seatPattern.firstMatch(code);
    if (match == null) return null;
    final id = 'seat_${match.group(1)!.toLowerCase()}${match.group(2)}';
    return ScanTarget(type: ScanTargetType.seat, value: id);
  }

  static ScanTarget? _parseIsbn(String code) {
    final isbn = code.replaceAll(_isbnSeparators, '');
    if (!_isbnPattern.hasMatch(isbn)) return null;
    return ScanTarget(type: ScanTargetType.book, value: isbn);
  }
}
