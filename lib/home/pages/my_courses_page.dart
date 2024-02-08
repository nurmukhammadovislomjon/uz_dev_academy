import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/save/saveKurs.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/yes_courses_widget_page.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  int? ok_no;
  Future getCourses() async {
    ok_no = await SaveCourses.getCourses();
    print(ok_no);
    return ok_no;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: whiteColor,
            ),
          );
        }
        return snapshot.hasData
            ? YesCoursesWidget(
                coursesindex: ok_no!,
              )
            : Column();
      },
    );
  }
}
