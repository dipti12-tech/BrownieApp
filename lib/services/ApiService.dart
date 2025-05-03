import 'dart:convert';
import 'package:browniepoints/models/Partner.dart';
import 'package:browniepoints/utils/appstring.dart';
import 'package:http/http.dart' as http;

import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';
import '../utils/SharedPrefs.dart';

class ApiService {
  final _baseUrl = "https://browniepointssapi.onaotc.com";

  //Email Exixts API
  Future<Map<String, dynamic>> checkUserExists(String email) async {
    final url = Uri.parse(AppStrings.userexists);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email_id': email}),
    );
    if (response.statusCode == 200) {
      print("RESPONSE***" + response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Server error');
    }
  }

  // Invite API
  Future<Map<String, dynamic>> checkInviteCode(String inviteCode) async {
    PartnerDetails? partnerDetails;
    final url = Uri.parse(AppStrings.invitecode);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'invite_code': inviteCode}),
    );
    if (response.statusCode == 200) {
      final inviteResponse = Partner.fromJson(jsonDecode(response.body));
      await SharedPrefs().savePartnerDetails(inviteResponse.partnerDetails);
      partnerDetails = await SharedPrefs().getPartnerDetails();
      print("Partner Details: ${partnerDetails!.firstName.toString()}");
      print('Partner Name: ${inviteResponse.partnerDetails.firstName}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Server error');
    }
  }

  Future<SignUpResponse> signUp(SignUpRequest request) async {
    final url = Uri.parse("$_baseUrl/sign_up/");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      print("SIGNUP STATUS CODE: ${response.statusCode}");
      print("SIGNUP RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return SignUpResponse.fromJson(jsonDecode(response.body));
      } else {
        final error = jsonDecode(response.body);
        throw Exception("Signup failed: ${error['message'] ?? 'Unknown error'}");
      }
    } catch (e) {
      print("🔥 Exception during signup: $e");
      rethrow;
    }
  }
}
