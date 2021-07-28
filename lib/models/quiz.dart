import 'package:seremeni/models/question.dart';

class Quiz{
 int questionNumberr;
final List<Question> questionBankk;

Quiz({
  this.questionNumberr,
  this.questionBankk,
});
 void nextQuestion() {
    if (questionNumberr < questionBankk.length - 1) {
      questionNumberr++;
    }
  }

  String getQuestionText() {
    return questionBankk[questionNumberr].questionText;
  }

  bool getCorrectAnswer() {
    return questionBankk[questionNumberr].questionAnswer;
  }

  bool isFinished() {
    if (questionNumberr >= questionBankk.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumberr = 0;
  }    
}
