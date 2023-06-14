import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/code.dart';
import 'package:quiz_app/welcome.dart';
import 'package:quiz_app/xsplash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: const SplashScreen(),
    );
  }
}
