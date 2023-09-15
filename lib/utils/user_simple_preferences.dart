import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyUserId = 'userId';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future loginUser(int userId) async {
    await _preferences.setInt(_keyUserId, userId);
  }

  static int getLoggedInUser() {
    return _preferences.getInt(_keyUserId)!;
  }
}
