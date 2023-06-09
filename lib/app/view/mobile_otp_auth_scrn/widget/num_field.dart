import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileOtpField extends StatelessWidget {
  double height;
  double width;
  QuizProvider provider;
  MobileOtpField({
    Key? key,
    required this.provider,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 13,
      width: width * 0.9,
      child: IntlPhoneField(
        decoration: InputDecoration(
          labelText: 'Phone Number',
          labelStyle: TextStyle(color: blackText),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryBg),
          ),
        ),
        initialCountryCode: 'IN',
        style: TextStyle(color: blackText),
        onChanged: (phone) {
          provider.phoneNumber = phone.completeNumber;
          provider.phoneNumberUpdate();
        },
        onCountryChanged: (country) {
          print(country);
        },
      ),
    );
  }
}
