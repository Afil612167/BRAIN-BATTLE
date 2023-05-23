import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/constants/lists.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/levels_screen/levels_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';

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
    return Consumer<QuizProvider>(builder: (context, provider, _) {
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
                child: provider.difficultyLock[index]
                    ? Icon(
                        Icons.check_circle_outline_outlined,
                        size: 30,
                        color: secondaryBg,
                      )
                    : Icon(
                        Icons.lock,
                        size: 30,
                        color: secondaryBg,
                      )),
            Padding(
              padding: EdgeInsets.only(left: height * 0.02),
              child: Text(
                'DIFFICULTY',
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
                    provider.getStoredData();
                    if (provider.difficultyLock[index]) {
                      Get.to(LevelsScreen(height: height, width: width));
                    }
                  },
                  child: Chip(
                      label: Row(
                        children: [
                          Text(
                            //difficulty lock check
                            provider.difficultyLock[index]
                                ? 'Continue '
                                : 'Locked',
                            style: TextStyle(color: secondaryBg),
                          ),
                          provider.difficultyLock[index]
                              ? Image(
                                  image: AssetImage(continueIcon),
                                  height: 24,
                                )
                              : Icon(
                                  Icons.lock_rounded,
                                  color: secondaryBg,
                                )
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
