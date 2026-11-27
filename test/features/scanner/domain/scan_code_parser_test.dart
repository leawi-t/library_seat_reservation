import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/scanner/domain/scan_code_parser.dart';
import 'package:library_seat_reservation/features/scanner/domain/scan_target.dart';
import 'package:library_seat_reservation/features/scanner/domain/scanner_mode.dart';

void main() {
  group('ScanCodeParser desk codes', () {
    test('accepts typed, lowercase and QR-prefixed seat codes', () {
      const expectedB01 =
          ScanTarget(type: ScanTargetType.seat, value: 'seat_b01');
      expect(ScanCodeParser.parse(ScannerMode.deskQr, 'B-01'), expectedB01);
      expect(ScanCodeParser.parse(ScannerMode.deskQr, ' b01 '), expectedB01);
      expect(
        ScanCodeParser.parse(ScannerMode.deskQr, 'SEAT-A-101'),
        const ScanTarget(type: ScanTargetType.seat, value: 'seat_a101'),
      );
    });

    test('rejects codes that are not seat codes', () {
      expect(ScanCodeParser.parse(ScannerMode.deskQr, ''), isNull);
      expect(ScanCodeParser.parse(ScannerMode.deskQr, 'hello'), isNull);
      expect(ScanCodeParser.parse(ScannerMode.deskQr, '9781119800361'), isNull);
    });
  });

  group('ScanCodeParser ISBN codes', () {
    test('accepts ISBN-13 and ISBN-10, ignoring hyphens and spaces', () {
      expect(
        ScanCodeParser.parse(ScannerMode.bookIsbn, '978-1-119-80036-1'),
        const ScanTarget(type: ScanTargetType.book, value: '9781119800361'),
      );
      expect(
        ScanCodeParser.parse(ScannerMode.bookIsbn, '0-306-40615-x'),
        const ScanTarget(type: ScanTargetType.book, value: '030640615X'),
      );
    });

    test('rejects wrong length and non-numeric input', () {
      expect(ScanCodeParser.parse(ScannerMode.bookIsbn, '12345'), isNull);
      expect(ScanCodeParser.parse(ScannerMode.bookIsbn, 'B-01'), isNull);
    });
  });
}
