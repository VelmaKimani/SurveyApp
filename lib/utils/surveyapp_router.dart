part of surveyapp_utils;

class SurveyAppRouter {
  static const String controllerRoute = '/';
  static const String nameRoute = '/nameRoute';
  static const String genderRoute = '/genderRoute';
  static const String farmSizeRoute = '/farmSizeRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case controllerRoute:
        return _route(
          const ControllerScreen(),
        );
      case nameRoute:
        final strings = args as Strings?;
        final questions = args as List<Question>?;
        final surveyResults = args as Box?;
        return _route(
          NameScreen(
            strings: strings!,
            questions: questions!,
            surveyResults: surveyResults!,
          ),
        );
      case genderRoute:
        final argsItems = args as List<Object>?;
        final questions = argsItems?[0] as List<Question>?;
        final strings = argsItems?[1] as Strings?;
        final surveyResults = argsItems?[2] as Box?;
        return _route(
          GenderScreen(
            strings: strings!,
            questions: questions!,
            surveyResults: surveyResults!,
          ),
        );
      case farmSizeRoute:
        final argsItems = args as List<Object>?;
        final questions = argsItems?[0] as List<Question>?;
        final strings = argsItems?[1] as Strings?;
        final surveyResults = argsItems?[2] as Box?;
        return _route(
          FarmSizesScreen(
            questions: questions!,
            strings: strings!,
            surveyResults: surveyResults!,
          ),
        );
      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('MoneyApp'),
            ),
            body: const Center(
              child: Text('MoneyApp'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _route(Widget page) {
    return CupertinoPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
    );
  }
}
