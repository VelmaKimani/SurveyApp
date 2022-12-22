part of surveyapp_utils;

class Singletons {
  static final _questionsService = QuestionsServiceImplementation();

  static List<BlocProvider> registerCubits() => <BlocProvider>[
        BlocProvider<GetSurveyCubit>(
          create: (context) => GetSurveyCubit(
            questionsService: _questionsService,
          ),
        ),
      ];
}
