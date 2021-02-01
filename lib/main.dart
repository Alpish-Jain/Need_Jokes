import 'package:flutter/material.dart';
import 'package:practice/pages/jokeList.dart';
import 'package:practice/pages/loading.dart';
import 'package:practice/pages/home.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  }));
}
