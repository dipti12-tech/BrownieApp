import 'package:browniepoints/views/SplashScreen.dart';
import 'package:browniepoints/views/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
      routes: {
        '/views': (context) => WelcomeScreen()
      }
    );
  }
}



