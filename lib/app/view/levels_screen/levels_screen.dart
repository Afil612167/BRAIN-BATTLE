import 'package:brain_battle/app/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/constants/images.dart';
import 'package:brain_battle/app/controller/quiz_controller.dart';
import 'package:brain_battle/app/view/quiz_screen/quiz_screen.dart';

class LevelsScreen extends StatefulWidget {
  LevelsScreen({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: levelsBg,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                size: 28,
              ),
            ),
            title: InkWell(
                onTap: () {
                  provider.deleteLocalDatas();
                },
                child: Text("Levels")),
            centerTitle: true,
          ),
          body: GridView.builder(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.height * .04),
                    child: SizedBox(
                      height: widget.height * 0.08,
                      width: widget.height * 0.15,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(
                              // provider.currentQuestionLevel < index
                              //     ? starIconImage2:
                              //          starIconImage,
                              provider.starList[index] >=1
                                  ? starIconImage
                                  : starIconImage2,
                              height: widget.height * 0.055,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                           provider.starList[index] >= 2
                                  ? starIconImage
                                  : starIconImage2,
                              height: widget.height * 0.055,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                           provider.starList[index] >= 3
                                  ? starIconImage
                                  : starIconImage2,
                              height: widget.height * 0.055,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: widget.height * 0.13,
                    width: widget.height * 0.13,
                    child: ClipPolygon(
                      sides: 5,
                      borderRadius: 5.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          color: levelColorList[index],
                        ),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(bubbleBackround),
                              colorBlendMode: BlendMode.dstOut,
                              color: lightBlue.withAlpha(180),
                            ),
                            provider.level < index
                                ? Center(
                                    child: Icon(
                                    Icons.lock_rounded,
                                    color: secondaryBg,
                                  ))
                                : InkWell(
                                    onTap: () {
                                      provider.currentQuestionLvlChange(index);
                                      Get.off(QuizScreen());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Level",
                                            style: TextStyle(
                                                color: secondaryBg,
                                                fontSize: 22),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                                color: secondaryBg,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
