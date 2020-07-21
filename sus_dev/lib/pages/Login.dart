import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login() {
    googleSignIn.signIn();
  }

  @override
  void initState() {
    super.initState();
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      if (account != null) {
        print('User Signed in $account');
      }
    });
  }

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
              onPressed:
              () => login();
            },
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
