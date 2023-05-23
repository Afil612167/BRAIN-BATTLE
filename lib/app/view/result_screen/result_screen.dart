import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/lists.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/result_screen/widgets/result_container.dart';

import '../quiz_screen/widget/exit_popup.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return showExitPopup(context);
        },
        child: Consumer<QuizProvider>(
          builder: (context,provider,_) {
            return Scaffold(
              backgroundColor: secondaryBg,
              body: Container(
                height: height,
                width: widht,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  lightBlue,
                  homePageGradients[1][0],
                  homePageGradients[1][0]
                ], stops: [
                  0.4,
                  0.6,
                  1
                ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.25),
                      child: ResultContainer(height: height, widht: widht,provider:provider),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.home,
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: brown,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            " Next ",
                            style: GoogleFonts.stylish(
                                fontSize: 30, color: secondaryBg),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
