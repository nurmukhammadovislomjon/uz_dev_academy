import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/oqish/video_korish_page.dart';
import 'package:uz_dev_academy/list/ahadjonov_dart.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';
import 'package:uz_dev_academy/list/mamarasulov_flutter.dart';
import 'package:uz_dev_academy/list/ziyatov_python.dart';

late List okCoursesUrl;
late List okCoursesTitle;

class KursniOqishPage extends StatefulWidget {
  const KursniOqishPage({super.key, required this.index});
  final int index;

  @override
  State<KursniOqishPage> createState() => _KursniOqishPageState();
}

class _KursniOqishPageState extends State<KursniOqishPage> {
  void thisCourses() {
    if (widget.index == 0) {
      okCoursesUrl = ziyatovPythonUrl;
      okCoursesTitle = ziyatovPythonTitle;
      print(okCoursesTitle);
      print(okCoursesUrl);
    } else if (widget.index == 1) {
      okCoursesTitle = ahadjonovdartTitle;
      okCoursesUrl = ahadjonovdartUrl;
    }else if(widget.index == 2) {
      okCoursesTitle = mamarasulovflutterTitle;
      okCoursesUrl = mamarasulovflutterUrl;
    }
  }

  @override
  void initState() {
    super.initState();
    thisCourses();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            barchakurstitle[widget.index],
            style: GoogleFonts.poppins(color: whiteColor, fontSize: 18),
          ),
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: blackColor,
        ),
        body: ListView.builder(
          itemCount: okCoursesUrl.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: 80,
              margin: const EdgeInsets.all(15),
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoKorishPage(index: index, author: widget.index),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${index = index + 1}",
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            okCoursesTitle[index = index - 1],
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            barchakursauthor[widget.index],
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
