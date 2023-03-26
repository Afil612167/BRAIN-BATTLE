import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/splash_screen/splash_screen.dart';
import 'package:flutter/Material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<QuizProvider>(
      create: (BuildContext context) {
        return QuizProvider();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Brain Battle",
        home: SplashScreen(),
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
    ),
  );
}
