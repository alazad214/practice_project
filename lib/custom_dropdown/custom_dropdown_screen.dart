import 'dart:developer';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:test_project/custom_dropdown/custom_dropdown.dart';
import 'package:test_project/widgets/custom_appbar.dart';

class CustomDropdownScreen extends StatefulWidget {
  const CustomDropdownScreen({super.key});

  @override
  State<CustomDropdownScreen> createState() => _CustomDropdownScreenState();
}

class _CustomDropdownScreenState extends State<CustomDropdownScreen> {
  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: CustomAppbar(
        title: 'custom Dropdown',
        leadingVisible: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomDropdown(
              items: ["Apple", "Banana", "Orange"],
              value: "Apple",
              hintText: "Choose a fruit",
              onChanged: (value) {
                log("Selected: $value");
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await EasyLauncher.url(url: "https://pub.dev");
                },
                child: Text('Custom popup'))
          ],
        ),
      ),
    );
  }
}
