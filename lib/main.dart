import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:provider/provider.dart";
import 'package:yawwn/constants/navigation/routes.dart';
import 'package:yawwn/global_state/shared_prefs.dart';
import 'package:yawwn/pages/authentication/authentication.dart';

import 'global_state/user_related_state.dart';
import 'i18n/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserRelatedState()),
    ChangeNotifierProvider(create: (_) => SharedPrefsState())
  ], child: TranslationProvider(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yawwn",
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
            button: TextStyle(color: Colors.white),
            bodyText1: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            bodyText2: TextStyle(
                color: Colors.white,
                height: 1.4,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            caption: TextStyle(color: Color(0xffB0ABC7)),
          ),
          primaryColor: const Color(0xFF084FFF),
          backgroundColor: const Color(0xFF291467)),
      initialRoute: Authentication.screenName,
      routes: routes,
    );
  }
}
