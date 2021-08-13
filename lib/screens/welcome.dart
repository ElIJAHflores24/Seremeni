import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:seremeni/models/quiz.dart';
import 'package:seremeni/models/user.dart';
import 'package:seremeni/screens/logOut.dart';
import 'package:seremeni/screens/quiz_page.dart';
import 'package:seremeni/services/phrases.dart';

//AnimalQuiz anqz = new AnimalQuiz();
class Welcome extends StatefulWidget {
  bool value = false;
  bool animal = false;
  bool beach = false;
  bool introduction = false;
  bool travel = false;


 Welcome({this.animal, this.beach, this.introduction, this.travel});
  
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Overview',
          style: TextStyle(
              color: Colors.black,
              //fontFamily: 'Poppins',
              fontSize: 40),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => LogOut(
                      animal: animal,
                      introduction: introduction,
                      beach: beach,
                      travel: travel,
                    )));
              },
              child: Image(
                image: AssetImage(
                  'images/Flag.png',
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text(
                    'Topics',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                    ),
                  ),
                ),
                //SizedBox(height: 10,)
              ],
            ),
            DataPanel(
              text: 'Introduction',
              icons: Icons.play_circle_outline,
              img: AssetImage('images/4.png'),
              destination: Quizzler(introQuiz, 'introduction'),
            ),
            DataPanel(
              text: 'Animals',
              icons: widget.introduction ? Icons.play_circle_outline : Icons.lock,
              img: AssetImage('images/1.png'),
              destination: widget.introduction ? Quizzler(animalQuiz, 'animal') : Text('Quiz Locked'),
            ),
            DataPanel(
              text: 'Travel',
              icons: widget.animal ? Icons.play_circle_outline : Icons.lock,
              img: AssetImage('images/2.png'),
              destination: widget.animal ? Quizzler(travelQuiz, 'travel') : Text('Quiz Locked'),
            ),
            DataPanel(
              text: 'Things at the Beach',
              icons: widget.travel ? Icons.play_circle_outline : Icons.lock,
              img: AssetImage('images/3.png'),
              destination: widget.travel ? Quizzler(animalQuiz, 'beach') : Text('Quiz Locked'),
            )
          ],
        ),
      ),
    );
  }
}

class DataPanel extends StatelessWidget {
  final String text;
  final ImageProvider img;
  final IconData icons;
  final Widget destination;

  const DataPanel({Key key, this.text, this.img, this.icons, this.destination})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.all(32),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: img,
          //colorFilter: ColorFilter.mode(Colors.grey[600], BlendMode.overlay),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => destination));
              print(destination);
        },
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Icon(
              icons,
              color: Colors.yellow[300],
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
