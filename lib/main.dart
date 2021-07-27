import 'package:flutter/material.dart';
import 'package:seremeni/LogIn.dart';
import 'package:seremeni/Sign%20up/log%20in/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/BlackLogo.png'),
            ),
            SizedBox(height:100,),
            Column(
              children: <Widget>[
                //login button
                MaterialButton(
                  minWidth: double.infinity,
                  height: 75,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  shape: RoundedRectangleBorder(
                    
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height:20,),
                //Sign up button 
                MaterialButton(
                  minWidth: double.infinity,
                  height: 75,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  color: Color(0xffFFE700),
                  shape: RoundedRectangleBorder(
                    
                    //side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white 
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
