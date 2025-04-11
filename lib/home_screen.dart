import 'package:flutter/material.dart';
import 'package:styled_button/styled_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text(
            'Styled Button',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.google,
                text: 'Login With Google',
                buttonColor: Colors.lightGreenAccent,
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.facebook,
                text: 'Login With Facebook',
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.microsoft,
                text: 'Login With Microsoft',
                buttonColor: Colors.teal,
                textColor: Colors.white,
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.apple,
                text: 'Login With Apple',
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.instagram,
                text: 'Login With Instagram',
                iconSide: IconSide.right,
                buttonColor: Colors.limeAccent,
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.linkedin,
                text: 'Login With Linkedin',
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.twitter,
                text: 'Login With X',
                buttonColor: Colors.grey,
                isBorder: false,
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.discord,
                text: 'Login With Discord',
                borderRadius: 100,
              ),
              SizedBox(height: 10),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.phone,
                text: 'Login With Phone',
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              Divider(height: 50),
              StyledButton(
                submit: () {},
                provider: AuthButtonProvider.google,
                disableIcon: true,
                text: 'Login With Email',
                borderRadius: 100,
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
