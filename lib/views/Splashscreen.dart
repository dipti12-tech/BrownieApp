import 'dart:async';

import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
          child: Text(
           AppStrings.appName,
            style: GoogleFonts.lobster(
              fontSize: 34,
              color: Colors.white,
            ),
          )
          ),
          const SizedBox(height: 10),

          // Image
          Center(
            child: Image.asset(
              'assets/images/splashimages.png',
              width: 300,
            ),
          ),

          const SizedBox(height: 30),

          // Version Text
          Padding(padding: const EdgeInsets.only(bottom: 90),

          child: Text(
            'Version 1.0',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          )
        ],
      ),
    );
  }
}


