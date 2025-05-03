import 'package:browniepoints/utils/SharedPrefs.dart';
import 'package:browniepoints/viewmodels/InviteViewModel.dart';
import 'package:browniepoints/viewmodels/LoginUserExistsViewModel.dart';
import 'package:browniepoints/viewmodels/LoginUserViewModel.dart';
import 'package:browniepoints/views/SplashScreen.dart';
import 'package:browniepoints/views/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginUserExistsViewModel()),
          ChangeNotifierProvider(create: (_) => InviteViewModel()),
          ChangeNotifierProvider(create: (_) => LoginUserViewModel()),

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



