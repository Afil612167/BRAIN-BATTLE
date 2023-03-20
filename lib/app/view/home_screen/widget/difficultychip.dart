import 'package:brain_battle/app/constants/lists.dart';
import 'package:flutter/material.dart';

import 'gradient_container.dart';

class DifficultyChip extends StatelessWidget {
  const DifficultyChip({
    Key? key,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);
  final int index;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      width: width - 40,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              GradientContainer(
                index: index,
                height: height,
                width: width,
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(homePageDatas[index]))),
                  height: height * 0.17,
                  width: width * 0.38,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
