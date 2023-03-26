import 'package:bordered_text/bordered_text.dart';
import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/result_screen/widgets/stars_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    Key? key,
    required this.height,
    required this.widht,
    required this.provider,
  }) : super(key: key);

  final double height;
  final double widht;
  final QuizProvider provider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height * 0.35,
        width: widht * 0.8,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: secondaryBg,
                    border: Border.all(width: 5, color: pinkBorder)),
                height: height * 0.3,
                width: widht * 0.7,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.08),
                child: Container(
                  height: height * 0.08,
                  width: widht * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: levelColor,
                    border: Border.all(
                      width: 5,
                      color: headerColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Level    ${provider.currentQuestionLevel + 1}",
                      style: GoogleFonts.rubik(
                        color: secondaryBg,
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widht * 0.3,
                    height: 5,
                    child: Row(
                      children: [
                        Container(
                          color: pinkBorder,
                          width: widht * 0.038,
                        ),
                        Expanded(
                            child: Container(
                          color: lightBlue,
                        )),
                        Container(
                          color: pinkBorder,
                          width: widht * 0.038,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Stars(height: height, widht: widht),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.115),
                  child: BorderedText(
                    strokeColor: strokeColor,
                    child: Text(
                      "COMPLETED",
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w900,
                          color: headerColor),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
