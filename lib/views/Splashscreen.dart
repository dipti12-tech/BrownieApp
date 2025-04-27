import 'package:flutter/material.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/views');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // ✅ No MaterialApp here
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget{
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.indigo,

        ),
      ),
    );
  }
  }*/
