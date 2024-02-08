import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/home.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/oqish/kursni_oqish_page.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/save/saveKurs.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';

class YozilganKursPage extends StatefulWidget {
  const YozilganKursPage({super.key, required this.index});
  final int index;

  @override
  State<YozilganKursPage> createState() => _YozilganKursPageState();
}

class _YozilganKursPageState extends State<YozilganKursPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  "assets/authors/${barchakursauthorimage[widget.index]}",
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  barchakurstitle[widget.index],
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  barchakursauthor[widget.index],
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  kurssoni[widget.index],
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>KursniOqishPage(index: widget.index)));
                },
                child: Center(
                  child: Text(
                    "O'qishni boshlash",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: redColor, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  SaveCourses.removeCourses();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                child: Center(
                  child: Text(
                    "Kursni tark etish",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
