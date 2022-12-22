import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/services/_index.dart';

part 'get_survey_state.dart';
part 'get_survey_cubit.freezed.dart';

class GetSurveyCubit extends Cubit<GetSurveyState> {
  GetSurveyCubit({
    required QuestionsService questionsService,
  }) : super(const GetSurveyState.initial()) {
    _questionsService = questionsService;
  }
  late QuestionsService _questionsService;

  Future<void> getSurvey() async {
    emit(const GetSurveyState.loading());
    try {
      final result = await _questionsService.getSurvey();
      Logger().i(result);

      emit(
        GetSurveyState.loaded(
          result.id,
          result.startQuestionId,
          result.questions,
          result.strings,
        ),
      );
    } on Failure catch (e) {
      emit(GetSurveyState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(const GetSurveyState.error('Failed to fetch survey'));
    }
  }
}
