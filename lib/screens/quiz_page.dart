import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seremeni/models/quiz.dart';
import 'package:seremeni/screens/welcome.dart';
import 'package:seremeni/services/phrases.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatelessWidget {
  final Quiz inputQuizzler;

  Quizzler(this.inputQuizzler);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(inputQuiz: inputQuizzler),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  Quiz inputQuiz;

  QuizPage({this.inputQuiz});

  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(
    bool userPickedAnswer,
    Quiz qz,
  ) {
    bool correctAnswer = qz.getCorrectAnswer();
    setState(() {
      if (qz.isFinished() == true) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Congratulations you finished'),
            actions: [
              CupertinoDialogAction(
                child: Text("go back"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                ),
              ),
            ],
          ),
        );
        qz.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                widget.inputQuiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true, widget.inputQuiz);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false, widget.inputQuiz);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
