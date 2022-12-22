import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/screens/cubit/get_survey_cubit.dart';
import 'package:surveyapp/screens/name_screen.dart';
import 'package:surveyapp/utils/_index.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  late Box<Survey> surveyResults;
  @override
  void initState() {
    context.read<GetSurveyCubit>().getSurvey();
    surveyResults = Hive.box('survey_results');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetSurveyCubit, GetSurveyState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Loading'),
            ),
            loading: () => Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 2.18,
                  color: kPrimaryColor,
                  child: const Center(
                    child: Text(
                      'WELCOME',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                )
              ],
            ),
            loaded: (id, startQuestionId, questions, strings) => NameScreen(
              questions: questions,
              strings: strings,
              surveyResults: surveyResults,
            ),
            error: (String message) {
              return const Text('Error displaying survey questions');
            },
          );
        },
      ),
    );
  }
}
