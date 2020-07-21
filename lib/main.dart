import 'package:flutter/material.dart';
import 'package:sus_dev/pages/Loading.dart';
import 'package:sus_dev/pages/Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
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
