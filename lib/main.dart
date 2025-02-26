import 'package:flutter/material.dart';
import 'package:test_project/custom_theme/app_theme.dart';
import 'package:test_project/pagination/pagination_screen.dart';
import 'custom_theme/custom_theme.dart';
import 'image_cropper/image_cropper_screen.dart';
import 'pagination/better_pagination_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    bool savedTheme = await ThemeManager.loadTheme();
    setState(() {
      _isDark = savedTheme;
    });
  }

  void _toggleTheme() async {
    setState(() {
      _isDark = !_isDark;
    });
    await ThemeManager.saveTheme(_isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home: BetterPaginationScreen());
  }
}
