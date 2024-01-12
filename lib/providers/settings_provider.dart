import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  late final SharedPreferences prefs;

  void init () async{
    prefs = await SharedPreferences.getInstance();
  }

}
