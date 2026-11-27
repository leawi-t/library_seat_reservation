import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_target.freezed.dart';

enum ScanTargetType { seat, book }

/// The thing a scanned or manually typed code points to.
///
/// For [ScanTargetType.seat], [value] is the seat id (e.g. `seat_b01`).
/// For [ScanTargetType.book], [value] is the normalised ISBN.
@freezed
abstract class ScanTarget with _$ScanTarget {
  const factory ScanTarget({
    required ScanTargetType type,
    required String value,
  }) = _ScanTarget;
}
