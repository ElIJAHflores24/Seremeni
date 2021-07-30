import 'package:seremeni/models/answer.dart';
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

  List<String> getAnswers() {
    return questionBankk[questionNumberr].answers;
  }



  String getCorrectAnswer() {
    return questionBankk[questionNumberr].correctAnswer;
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
