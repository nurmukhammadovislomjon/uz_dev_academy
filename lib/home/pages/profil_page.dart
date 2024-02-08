import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/login/save/saveLogin.dart';
import 'package:uz_dev_academy/main.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String? userIsmi;
  String? userFamilyasi;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future getUser() async {
    userIsmi = await SaveLogin.getIsm();
    userFamilyasi = await SaveLogin.getFamilya();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  FontAwesomeIcons.userLarge,
                  color: whiteColor,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "${userIsmi} ${userFamilyasi}",
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.gear,
            color: whiteColor,
          ),
          title: Text(
            "Sozlash",
            style: GoogleFonts.poppins(
              color: whiteColor,
              fontSize: 18,
            ),
          ),
          trailing: Icon(
            FontAwesomeIcons.chevronRight,
            color: whiteColor,
            size: 16,
          ),
        ),
        InkWell(
          onTap: () {
            SaveLogin.logOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (route) => false);
          },
          child: ListTile(
            leading: Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: redColor,
            ),
            title: Text(
              "Tizimdan chiqish",
              style: GoogleFonts.poppins(
                color: redColor,
                fontSize: 18,
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              color: redColor,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
