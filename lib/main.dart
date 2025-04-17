import 'package:flutter/material.dart';
import 'package:test_project/advanced_product_design/product_screen.dart';
import 'package:toastification/toastification.dart';
import 'custom_theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
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

  void toggleTheme() async {
    setState(() {
      _isDark = !_isDark;
    });
    await ThemeManager.saveTheme(_isDark);
  }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        // themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home: ProductListWithAdsScreen(),
      ),
    );
  }
}
