import 'package:shared_preferences/shared_preferences.dart';

class UtilityPreferences {
  static late SharedPreferences _pref;

  static final UtilityPreferences _instance = UtilityPreferences._internal();

  factory UtilityPreferences() => _instance;

  UtilityPreferences._internal();

  static Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }
  Future<void> setString(String key, String value) async {
    await _pref.setString(key, value);
  }

  String getString(String key, String defaultValue) {
    return _pref.getString(key) ?? defaultValue;
  }
}
