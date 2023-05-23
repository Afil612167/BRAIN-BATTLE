import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../mobile_otp_ver_scrn/mobile_otp_var_scrn.dart';

class SendCodeButton extends StatelessWidget {
  SendCodeButton({
    Key? key,
    required this.height,
    required this.provider,
    required this.width,
  }) : super(key: key);
  final QuizProvider provider;
  final double height;
  final double width;
  static String verify = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 20,
      width: width / 2,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '${provider.phoneNumber}',
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {
                //
              },
              codeSent: (String verificationId, int? resendToken) {
                provider.verificationId = verificationId;
                provider.verificationIdUpdate();
                Get.to(SignInScreenOtpVarification());
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          } catch (e) {
            print("Code Exception is $e");
          }
        },
        child: Text("Send the code"),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
