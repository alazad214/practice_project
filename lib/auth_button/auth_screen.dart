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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to the Authentication Screen!'),
              const SizedBox(height: 20),
              AuthButton(
                text: 'Login with Github',
                iconSide: IconSide.right,
                disableIcon: false,
                disableText: false,
                borderWidth: 2,
                iconSize: 34,
                provider: AuthButtonProvider.github,
                submit: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
