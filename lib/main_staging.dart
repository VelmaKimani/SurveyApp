import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surveyapp/bootstrap.dart';
import 'package:surveyapp/device_setup.dart';
import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/utils/_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(survey_results());
  await Hive.openBox<Survey>('survey_results');

  SurveyAppConfig(
    values: SurveyAppValues(
      baseDomain: 'https://run.mocky.io/v3',
    ),
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await bootstrap(
    () => DevicePreview(
      enabled: false,
      builder: (context) => MultiBlocProvider(
        providers: Singletons.registerCubits(),
        child: const DeviceSetUp(),
      ),
    ),
  );
}
