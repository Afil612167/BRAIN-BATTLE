import 'dart:async';
import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/lottie.dart';
import 'package:brain_battle/app/routes/routes.dart';
import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:brain_battle/app/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 0), () {
      Get.offAll(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: secondaryBg,
      body: Center(
        child: Lottie.asset(lottiePath),
      ),
    );
  }

  // splashWhereToGo() {
  //   Navigator.pushNamed(context, homePage);
  // }
}
