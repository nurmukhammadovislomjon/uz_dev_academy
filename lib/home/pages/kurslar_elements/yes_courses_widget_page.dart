import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/open/yozilgan_kurs_page.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';

class YesCoursesWidget extends StatefulWidget {
  const YesCoursesWidget({super.key, required this.coursesindex});
  final int coursesindex;

  @override
  State<YesCoursesWidget> createState() => _YesCoursesWidgetState();
}

class _YesCoursesWidgetState extends State<YesCoursesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.maxFinite,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            YozilganKursPage(index: widget.coursesindex),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/authors/${barchakursauthorimage[widget.coursesindex]}",
                          width: 60,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            barchakurstitle[widget.coursesindex],
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            barchakursauthor[widget.coursesindex],
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
