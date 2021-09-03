import 'package:flutter/material.dart';
import 'package:world_time_viewer/pages/choose-location.dart';
import 'package:world_time_viewer/pages/home.dart';
import 'package:world_time_viewer/pages/loading.dart';

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
