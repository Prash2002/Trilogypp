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
