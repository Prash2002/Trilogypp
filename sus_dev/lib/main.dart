import 'package:flutter/material.dart';
import 'package:sus_dev/pages/Loading.dart';
import 'package:sus_dev/pages/Home.dart';
import 'package:sus_dev/pages/Login.dart';

void main() {
  runApp(MyApp());
}
/*
1
2
3
4
5
6
7
8
9
10
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}
