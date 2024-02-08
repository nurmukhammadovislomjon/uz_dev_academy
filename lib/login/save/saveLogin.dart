import 'package:shared_preferences/shared_preferences.dart';

class SaveLogin {
  static Future saveIsm(String ism) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ism', ism);
  }

  static Future saveFamilya(String familya) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('familya', familya);
  }

  static Future<String?> getIsm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ism");
  }

  static Future getFamilya() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("familya");
  }

  static Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
