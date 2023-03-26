import 'package:brain_battle/app/constants/colors.dart';
import 'package:brain_battle/app/view/levels_screen/levels_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String continuingKey = 'continueingLock';
String expertLockKey = 'expertLock';

class QuizProvider extends ChangeNotifier {
  bool continueingLock = false;
  bool expertLock = false;
  List difficultyLock = [];
  bool easy = true;
  double height = 800;
  double width = 350;
  bool levelLocked = false;

  sizeUpdate() {
    height = height;
    width = width;
    notifyListeners();
  }

  diffultyAdding() {
    difficultyLock.addAll([
      easy,
      continueingLock,
      expertLock,
    ]);
    notifyListeners();
  }

  // difficultySet() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool(continuingKey, continueingLock);
  //   sharedPreferences.setBool(expertLockKey, expertLock);
  // }

  // diffcultGet() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   expertLock = sharedPreferences.getBool(continuingKey)!;
  //   continueingLock = sharedPreferences.getBool(continuingKey)!;
  //   notifyListeners();
  // }

// level controller
  int currentQuestionLevel = 0;
  currentQuestionLvlChange(int index) {
    currentQuestionLevel = index;
    notifyListeners();
  }

  //Question controller x of 10

  int currentQuestion = 0;
  currentQuestionChange() {
    buttonClickFalse();
    colorReset();
    levelUnlock();
    if (currentQuestion < 9) {
      currentQuestion++;
    } else {
      storeLocally();
      currentQuestion = 0;
      switch (currentQuestionLevel) {
        case 0:
          life = 8;
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
      Get.to(LevelsScreen(
        height: height,
        widht: width,
      ));
    }
    notifyListeners();
  }

  // for question answer Color changing
  int correctAnswer = 0;

  List<Color> defalultButtonColorList = [
    secondaryBg,
    secondaryBg,
    secondaryBg,
    secondaryBg
  ];
  correctAnswerColor(isCorrect, selectedButton) {
    defalultButtonColorList[correctAnswer] = lightGreen;
    if (isCorrect == 0) {
      defalultButtonColorList[selectedButton] = lightRed;
    } else {
      defalultButtonColorList[selectedButton] = lightGreen;
    }
    notifyListeners();
  }

  colorReset() {
    for (int i = 0; i < 4; i++) {
      defalultButtonColorList[i] = secondaryBg;
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

  //score counting
  int scoreCount = 0;
  scoreInciment() {
    scoreCount++;
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
  int starCount = 0;
  levelUnlock() {
    if (currentQuestionLevel == level) {
      level++;
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
      levelList.add(starCount.toString());
    }

    sharedPreferences.setStringList(starKey, levelList);
    notifyListeners();
  }
}

String levelKey = "LevelKey";
String starKey = '0';
