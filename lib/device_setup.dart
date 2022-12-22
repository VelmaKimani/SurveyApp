import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveyapp/l10n/l10n.dart';
import 'package:surveyapp/utils/_index.dart';

class DeviceSetUp extends StatelessWidget {
  const DeviceSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kPrimaryColor),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryBackgroundColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: SurveyAppRouter.generateRoute,
        initialRoute: SurveyAppRouter.controllerRoute,
      ),
    );
  }
}
