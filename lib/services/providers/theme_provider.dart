import 'package:fitlifts/services/local_storage_utils.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;

  bool _isDarkTheme =
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? true
          : false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeProvider() {
    checkTheme();
  }

  void checkTheme() async {
    final savedTheme = await LocalStorageUtils.getTheme();

    if (savedTheme != null) {
      _isDarkTheme = savedTheme;
    }

    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toogleTheme(bool value) async {
    _isDarkTheme = value;
    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    await LocalStorageUtils.saveTheme(_isDarkTheme);
    notifyListeners();
  }
}
