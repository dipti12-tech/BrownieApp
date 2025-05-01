import 'dart:convert';
import 'package:browniepoints/utils/appstring.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<Map<String, dynamic>> checkUserExists(String email) async {
  final url = Uri.parse(AppStrings.userexists);

  final response = await http.post(
  url,
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({'email_id': email}),
  );
  if (response.statusCode == 200) {
    print("RESPONSE***"+response.body);
    return jsonDecode(response.body);
  } else {
  throw Exception('Server error');
  }
  }
  }


