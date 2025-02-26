import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesHelper {
  static const String _userKey = 'user_data';


  static Future<void> saveUser(Map<String, String> user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user);
    await prefs.setString(_userKey, userJson);
  }


  static Future<Map<String, String>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey);
    if (userJson == null) return null;
    return Map<String, String>.from(jsonDecode(userJson));
  }



}
