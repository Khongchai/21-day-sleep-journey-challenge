import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawwn/i18n/strings.g.dart';

class SharedPrefsState extends ChangeNotifier {
  SharedPrefsState() {
    init();
  }

  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  late SharedPreferences _pref;
  Future<SharedPreferences> get sharedPref => _sharedPref;

  String selectedLang = "";

  init() async {
    selectedLang = _pref.getString("locale") ?? "";
    if (selectedLang != "") LocaleSettings.setLocaleRaw(selectedLang);
    _pref = await _sharedPref;

    notifyListeners();
  }

  Future<void> setAppLangToGerman() async {
    LocaleSettings.setLocale(AppLocale.de);
    _pref.setString("locale", AppLocale.de.languageTag);

    notifyListeners();
  }

  Future<void> setAppLangToEnglish() async {
    LocaleSettings.setLocale(AppLocale.en);
    _pref.setString("locale", AppLocale.en.languageTag);

    notifyListeners();
  }

  String getSelectedLocale() {
    return selectedLang;
  }
}
