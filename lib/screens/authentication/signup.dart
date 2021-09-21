import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seremeni/models/user.dart';
import 'package:seremeni/screens/authentication/login.dart';
import 'package:seremeni/screens/welcome.dart';


import 'package:seremeni/services/auth.dart';




class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String password = "";
  String email = "";
  String passwordConfirmation = "";
   bool value = false;
   bool animal = false;
   bool beach = false;
   bool introduction = false;
   bool travel = false;
  final _formKey = GlobalKey<FormState>();
  Auth auth = Auth();
  Welcome wel = Welcome();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's Free!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700]),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    
                    
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() => email = value.trim());
                      },
                      validator: (value) => value.isEmpty ? "Enter Email": null,
                      obscureText: false,
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
                    ),
                    Text(
                      "Password", 
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() => password = value.trim());
                      },
                      validator: (value) => value.length < 8 ? "Requires 8 Characters ": null,
                      obscureText: true,
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
                    ),
                    Text(
                      "Confirm Password",
                      
                      style: TextStyle(
                        
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() => passwordConfirmation = value.trim());
                      },
                      validator: (value) => value != password ? "Passwords don't match": null,
                      obscureText: true,
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
                    ),
                  ],
                ),
              ),
              Container(
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
                  onPressed: ()async {
                    if (_formKey.currentState.validate()){
                    User user = await auth.registerUser(email, password, passwordConfirmation);
                    if (user == null){
                      showCupertinoDialog(
                        context: context, 
                        builder: (context) => CupertinoAlertDialog(
                          title: Text('invalid password or email'),
                          actions: [
                            CupertinoDialogAction(child: Text("go back"),
                            onPressed: ()=> Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    } else {
                              Navigator.push( 
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Welcome(animal: animal,beach: beach,introduction: introduction,travel:travel)));
                            }
                    }
                    
                   
                  },
                  color: Color(0xffFFE700),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Log in ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
