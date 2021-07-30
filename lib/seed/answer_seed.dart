import 'package:seremeni/models/answer.dart';

class AnswerSeed {
  List<String> answers = ["1", "2", "3", "4"];
  List<Answer> giveAnswers() {
    List<Answer> results = [];
    answers.forEach((value) {
      Answer _an = Answer(value);
      results.add(_an);
    });
    return results;
  }
}