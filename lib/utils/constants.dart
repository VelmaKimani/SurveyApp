part of surveyapp_utils;

class SurveyAppValues {
  SurveyAppValues({
    required this.baseDomain,
    this.surveyUrl = '/d628facc-ec18-431d-a8fc-9c096e00709a',
  });

  final String baseDomain;
  final String? surveyUrl;
}

class SurveyAppConfig {
  factory SurveyAppConfig({required SurveyAppValues values}) {
    return _instance ??= SurveyAppConfig._internal(values);
  }

  SurveyAppConfig._internal(this.values);

  final SurveyAppValues values;
  static SurveyAppConfig? _instance;

  static SurveyAppConfig? get instance => _instance;
}
