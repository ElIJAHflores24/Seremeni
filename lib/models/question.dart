import 'package:seremeni/models/answer.dart';

class Question {
  String questionText = '';
  String correctAnswer;
  List<String> answers =[''];

  Question(this.questionText, this.answers, this.correctAnswer);
}
