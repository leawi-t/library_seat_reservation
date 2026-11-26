import '../domain/ai_study_service.dart';

class FakeAiStudyService implements AiStudyService {
  @override
  Future<String> generateSummary({
    required String isbn,
    required String topic,
  }) async {
    return 'Summary for topic "$topic" (ISBN: $isbn)';
  }
}
