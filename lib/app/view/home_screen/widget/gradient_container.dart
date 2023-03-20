import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/constants/lists.dart';
import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:brain_battle/app/view/quiz_screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../util/fetch_quiz_api.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.index})
      : super(key: key);

  final double height;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchQuestionsApi(),
        builder: (context, snapshot) {
          return Container(
            height: height * 0.2 - 1,
            width: width - 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  homePageGradients[index][0],
                  homePageGradients[index][1]
                ], stops: [
                  0.3,
                  1
                ]),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: height * 0.02),
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    size: 30,
                    color: secondaryBg,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: height * 0.02),
                  child: Text(
                    'Level ${index + 1}',
                    style: TextStyle(
                        color: secondaryBg,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${difficultyList[index][1]} - ${difficultyList[index][0]}',
                      style: TextStyle(
                          color: secondaryBg,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(QuizScreen());
                      },
                      child: Chip(
                          label: Row(
                            children: [
                              Text(
                                'Continue ',
                                style: TextStyle(color: secondaryBg),
                              ),
                              Image(
                                image: AssetImage(continueIcon),
                                height: 24,
                              ),
                            ],
                          ),
                          backgroundColor: lightBlue),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
