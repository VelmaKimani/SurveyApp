part of surveyapp_models;

@freezed
class Survey with _$Survey {
  @HiveType(typeId: 0, adapterName: 'survey_results')
  factory Survey(
    @HiveField(1) String id,
    @HiveField(2) @JsonKey(name: 'start_question_id') String startQuestionId,
    @HiveField(3) List<Question> questions,
    @HiveField(4) Strings strings,
  ) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}

@freezed
class Question with _$Question {
  factory Question(
    String id,
    @JsonKey(name: 'question_type') String questionType,
    @JsonKey(name: 'answer_type') String answerType,
    @JsonKey(name: 'question_text') String questionText,
    List<Option> options,
    String? next,
  ) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Option with _$Option {
  factory Option(
    String value,
    @JsonKey(name: 'display_text') String displayText,
  ) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
class Strings with _$Strings {
  factory Strings(
    En en,
  ) = _Strings;

  factory Strings.fromJson(Map<String, dynamic> json) =>
      _$StringsFromJson(json);
}

@freezed
class En with _$En {
  factory En(
    @JsonKey(name: 'q_farmer_name') String qFarmerName,
    @JsonKey(name: 'q_farmer_gender') String qFarmerGender,
    @JsonKey(name: 'opt_male') String optMale,
    @JsonKey(name: 'opt_female') String optFemale,
    @JsonKey(name: 'opt_other') String optOther,
    @JsonKey(name: 'q_size_of_farm') String qSizeOfFarm,
  ) = _En;

  factory En.fromJson(Map<String, dynamic> json) => _$EnFromJson(json);
}
