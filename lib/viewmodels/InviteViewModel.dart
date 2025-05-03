import 'package:browniepoints/views/AccountCreation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/ApiService.dart';

class InviteViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<void> checkInviteCode(BuildContext context, String code) async {
    try {
      final result = await _apiService.checkInviteCode(code);
      print("Reponse :Invite  $result");
      _handleResponse(context, result);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid Code')));
    }
  }

  void _handleResponse(BuildContext context, Map<String, dynamic> result) {
    int status = result['status'];
    String msg = result['msg'];

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

    if (status == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountCreation()),
      );
    }
  }
}
