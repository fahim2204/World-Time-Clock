import 'package:flutter/material.dart';
import 'package:sample/pages/choose-location.dart';
import 'package:sample/pages/home.dart';
import 'package:sample/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
