import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/i18n/strings.g.dart';

class WelcomeText extends StatelessWidget {
  final String username;
  final SharedPreferences prefs;

  const WelcomeText({required this.username, required this.prefs, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLocale = prefs.getString("locale");
    return SizedBox(
      width: 1 / 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t.welcome_text.title,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Text(t.welcome_text.greeting(username: username),
              style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(t.welcome_text.description1),
          const SizedBox(height: 10),
          Text(t.welcome_text.description2),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                LocaleSettings.setLocale(AppLocale.en);
                prefs.setString("locale", AppLocale.en.languageTag);
              },
              child: Text("en",
                  style: TextStyle(
                      color: selectedLocale == AppLocale.en.languageTag
                          ? appColors.accent
                          : appColors.primary)),
            ),
            const Text(" | "),
            TextButton(
              onPressed: () {
                LocaleSettings.setLocale(AppLocale.de);
                prefs.setString("locale", AppLocale.de.languageTag);
              },
              child: Text("de",
                  style: TextStyle(
                      color: selectedLocale == AppLocale.de.languageTag
                          ? appColors.accent
                          : appColors.primary)),
            )
          ])
        ],
      ),
    );
  }
}
