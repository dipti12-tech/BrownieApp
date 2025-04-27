import 'dart:async';

import 'package:browniepoints/utils/appstring.dart';
import 'package:browniepoints/utils/colors.dart';
import 'package:browniepoints/views/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(32),
              child: Text(
                AppStrings.appName,
                style: GoogleFonts.lobster(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
            ),

            Container(
              child: Image.asset('assets/images/splashimages.png'),
              width: 300,
              height: 300,
            ),

            Container(
              margin: EdgeInsets.all(90),
            child: Text(
              'Version 1.0',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.white
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}
