import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeChangeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const ThemeChangeScreen({super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    log('build---');
    return Scaffold(
      appBar: AppBar(title: Text('Theme Toggle Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleTheme,
          child: Text(isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
        ),
      ),
    );
  }
}
