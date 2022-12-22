part of surveyapp_models;

@freezed
class SurveyAppValidationError with _$SurveyAppValidationError {
  factory SurveyAppValidationError(
    int code,
    List<SurveyAppFieldValidationError> errors,
  ) = _SurveyAppValidationError;

  factory SurveyAppValidationError.fromJson(Map<String, dynamic> json) =>
      _$SurveyAppValidationErrorFromJson(json);
}

@freezed
class SurveyAppFieldValidationError with _$SurveyAppFieldValidationError {
  factory SurveyAppFieldValidationError(
    String key,
    List<String> errors,
  ) = _SurveyAppFieldValidationError;

  factory SurveyAppFieldValidationError.fromJson(Map<String, dynamic> json) =>
      _$SurveyAppFieldValidationErrorFromJson(json);
}

class Failure implements Exception {
  Failure({
    required this.message,
    this.errors = const [],
  });

  final String message;
  List<SurveyAppFieldValidationError> errors;

  List<String> errorMessages() {
    final messageErrors = <String>[];

    for (final messageError in errors) {
      messageErrors.add(
        messageError.errors[0],
      );
    }

    return List.castFrom<dynamic, String>(messageErrors);
  }
}
