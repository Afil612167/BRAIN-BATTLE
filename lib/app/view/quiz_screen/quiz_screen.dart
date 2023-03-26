import 'dart:async';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/constants/lists.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/util/questions/questions.dart';
import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:brain_battle/app/view/quiz_screen/widget/exit_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return showExitPopup(context);
        },
        child: Consumer<QuizProvider>(builder: (context, provider, _) {
          provider.height = height;
          provider.width = widht;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: homePageGradients[1][1],
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    backgroundColor: secondaryBg,
                    label: Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: blackText,
                        ),
                        Text("  ${provider.life}  ")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              height: height,
              width: widht,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  homePageGradients[1][1],
                  homePageGradients[1][0],
                ], stops: [
                  0.4,
                  0.8
                ], begin: Alignment.topCenter),
              ),
              child: Center(
                child: SizedBox(
                  height: height,
                  width: widht * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(intermeiate),
                          height: height * 0.25,
                        ),
                      ),
                      Text(
                        "Quesiton ${provider.currentQuestion + 1} of 10",
                        style: TextStyle(color: secondaryBg, fontSize: 18),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        easyQuestions['questions']
                                [provider.currentQuestionLevel]
                            [provider.currentQuestion]['question'],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: secondaryBg),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      SizedBox(
                        height: height * 0.4,
                        width: widht * 0.85,
                        child: ListView.separated(
                            physics: ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (provider.buttonClicked == false) {
                                    //for stoppign multiple tap
                                    provider.buttonCikingTrue();
                                    //correct answer check contition
                                    if (easyQuestions['questions'][provider
                                                    .currentQuestionLevel]
                                                [provider.currentQuestion]
                                            ['correctAnswer'] ==
                                        index + 1) {
                                      //for takign correct answer fro color changing
                                      provider.correctAnswer = index;

                                      provider.correctAnswerColor(1, index);
                                      //for score couting it score store in scoreCount variable
                                      provider.scoreInciment();
                                    } else if (provider.life == 0) {
                                      Get.to(HomeScreen());
                                    } else {
                                      //for correct and wrong answer color changing so it used if and else contitions
                                      provider.lifeUpdate();
                                      provider.correctAnswerColor(0, index);
                                    }
                                    // a exception is thrown a scenario  so used try catch
                                    try {
                                      //2 seconds delay for index changin
                                      Timer(
                                        Duration(seconds: 2),
                                        () {
                                          provider.currentQuestionChange();
                                        },
                                      );
                                    } catch (e) {
                                      print("exception is $e");
                                    }
                                    // provider.currentQuestionChange();
                                  }
                                },
                                child: Container(
                                  height: height * 0.066,
                                  width: widht * 0.85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        provider.defalultButtonColorList[index],
                                  ),
                                  child: Center(
                                    child: Text(
                                      easyQuestions['questions'][
                                                  provider.currentQuestionLevel]
                                              [provider.currentQuestion]
                                          ['options'][index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.0206,
                                        color: bgColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                            itemCount: 4),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
//8
//6
//4
