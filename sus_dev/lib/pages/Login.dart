import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

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
              signInWithGoogle().whenComplete(() {
                Navigator.pushReplacementNamed(context, '/home');
              });
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
