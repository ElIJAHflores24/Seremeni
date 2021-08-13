import 'package:flutter/material.dart';
import 'package:seremeni/main.dart';
import 'package:seremeni/screens/authentication/login.dart';
import 'package:seremeni/screens/quiz_page.dart';
import 'package:seremeni/services/auth.dart';
import 'package:seremeni/services/data_service.dart';

class LogOut extends StatefulWidget {
  bool introduction = false;
  bool animal = false;
  bool travel = false;
  bool beach = false;
  LogOut ({this.introduction, this.animal, this.travel, this.beach});
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        height: 10,
        onPressed: () async {
          String name = await Auth().getCurrentUser();
          await DataService().saveQuiz(
            introduction: introduction,
            animals: animal,
            travel: travel,
            beach: beach,
            user: name,
          );
          await _auth.signOut();
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        },
        color: Colors.yellow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Log out",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
