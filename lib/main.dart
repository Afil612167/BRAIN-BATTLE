import 'package:brain_battle/app/routes/routes.dart';
import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:brain_battle/app/view/login_screen/login_screen.dart';
import 'package:brain_battle/app/view/mobile_otp_auth_scrn/numberfield_screen.dart';
import 'package:brain_battle/app/view/mobile_otp_ver_scrn/mobile_otp_ver_scrn.dart';
import 'package:brain_battle/app/view/quiz_screen/quiz_screen.dart';
import 'package:brain_battle/app/view/splash_screen/splash_screen.dart';
import 'package:flutter/Material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Brain Battle",
      home: LoginScreen(),
      // initialRoute: loginScreen,
      // routes: {
      //   quizScrn:(context) => QuizScreen(),
      //   mobileotpScrn:(context) => SignInScreenOtpVarification(),
      //   splashScreen:(context) => SplashScreen(),
      //   homePage:(context) => HomeScreen(),
      //   loginScreen:(context) => LoginScreen(),
      //   mobileAuthScrn:(context) => SignInScreenOtp()
      // },
    ),
  );
}
