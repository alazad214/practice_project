import 'package:flutter/material.dart';
import 'package:test_project/html_to_text/html_text_convert_screen.dart';
import 'package:toastification/toastification.dart';
import 'custom_theme/custom_theme.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
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
          debugShowCheckedModeBanner: false, home: HtmlTextConvertScreen()),
    );
  }
}
