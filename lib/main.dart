import 'package:browniepoints/viewmodels/LoginUserExistsViewModel.dart';
import 'package:browniepoints/views/SplashScreen.dart';
import 'package:browniepoints/views/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginUserExistsViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splashscreen(),
          routes: {
            '/views': (context) => WelcomeScreen(),
            // add other routes if needed
          },
        ),
      );
    }
}



