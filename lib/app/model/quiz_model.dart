// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
    QuizModel({
        required this.questions,
        required this.resultCode,
        required this.resultMessage,
    });

    List<Question> questions;
    String resultCode;
    String resultMessage;

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        resultCode: json["result_code"],
        resultMessage: json["result_message"],
    );

    Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "result_code": resultCode,
        "result_message": resultMessage,
    };
}

class Question {
    Question({
        required this.id,
        required this.text,
        required this.options,
        required this.category,
        required this.difficulty,
    });

    String id;
    String text;
    List<Option> options;
    Category category;
    Difficulty difficulty;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["_id"],
        text: json["text"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        category: Category.fromJson(json["category"]),
        difficulty: Difficulty.fromJson(json["difficulty"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "category": category.toJson(),
        "difficulty": difficulty.toJson(),
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class Difficulty {
    Difficulty({
        required this.id,
        required this.degree,
    });

    Id id;
    Degree degree;

    factory Difficulty.fromJson(Map<String, dynamic> json) => Difficulty(
        id: idValues.map[json["_id"]]!,
        degree: degreeValues.map[json["degree"]]!,
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "degree": degreeValues.reverse[degree],
    };
}

enum Degree { MEDIUM, HARD, EASY }

final degreeValues = EnumValues({
    "Easy": Degree.EASY,
    "Hard": Degree.HARD,
    "Medium": Degree.MEDIUM
});

enum Id { THE_63357_B533_AB81_AF9_AD154_EBE, THE_63357_B5_B3_AB81_AF9_AD154_EC0, THE_63343_BA898_B44503_FECC49_E9 }

final idValues = EnumValues({
    "63343ba898b44503fecc49e9": Id.THE_63343_BA898_B44503_FECC49_E9,
    "63357b533ab81af9ad154ebe": Id.THE_63357_B533_AB81_AF9_AD154_EBE,
    "63357b5b3ab81af9ad154ec0": Id.THE_63357_B5_B3_AB81_AF9_AD154_EC0
});

class Option {
    Option({
        required this.option,
        required this.isCorrect,
    });

    String option;
    bool isCorrect;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        option: json["option"],
        isCorrect: json["isCorrect"],
    );

    Map<String, dynamic> toJson() => {
        "option": option,
        "isCorrect": isCorrect,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
