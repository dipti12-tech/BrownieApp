import 'dart:convert';
import 'package:browniepoints/models/LoginResponse.dart';
import 'package:browniepoints/models/Partner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Save Data
  /* Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }
*/
  // Save Data
  Future<void> savePartnerDetails(PartnerDetails details) async {
    final prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode({
      'profile_id': details.profileId,
      'first_name': details.firstName,
      'last_name': details.lastName,
      'gender': details.gender,
      'dob': details.dob,
      'email_id': details.emailId,
      'phone': details.phone,
      'city': details.city,
      'country': details.country,
      'nick_name': details.nickName,
      'partner_id': details.partnerId,
      'relationship_status': details.relationshipStatus,
      'bp_benefits': details.bpBenefits,
      'share_updates': details.shareUpdates,
    });
    await prefs.setString('partner_details', jsonString);
    print('Partner details saved!');
  }


  //Save Data user details
  Future<void> saveUserDetails(UserDetails details) async {
    final prefs = await SharedPreferences.getInstance();

    String jsonString = jsonEncode({
      'profile_id': details.profileId,
      'user_name': details.userName,
      'first_name': details.firstName,
      'last_name': details.lastName,
      'gender': details.gender,
      'dob': details.dob,
      'email_id': details.emailId,
      'phone': details.phone,
      'address': details.address,
      'country': details.country,
      'nick_name': details.nickName,
      'partner_id': details.partnerId,
      'relationship_status': details.relationshipStatus,
      'couple_id': details.coupleId
    });
    await prefs.setString('user_details', jsonString);
    print('User details saved!');
  }

  // Retrieve Data
  Future<PartnerDetails?> getPartnerDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('partner_details');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return PartnerDetails.fromJson(jsonMap);
    }
    return null;
  }

  //get User details

  Future<UserDetails?> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('user_details');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return UserDetails.fromJson(jsonMap);
    }
    return null;
  }
  /*  String? getString(String key) {
    return _prefs?.getString(key);
  }*/

  // Remove a Data
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Save Map as JSON string
  Future<void> saveMap(String key, Map<String, dynamic> map) async {
    String jsonString = jsonEncode(map);
    await _prefs?.setString(key, jsonString);
  }

  // Get Map from JSON string
  Map<String, dynamic>? getMap(String key) {
    String? jsonString = _prefs?.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  // Clear all data
  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
