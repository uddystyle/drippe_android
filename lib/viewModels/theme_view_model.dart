import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  return throw UnimplementedError();
});

final appThemeProvider = ChangeNotifierProvider((ref) {
  return AppTheme(ref.watch(sharedPreferencesProvider));
});

class AppTheme extends ChangeNotifier {
  AppTheme(this._prefs);

  final SharedPreferences _prefs;

  bool getTheme() => _prefs.getBool('isDarkMode') ?? false;

  void setTheme(bool isDarkMode) {
    _prefs.setBool('isDarkMode', isDarkMode);

    notifyListeners();
  }
}
