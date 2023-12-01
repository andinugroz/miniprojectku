import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static final String tokenSessionKey = 'accessToken';

  static Future<void> set(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.get(key) as String?;
    if (value != null) {
      return value;
    }
    return null;
  }

  static Future<void> logout(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
