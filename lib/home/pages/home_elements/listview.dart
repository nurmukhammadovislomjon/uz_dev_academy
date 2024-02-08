import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/list/sara_kurslar.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        itemCount: kurstitle.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: textFieldColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/authors/${kursauthorimage[index]}",
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
                      kurstitle[index],
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      kursauthor[index],
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
