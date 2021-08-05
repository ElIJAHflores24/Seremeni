import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:seremeni/models/quiz.dart';
import 'package:seremeni/screens/welcome.dart';

class Quizzler extends StatelessWidget {
  final Quiz inputQuizzler;

  Quizzler(this.inputQuizzler);

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(inputQuiz: inputQuizzler),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        // title: Text(
        //   widget.inputQuiz.getQuizName(),
        //   style: TextStyle(
        //   color: Colors.black,
        //       //fontFamily: 'Poppins',
        //       fontSize: 40),
        // ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.yellow,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            );
          },
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  Quiz inputQuiz;

  QuizPage({this.inputQuiz});

  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<bool> quizStatus = [];
  bool passed = false;
  int listCount = 0;
//var answers = widget.inputQuiz.getAnswers();
  int count = 0;
  void quizPassed(){
    
  }

  
  void checkAnswer(
    String userPickedAnswer,
    Quiz qz,
  ) {
    String correctAnswer = widget.inputQuiz.getCorrectAnswer();
    setState(() {
      if (qz.isFinished() == true) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: passed
                ? Text(
                    'Congratulations you passed and unlocked the next section')
                : Text(
                    'Sorry you didn\'t pass you only got $listCount correct, you need 10 to pass.'),
            actions: [
              CupertinoDialogAction(
                child: Text("Go back"),
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
          quizStatus.add(true);
          listCount += 1;
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          quizStatus.add(false);
        }
        
        if (listCount == 10){
            passed = true;
        }
        qz.nextQuestion();
        print('userpicked: $userPickedAnswer');
        print('correctAnswer: ${correctAnswer}');
        print (listCount);
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
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(widget.inputQuiz.getImage()),
                    Text(
                      widget.inputQuiz.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // First Button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                widget.inputQuiz.getAnswers(count),
                style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(
                    widget.inputQuiz.getAnswers(count), widget.inputQuiz);

                setState(() {});
                print(quizStatus);
              },
            ),
          ),
        ),
        //Question box #
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                widget.inputQuiz.getAnswers(count + 1),
                style: TextStyle(
                    fontSize: 20.0, color: Colors.white, fontFamily: 'poppins'),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(
                    widget.inputQuiz.getAnswers(count + 1), widget.inputQuiz);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                widget.inputQuiz.getAnswers(count + 2),
                style: TextStyle(
                    fontSize: 20.0, color: Colors.white, fontFamily: 'poppins'),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(
                    widget.inputQuiz.getAnswers(count + 2), widget.inputQuiz);
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

class QuizPageListView extends StatelessWidget {
  Quiz q;
  QuizPageListView({this.q});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text('${q.questionBankk[index]}')
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: q.questionBankk.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    '${q.questionBankk[index]}',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.yellow,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      q.questionBankk[index].answers[index],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'poppins'),
                    ),
                    onPressed: () {
                      //The user picked false.
                      // checkAnswer(false, widget.inputQuiz);
                    },
                  ),
                ],
              );
            })
      ],
    );
  }
}
