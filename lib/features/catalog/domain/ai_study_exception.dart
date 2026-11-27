/// Failure types emitted by [AiStudyService] so the UI can switch exhaustively
/// and display actionable recovery states.
sealed class AiStudyException implements Exception {
  const AiStudyException(this.message);

  final String message;

  bool get canRetry;

  @override
  String toString() => message;
}

final class AiTimeoutException extends AiStudyException {
  const AiTimeoutException([
    super.message =
        'The AI study helper took too long to respond. Please retry.',
  ]);

  @override
  bool get canRetry => true;
}

final class AiSafetyBlockedException extends AiStudyException {
  const AiSafetyBlockedException([
    super.message =
        'This topic could not be summarized due to safety filters. Try rephrasing your topic.',
  ]);

  @override
  bool get canRetry => false;
}

final class AiMalformedOutputException extends AiStudyException {
  const AiMalformedOutputException([
    super.message =
        'The AI returned an incomplete summary that could not be read. Please retry.',
  ]);

  @override
  bool get canRetry => true;
}

final class AiNetworkException extends AiStudyException {
  const AiNetworkException([
    super.message =
        'Could not reach the AI study helper. Check your connection and try again.',
  ]);

  @override
  bool get canRetry => true;
}
