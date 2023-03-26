import 'dart:ui';

import 'package:brain_battle/app/constants/images.dart';
import 'package:flutter/Material.dart';

import '../../../constants/colors.dart';

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.height,
    required this.widht,
  }) : super(key: key);

  final double height;
  final double widht;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 90,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                starIconImage,
                height: 54,
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              starIconImage,
              height: 60,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              starIconImage,
              height: 54,
            ),
          ),
        ],
      ),
    );
  }
}
