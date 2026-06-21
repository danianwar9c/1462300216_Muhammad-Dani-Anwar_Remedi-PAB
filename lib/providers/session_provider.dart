import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {
  static Future saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isLogin', true);
  }

  static Future removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  static Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isLogin') ?? false;
  }
}
