import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/pages/home_page.dart';
import 'package:uz_dev_academy/home/pages/kurslar_page.dart';
import 'package:uz_dev_academy/home/pages/my_courses_page.dart';
import 'package:uz_dev_academy/home/pages/profil_page.dart';
import 'package:uz_dev_academy/home/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "XERO",
          style: GoogleFonts.poppins(
            color: whiteColor,
            fontSize: 22,
            letterSpacing: 8,
          ),
        ),
        backgroundColor: blackColor,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: blackColor,
        color: whiteColor,
        child: ListView(
          children: [
            SingleChildScrollView(
              child: [
                HomePage5(),
                KurslarPage(),
                MyCoursesPage(),
                ProfilPage(),
              ][currentIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                // Icons.home,
                FontAwesomeIcons.house,
                size: 18,
              ),
              label: "Asosiy"),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.codepen,
              size: 18,
            ),
            label: "Kurslar",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bookmark,
              size: 18,
            ),
            label: "Saqlangan",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userLarge,
              size: 18,
            ),
            label: "Profil",
          ),
        ],
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins(),
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: whiteColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: blackColor,
        unselectedItemColor: whiteColor.withOpacity(0.6),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        child: Icon(
          FontAwesomeIcons.search,
          color: whiteColor,
        ),
        backgroundColor: blackColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
