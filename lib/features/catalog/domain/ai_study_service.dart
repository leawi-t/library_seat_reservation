import 'ai_study_summary.dart';
import 'book_item.dart';

abstract interface class AiStudyService {
  /// True when book metadata and the study topic leave the device.
  bool get sendsDataOffDevice;

  Future<AiStudySummary> generateSummary({
    required BookItem book,
    required String topic,
  });
}
