import 'package:shared_preferences/shared_preferences.dart';

class SaveCourses{
  static Future saveCourses(int coursesIndex) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('coursesIndex', coursesIndex);
  }

  static Future<int?> getCourses() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('coursesIndex');
  }

  static Future removeCourses() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('coursesIndex');
  }
}