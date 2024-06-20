import 'dart:convert';
import 'package:project_if22a/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventPref {
  // untuk ngesave
  static void saveUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('user', jsonEncode(user));
  }

  static Future<User?> getUser() async {
    User? user;
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? stringUser = pref.getString('user');

    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }

    return user;
  }

  static void clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}