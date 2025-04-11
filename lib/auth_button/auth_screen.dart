import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_project/auth_button/auth_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication Screen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthButton(
                text: 'Login with Github',
                provider: AuthButtonProvider.microsoft,
                disableText: true,
                iconSide: IconSide.left,
                submit: () {
                  log('login with Github clicked');
                },
              ),
              AuthButton(
                text: 'Login with Github',
                provider: AuthButtonProvider.microsoft,
             
                iconSide: IconSide.left,
                submit: () {
                  log('login with Github clicked');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
