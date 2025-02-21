import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static const String _themeKey = "themeMode";

  // Save the selected theme
  static Future<void> saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  // Load theme from storage
  static Future<bool> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false; // Default to light mode
  }
}
