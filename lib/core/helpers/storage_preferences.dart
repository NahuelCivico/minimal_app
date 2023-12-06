import 'package:shared_preferences/shared_preferences.dart';

class StoragePreferences {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static SharedPreferences get prefs => _prefs;

  static String get accessToken {
    return _prefs.getString('accessToken') ?? '';
  }

  static Future<bool> saveAccessToken({required String accessToken}) async {
    return await _prefs.setString('accessToken', accessToken);
  }

  static Future<bool> removeAccessToken() async {
    return await _prefs.remove('accessToken');
  }
}
