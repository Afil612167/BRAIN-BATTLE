import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/view/levels_screen/levels_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String continuingKey = 'continueingLock';
String expertLockKey = 'expertLock';

class QuizProvider extends ChangeNotifier {
  var phoneNumber;
  String sms = '';
  smsUpdate() {
    sms = sms;
    notifyListeners();
  }

 

  String verificationId = '';
  verificationIdUpdate() {
    verificationId = verificationId;
    notifyListeners();
  }

  // bool continueingLock = false;
  // bool expertLock = false;
  List difficultyLock = [
    //for easy lock its always true
    true,
    //for continuing
    false,
    //for expert lock
    false
  ];
  // bool easy = true;
  double height = 800;
  double width = 350;
  bool levelLocked = false;
  phoneNumberUpdate() {
    phoneNumber = phoneNumber;
    print(phoneNumber);
    notifyListeners();
  }

  sizeUpdate() {
    height = height;
    width = width;
    notifyListeners();
  }

// level controller
  int currentQuestionLevel = 0;
  currentQuestionLvlChange(int index) {
    currentQuestionLevel = index;
    notifyListeners();
  }

  //Question controller x of 10

  int currentQuestion = 0;
  int difficulty = 0; //0=easy 1= moderate 2==expert

  currentQuestionChange() {
    saveStarData();
    buttonClickFalse();
    colorReset();
    levelUnlock();
    if (currentQuestion < 9) {
      currentQuestion++;
    } else {
      starListUpdate();
      storeLocally();
      // starCounting();
      currentQuestion = 0;
      switch (difficulty) {
        case 0:
          life = 10;
          break;
        case 1:
          life = 6;
          break;
        case 3:
          life = 4;
          break;
        default:
          life = 8;
      }
      Get.to(
        LevelsScreen(
          height: height,
          width: width,
        ),
      );
    }
    notifyListeners();
  }

  // for question answer Color changing

  int correctAnswer = 0;

  List defalultButtonColorList = [
    [secondaryBg, lightBlue],
    [secondaryBg, lightBlue],
    [secondaryBg, lightBlue],
    [secondaryBg, lightBlue]
  ];
  correctAnswerColor(isCorrect, selectedButton) {
    defalultButtonColorList[correctAnswer][0] = lightGreen;

    defalultButtonColorList[correctAnswer][1] = secondaryBg;
    if (isCorrect == 0) {
      defalultButtonColorList[selectedButton][0] = lightRed;
      defalultButtonColorList[selectedButton][1] = secondaryBg;
    } else {
      defalultButtonColorList[selectedButton][0] = lightGreen;
      defalultButtonColorList[selectedButton][1] = secondaryBg;
    }
    notifyListeners();
  }

  colorReset() {
    for (int i = 0; i < 4; i++) {
      defalultButtonColorList[i][0] = secondaryBg;
      defalultButtonColorList[i][1] = lightBlue;
    }
    notifyListeners();
  }

  //buttonRepeatationClicking
  bool buttonClicked = false;
  buttonCikingTrue() {
    buttonClicked = true;
    notifyListeners();
  }

  buttonClickFalse() {
    buttonClicked = false;
    notifyListeners();
  }

  //score counting************************************

  int scoreCount = 0;

  int starCount = 0;
  List<int> starList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  starListUpdate() {
    starCounting();
    print(
        "starlist length is ${starList.length} and current questioleve is ${level} ");

    if (starList[level - 1] < starCount) {
      starList[level - 1] = starCount;
    }
    starCount = 0;
  }

  starCounting() {
    if (scoreCount > 6) {
      starCount = 3;
    } else if (scoreCount > 5) {
      starCount = 2;
      print("starCount $starCount");
    } else {
      starCount = 1;
    }
    scoreCount = 0;
    // notifyListeners();
  }

  //score saving by level
  saveStarData() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String> tempList = starList.map((e) => e.toString()).toList();
      sharedPreferences.setStringList(starListKey, tempList);
    } catch (e) {
      print("something went wrong =$e");
    }
  }

  getsavedStarCountByLvl() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      List<String> savedStrList = sharedPreferences.getStringList(starListKey)!;
      starList = savedStrList.map((i) => int.parse(i)).toList();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  scoreInciment() {
    scoreCount++;
    print('score is $scoreCount');
    notifyListeners();
  }

  scoreCountReset() {
    scoreCount = 0;
    notifyListeners();
  }

  //heart controll
  int life = 7;
  lifeUpdate() {
    life--;
    notifyListeners();
  }

  //level lock
  int level = 0;
  levelUnlock() {
    if (currentQuestionLevel == level) {
      level++;
      print("leve is $level ");
    }
    notifyListeners();
  }

  getStoredData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      level = sharedPreferences.getInt(levelKey)!;
    } catch (e) {
      print("Exception is ${e.toString()}");
    }
    notifyListeners();
  }

  List<String> levelList = [];
  //store data locally
  Future storeLocally() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(levelKey, level);
    for (int i = 0; i < level; i++) {
      levelList.add(level.toString());
    }
    sharedPreferences.setStringList(starKey, levelList);
    notifyListeners();
  }

  deleteLocalDatas() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setBool("LoginCheck", true);
    notifyListeners();
  }
}

String levelKey = "LevelKey";
String starKey = '0';
String starListKey = 'StarListKey';
