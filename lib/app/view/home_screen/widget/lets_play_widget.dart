
  import 'package:flutter/Material.dart';

import '../../../constants/colors.dart';
import '../../../constants/lists.dart';
import 'difficultychip.dart';

List<Widget> letsPlayWidget(double height, double width) {
    return [
                  Text.rich(
                    TextSpan(
                      text: "Let's Play",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600,color: titleColor,fontStyle: FontStyle.italic),
                      children: [
                        TextSpan(
                            text: '\nBe the first',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500,))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height-56,
                    width: width - 40,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemCount: homePageDatas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DifficultyChip(
                          height: height,
                          width: width,
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                ];
  }