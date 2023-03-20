import 'dart:ui';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/view/login_screen/widget/authendication_button.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/or_continue_txt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: loginBg,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.1,
                bottom: height * 0.05,
              ),
              child: SizedBox(
                height: height * 0.3,
                width: width,
                child: DropShadowImage(
                  image: Image.asset(appLogo),
                ),
              ),
            ),
            Text(
              "Continue with",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: secondaryBg),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            AuthenticatonButton(
              width: width,
              logo: googleLogo,
              singInText: "CONTINUE WITH GOOGLE",
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            AuthenticatonButton(
              width: width,
              logo: facebookLogo,
              singInText: "CONTINUE WITH FACEBOOK",
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            OrContinuePhTxt(),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                print('privacy policy');
              },
              child: Text.rich(
                TextSpan(
                  text: 'By continuing, you agree to the ',
                  style: TextStyle(
                    color: secondaryBg.withOpacity(0.6),
                  ),
                  children: [
                    TextSpan(
                        text: 'Terms ',
                        style: TextStyle(
                            color: secondaryBg, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              color: secondaryBg.withOpacity(0.6),
                            ),children: [
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            color: secondaryBg, fontWeight: FontWeight.w500),)]
                          ),
                        ])
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
    );
  }
}
