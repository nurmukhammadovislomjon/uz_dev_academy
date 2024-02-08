import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/open/open_page.dart';
import 'package:uz_dev_academy/list/barcha_kurslar.dart';

class ListViewWidgetKurslar extends StatefulWidget {
  const ListViewWidgetKurslar({super.key});

  @override
  State<ListViewWidgetKurslar> createState() => _ListViewWidgetKurslarState();
}

class _ListViewWidgetKurslarState extends State<ListViewWidgetKurslar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: ListView.builder(
        itemCount: barchakursauthor.length,
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
                    builder: (context) => OpenPage(index: index),
                  ),
                );
                print("object");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/authors/${barchakursauthorimage[index]}",
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
                        barchakurstitle[index],
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        barchakursauthor[index],
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
        },
      ),
    );
  }
}
