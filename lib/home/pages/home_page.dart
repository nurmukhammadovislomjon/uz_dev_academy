import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/home_elements/listview.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({super.key});

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              "assets/slider/python.jpg",
              width: double.maxFinite,
            ),
            Image.asset(
              "assets/slider/flutter.png",
              width: double.maxFinite,
            ),
            Image.asset(
              "assets/slider/dart.png",
              width: double.maxFinite,
            ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Sara kurslar",
          style: GoogleFonts.poppins(
            color: whiteColor,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const ListViewWidget()
      ],
    );
  }
}
