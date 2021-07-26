import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seremeni/signup.dart';
import 'package:seremeni/welcome.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color(0xffFFE700),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.black,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Log in to your account',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700]),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Column(
                      children: <Widget>[
                        inputFile(label: "Email"),
                        inputFile(
                          label: "Password",
                          obscureText: true,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome(),),);
                  },
                        color: Color(0xffFFE700),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // children: <Widget>[
                    //   Text("Don't have an account?"),
                    //   Text(
                    //     "Sign up",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 18,
                    //     ),
                    //   ),
                    // ],
                    children: <Widget>[
                      RichText(
          text: TextSpan(
            text: "Don't have an account?",
            style: TextStyle(fontSize: 18, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: ' Sign up',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                  style: TextStyle(
                    color: Colors.blue,
                  )),
             
            ],
          ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
        ),
      )
    ],
  );
}
