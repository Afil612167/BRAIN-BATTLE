import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    ),
  );
}
