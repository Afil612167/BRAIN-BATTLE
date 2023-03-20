import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/constants/lists.dart';
import 'package:brain_battle/app/util/questions/questions.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
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
                    Text("  1  ")
                  ],
                ),
              ),
            )
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
                    "Quesiton 5 of 10",
                    style: TextStyle(color: secondaryBg, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    easyQuestions['questions'][1]['text'],
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
                          return Container(
                            height: height*0.066,
                            width: widht * 0.85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryBg),
                            child: Center(
                                child: Text(
                              easyQuestions['questions'][1]['options'][index]['option'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height*0.0206,
                                  color: bgColor),
                            )),
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
      ),
    );
  }
}
