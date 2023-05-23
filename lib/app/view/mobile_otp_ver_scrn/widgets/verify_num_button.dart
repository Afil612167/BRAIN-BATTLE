import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/colors.dart';

class VerifyPhNumberButton extends StatelessWidget {
  const VerifyPhNumberButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: height / 20,
          width: width * 0.9,
          child: ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: provider.verificationId,
                    smsCode: provider.sms);
                await FirebaseAuth.instance.signInWithCredential(credential);
                Get.offAll(HomeScreen());
              } catch (e) {
                print("Code Exception is $e");
              }
              var sharePref = await SharedPreferences.getInstance();
              sharePref.setBool('LoginCheck', true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
            ),
            child: const Text("Verify phone number"),
          ),
        );
      },
    );
  }
}
