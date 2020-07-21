import 'package:flutter/material.dart';
import 'package:sus_dev/pages/Loading.dart';
import 'package:sus_dev/pages/Home.dart';

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

//11
// 12
// 13
// 14
// 15
// 16
// 17
// 18
// 19
// 20
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
    );
  }
}
