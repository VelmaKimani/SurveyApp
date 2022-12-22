import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/bootstrap.dart';
import 'package:surveyapp/device_setup.dart';
import 'package:surveyapp/utils/_index.dart';

Future<void> main() async {
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
