import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:uz_dev_academy/colors.dart';
import 'package:uz_dev_academy/home/home.dart';
import 'package:uz_dev_academy/login/login_page.dart';
import 'package:uz_dev_academy/login/save/saveLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Center(
            child: Image.asset(
              "assets/logo/xero.png",
              width: 300,
            ),
          ),
          splashIconSize: 300,
          curve: Curves.linearToEaseOut,
          backgroundColor: backgroundColor,
          nextScreen: FutureBuilder(
              future: init(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: backgroundColor,
                  );
                }
                return snapshot.hasData ? HomePage() : LoginPage();
              })),
    );
  }

  Future init() async {
    var name = await SaveLogin.getIsm();
    return name;
  }
}
