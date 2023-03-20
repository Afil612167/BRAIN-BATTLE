import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/routes/routes.dart';
import 'package:brain_battle/app/view/mobile_otp_auth_scrn/numberfield_screen.dart';
import 'package:flutter/material.dart';

class OrContinuePhTxt extends StatelessWidget {
  const OrContinuePhTxt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreenOtp(),
            ));
        print('phone Number');
      },
      child: Text.rich(
        TextSpan(
          text: 'or sign in via  ',
          style: TextStyle(
            color: secondaryBg.withOpacity(0.6),
          ),
          children: [
            TextSpan(
                text: 'phone number',
                style: TextStyle(
                    color: secondaryBg, decoration: TextDecoration.underline))
          ],
        ),
      ),
    );
  }
}
