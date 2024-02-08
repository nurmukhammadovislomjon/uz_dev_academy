import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                ),
                filled: true,
                fillColor: textFieldColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                ),
                hintText: "Kurslarni qidirish",
                hintStyle: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: 18,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: whiteColor,
                  ),
                ),
              ),
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontSize: 18,
              ),
              cursorColor: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
