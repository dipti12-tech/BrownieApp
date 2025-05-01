import 'package:browniepoints/views/AccountCreation.dart';
import 'package:browniepoints/views/OnBoardingStart.dart';
import 'package:flutter/material.dart';

import '../services/ApiService.dart';

class LoginUserExistsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  Future<void> checkUserExists(BuildContext context, String email) async {
    try {
      final result = await _apiService.checkUserExists(email);
      print("Response: result"+result.toString());

      int status = result['status'];
      String msg = result['msg'];
      print("Response: "+status.toString() +"MESSAGE"+msg);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)),
      );

      if(msg == 'New user'){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountCreation()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingStart()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    }
  }
}
