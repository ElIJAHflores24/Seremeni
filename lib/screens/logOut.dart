import 'package:flutter/material.dart';
import 'package:seremeni/main.dart';
import 'package:seremeni/screens/authentication/login.dart';
import 'package:seremeni/services/auth.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
                    height: 40,
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HomePage()));
                    },
                    color: Color(0xff0095ff),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign out",
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