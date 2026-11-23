import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/fake_scanner_service.dart';
import '../domain/scanner_service.dart';

final scannerServiceProvider = Provider<ScannerService>((ref) {
  return FakeScannerService();
});
