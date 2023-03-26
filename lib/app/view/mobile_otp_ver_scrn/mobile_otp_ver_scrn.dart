import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/view/mobile_otp_ver_scrn/widgets/verify_num_button.dart';
import 'package:brain_battle/app/view/quiz_screen/widget/exit_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class SignInScreenOtpVarification extends StatelessWidget {
  SignInScreenOtpVarification({super.key});

  static var smsCode = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return showExitPopup(context);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,

          appBar: AppBar(
            leading: InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: blackText,
                )),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
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
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Pinput(
                length: 6,
                showCursor: true,
              ),
              // MobileOtpField(height: height, width: width),
              Padding(padding: EdgeInsets.only(top: height / 15)),
              VerifyPhNumberButton(height: height, width: width),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Edit Phone number?",
                    style: TextStyle(
                        color: blackText,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
