import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
        FlatButton(
          onPressed: () {
          signInWithGoogle().whenComplete(() {
           Navigator.pushReplacementNamed(context, '/home');
          });
           },
          child: Container(
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Ionicons.md_mail,
                    color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Get going with Email',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: const Color(0x4d000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              color: const Color(0xff656980),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffe0d7d7),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),

          Divider(),
          FlatButton(
            onPressed: () {
              signInWithGoogle().whenComplete(() {
                Navigator.pushReplacementNamed(context, '/home');
              });
            },
            child: Container(
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                          Ionicons.logo_google,
                      color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: const Color(0x4d000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              width: 250.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: const Color(0xff656980),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffe0d7d7),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),

          Divider(),
          FlatButton(
            onPressed: () {
             Navigator.pushReplacementNamed(context, '/home');
               },


            child: Container(

              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                          Ionicons.logo_apple,
                      color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                            'Sign in with Apple',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                  color: const Color(0x4d000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                    ),
                  ],
                ),


              ),
              width: 250.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: const Color(0xff656980),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffe0d7d7),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),

          Divider(),
        ],
      ),
    );
  }
}
