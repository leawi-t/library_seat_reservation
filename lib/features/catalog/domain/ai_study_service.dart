abstract class AiStudyService {
  Future<String> generateSummary({
    required String isbn,
    required String topic,
  });
}
