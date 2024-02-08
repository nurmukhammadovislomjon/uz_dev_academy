import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/save/saveKurs.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({super.key, required this.index});
  final int index;

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  int? yozilganmiyoqid;

  @override
  void initState() {
    super.initState();

    yozildimiyoq();
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  if (yozilganmiyoqid == null) {
                    print("yoq");
                    saveCourses(widget.index);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                            right: 10,
                            left: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Kursga yozildingiz.\ntabriklaymiz!",
                                style: GoogleFonts.poppins(
                                  color: whiteColor,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.checkDouble,
                                size: 35,
                                color: whiteColor,
                              )
                            ],
                          ),
                        ),
                        backgroundColor: backgroundColor,
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                            right: 10,
                            left: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Kursga allaqachon\nyozilgansiz!",
                                style: GoogleFonts.poppins(
                                  color: whiteColor,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.close,
                                size: 35,
                                color: whiteColor,
                              )
                            ],
                          ),
                        ),
                        backgroundColor: backgroundColor,
                      ),
                    );
                  }
                },
                child: Center(
                  child: Text(
                    "Kursga yozilish",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future yozildimiyoq() async {
    yozilganmiyoqid = await SaveCourses.getCourses();
    setState(() {});
  }

  Future saveCourses(int index) async {
    await SaveCourses.saveCourses(index);
  }
}
