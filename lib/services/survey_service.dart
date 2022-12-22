part of surveyapp_services;

abstract class QuestionsService {
  Future<Survey> getSurvey();
}

class QuestionsServiceImplementation implements QuestionsService {
  final _baseUrl = SurveyAppConfig.instance!.values.baseDomain;
  final _surveyUrl = SurveyAppConfig.instance!.values.surveyUrl;

  @override
  Future<Survey> getSurvey() async {
    final questionsUrl = '$_baseUrl$_surveyUrl';

    try {
      final resp = await _networkUtil.getReq(
        questionsUrl,
      );

      Logger().i(resp);

      return Survey.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
