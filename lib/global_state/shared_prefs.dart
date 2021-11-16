import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsState extends ChangeNotifier {
  SharedPrefsState() {
    init();
  }

  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  late SharedPreferences _pref;
  Future<SharedPreferences> get sharedPref => _sharedPref;

  init() async {
    _pref = await _sharedPref;
  }

  Future<void> setAppLangToGerman() async {}
}
