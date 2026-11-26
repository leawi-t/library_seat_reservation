import '../domain/scanner_service.dart';

class FakeScannerService implements ScannerService {
  @override
  Future<String?> scanCode() async {
    return 'SEAT-A-101';
  }
}
