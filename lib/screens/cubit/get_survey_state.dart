part of 'get_survey_cubit.dart';

@freezed
class GetSurveyState with _$GetSurveyState {
  const factory GetSurveyState.initial() = _Initial;
  const factory GetSurveyState.loading() = _Loading;
  const factory GetSurveyState.loaded(
    String id,
    String startQuestionId,
    List<Question> questions,
    Strings strings,
  ) = _Loaded;
  const factory GetSurveyState.error(String message) = _Error;
}
