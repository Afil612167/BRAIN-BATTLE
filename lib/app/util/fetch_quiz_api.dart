import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/quiz_model.dart';

Future<QuizModel> fetchQuestionsApi() async {
  const String url =
      'https://ases-quiz-api1.p.rapidapi.com/questions/random/20';
   var apikeys = {
    'X-RapidAPI-Key': '0f4efd3f9fmsh4bd2fb0c09710d5p1fc721jsnf89213564e43',
    'X-RapidAPI-Host': 'ases-quiz-api1.p.rapidapi.com'
  };
  final response = await http.get(
      Uri.parse(url),
      headers: apikeys);

  if (response.statusCode == 200) {
    return QuizModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load QuizModel');
  }
}
