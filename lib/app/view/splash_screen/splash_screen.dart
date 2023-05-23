import 'dart:async';

import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/lottie.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      whereToGo();
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

  whereToGo() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool('LoginCheck');
    context.read<QuizProvider>().getsavedStarCountByLvl();
    context.read<QuizProvider>().getStoredData();

    if (isLoggedIn != null) {
      isLoggedIn ? Get.offAll(HomeScreen()) : Get.offAll(LoginScreen());
    } else {
      Get.offAll(LoginScreen());
    }
  }
}
