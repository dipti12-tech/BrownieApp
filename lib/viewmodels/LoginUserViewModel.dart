import 'package:browniepoints/utils/GeneratePasswdmd5.dart';
import 'package:browniepoints/views/AccountCreation.dart';
import 'package:browniepoints/views/LoginScreen.dart';
import 'package:browniepoints/views/OnBoardingStart.dart';
import 'package:flutter/material.dart';

import '../services/ApiService.dart';

class LoginUserViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<void> loginUser(BuildContext context, String email,String passwd) async {
    try {
      final result = await _apiService.loginUser(email,passwd);
      print("Response: LOGINUSER" + result.toString());
      int status = result['status'];
      String msg = result['msg'];
      print("Response: LOGINUSER" + status.toString() + "MESSAGE" + msg);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

      if (msg == 'Login successful') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingStart(source: '')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }
}
