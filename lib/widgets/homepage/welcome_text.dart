import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawwn/global_state/shared_prefs.dart';
import 'package:yawwn/i18n/strings.g.dart';
import 'package:yawwn/widgets/homepage/switch_language_button.dart';

class WelcomeText extends StatelessWidget {
  final String username;
  final SharedPreferences prefs;

  const WelcomeText({required this.username, required this.prefs, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPrefsState>(
      builder: (BuildContext context, value, Widget? child) => SizedBox(
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
              SwitchLanguageButton(
                  selectedLocale: value.selectedLocale,
                  languageTag: AppLocale.en.languageTag,
                  onPressed: value.setAppLocaleToEnglish),
              const Text(" | "),
              SwitchLanguageButton(
                  selectedLocale: value.selectedLocale,
                  languageTag: AppLocale.de.languageTag,
                  onPressed: value.setAppLocaleToGerman),
            ])
          ],
        ),
      ),
    );
  }
}
