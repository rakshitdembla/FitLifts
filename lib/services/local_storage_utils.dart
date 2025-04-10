import 'package:fitlifts/core/constants/my_strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
    // Secure Storage Utilities
  static Future<void> saveToken(String tokenValue) async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: MyStrings.savedToken, value: tokenValue);
  }

  static Future<String?> getToken() async {
    final secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: MyStrings.savedToken);
  }

  static Future<void> deleteToken() async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: MyStrings.savedToken);
  }

  // SharedPreferences Utilities
  static Future<double> getLocalBodyWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(MyStrings.savedBodyWeight) ?? 75.00;
  }

  static Future<void> saveLocalBodyWeight(double bodyWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(MyStrings.savedBodyWeight, bodyWeight);
  }

  static Future<int> getLastSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(MyStrings.savedSteps) ?? 0;
  }

  static Future<void> saveLastSteps(int dbSteps) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(MyStrings.savedSteps, dbSteps);
  }

  static Future<void> saveTheme(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(MyStrings.savedTheme, isDarkTheme);
  }

  static Future<bool?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(MyStrings.savedTheme);
  }
}