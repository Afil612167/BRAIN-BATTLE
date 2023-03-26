import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/view/mobile_otp_auth_scrn/widget/logo_row.dart';
import 'package:brain_battle/app/view/mobile_otp_auth_scrn/widget/num_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/sendcode_button.dart';

class SignInScreenOtp extends StatefulWidget {
  const SignInScreenOtp({super.key});
  static String phoneNumber = '';
  @override
  State<SignInScreenOtp> createState() => _SignInScreenOtpState();
}

class _SignInScreenOtpState extends State<SignInScreenOtp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryBg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.only(top: height / 25)),
              Center(
                child: Image(
                  image: AssetImage(authenticationPng),
                  height: height / 3,
                  width: width / 2,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Text(
                "We need to register your Phone Number before getting started !",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 30),
              ),
              MobileOtpField(
                height: height,
                width: width,
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 15),
              ),
              SendCodeButton(height: height, width: width),
              Padding(
                padding: EdgeInsets.only(top: height / 35),
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: blackText,
                    thickness: 2,
                  )),
                  Text(" Or continue with "),
                  Expanded(
                    child: Divider(
                      color: blackText,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              LogoRow(width: width, height: height),
            ],
          ),
        ),
      ),
    );
  }
}
