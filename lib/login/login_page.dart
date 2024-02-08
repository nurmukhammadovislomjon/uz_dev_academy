import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/login/save/saveLogin.dart';
import 'package:uz_dev_academy/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user_ismi = TextEditingController();
  TextEditingController user_familyasi = TextEditingController();

  Future saveUser(String ism, String familya) async {
    await SaveLogin.saveIsm(ism);
    await SaveLogin.saveFamilya(familya);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/logo/xero.png",
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: user_ismi,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Ismingiz",
                  hintStyle: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 18,
                  ),
                  fillColor: textFieldColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0)),
                ),
                cursorColor: whiteColor,
                style: GoogleFonts.poppins(color: whiteColor, fontSize: 18),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: user_familyasi,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Familyangiz",
                  hintStyle: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 18,
                  ),
                  fillColor: textFieldColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0)),
                ),
                cursorColor: whiteColor,
                style: GoogleFonts.poppins(color: whiteColor, fontSize: 18),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.maxFinite,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  if (user_ismi.text.isNotEmpty &&
                      user_familyasi.text.isNotEmpty) {
                    saveUser(user_ismi.text, user_familyasi.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          margin: EdgeInsets.only(bottom: 20),
                          height: 90,
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Kiritilgan ma'lumotlarda\nkamchilik bor",
                                  style: GoogleFonts.poppins(
                                    color: whiteColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  Icons.error,
                                  color: whiteColor,
                                  size: 45,
                                ),
                              ],
                            ),
                          ),
                        ),
                        backgroundColor: backgroundColor,
                      ),
                    );
                    print("no");
                  }
                },
                child: Center(
                  child: Text(
                    "Ro'yxatdan o'tish",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18,
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
}
