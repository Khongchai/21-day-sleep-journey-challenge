import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawwn/i18n/strings.g.dart';

class SharedPrefsState extends ChangeNotifier {
  SharedPrefsState() {
    init();
  }

  static const _localeKey = "locale";
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  Future<SharedPreferences> get sharedPref => _sharedPref;

  late SharedPreferences _pref;

  String defaultLocale = "en";
  String _selectedLocale = "en";
  String get selectedLocale => _selectedLocale;

  init() async {
    _pref = await _sharedPref;

    _selectedLocale = _pref.getString(_localeKey) ?? defaultLocale;
    LocaleSettings.setLocaleRaw(_selectedLocale);

    notifyListeners();
  }

  Future<void> setAppLocaleToGerman() async {
    switchLang(AppLocale.de);

    notifyListeners();
  }

  Future<void> setAppLocaleToEnglish() async {
    switchLang(AppLocale.en);
  }

  String getSelectedLocale() {
    return _selectedLocale;
  }

  void switchLang(AppLocale locale) {
    LocaleSettings.setLocale(locale);
    _pref.setString(_localeKey, locale.languageTag);
    _selectedLocale = locale.languageTag;

    notifyListeners();
  }
}
