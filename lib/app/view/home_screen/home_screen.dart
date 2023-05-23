
import 'package:flutter/material.dart';

import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/view/home_screen/widget/lets_play_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print("height is $height\nwidht is $width");
    return SafeArea(
      child: Scaffold(
        backgroundColor: levelsBg,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: SizedBox(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: bgColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  color: bgColor,
                ),
              ),
            ]),
        body: SingleChildScrollView(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: height,
                width: width - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: letsPlayWidget(height, width),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
