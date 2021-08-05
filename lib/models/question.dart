import 'package:flutter/material.dart';
import 'package:seremeni/models/answer.dart';

class Question {
  String quizName = '';
  String questionText = '';
  String correctAnswer;
  List<String> answers =[''];
  String image;

  Question(this.quizName, this.questionText, this.answers, this.correctAnswer, this.image);
}
