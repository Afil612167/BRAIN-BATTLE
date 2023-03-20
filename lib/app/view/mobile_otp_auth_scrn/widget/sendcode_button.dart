import 'package:brain_battle/app/routes/routes.dart';
import 'package:brain_battle/app/view/mobile_otp_ver_scrn/mobile_otp_ver_scrn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';

class SendCodeButton extends StatelessWidget {
  SendCodeButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

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
          Get.to(SignInScreenOtpVarification());
        },
        child: Text("Send the code"),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
