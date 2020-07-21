import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignInButtonBuilder(
            text: 'Get going with Email',
            icon: Icons.email,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            backgroundColor: Colors.blueGrey[700],
            width: 220.0,
          ),
          Divider(),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            text: 'Sign up with google ',
          ),
          Divider(),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
