// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';

class AuthenticatonButton extends StatelessWidget {
  const AuthenticatonButton({
    Key? key,
    required this.logo,
    required this.singInText,
    required this.width,
  }) : super(key: key);
  final String logo;
  final String singInText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width * 0.85,
      decoration: BoxDecoration(
          color: secondaryBg, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 13, left: 18, bottom: 13, right: width * 0.15),
            child: Image(image: AssetImage(logo)),
          ),
          Center(
            child: Text(
              singInText,
              style: TextStyle(
                  fontSize: 14,
                  color: blackText.withOpacity(.5),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
