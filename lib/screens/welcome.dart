import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seremeni/models/user.dart';
import 'package:seremeni/screens/logOut.dart';
import 'package:seremeni/screens/quiz_page.dart';
import 'package:seremeni/services/phrases.dart';

//AnimalQuiz anqz = new AnimalQuiz();
class Welcome extends StatefulWidget {
  bool value = false;

 Welcome({this.value});
  
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
                    new MaterialPageRoute(builder: (context) => LogOut()));
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
              destination: Quizzler(introQuiz),
            ),
            DataPanel(
              text: 'Animals',
              icons: widget.value ? Icons.play_circle_outline : Icons.lock,
              img: AssetImage('images/1.png'),
              destination: Quizzler(animalQuiz),
            ),
            DataPanel(
              text: 'Travel',
              icons: Icons.lock,
              img: AssetImage('images/2.png'),
              destination: Quizzler(travelQuiz),
            ),
            DataPanel(
              text: 'Things at the Beach',
              icons: Icons.lock,
              img: AssetImage('images/3.png'),
              destination: Quizzler(animalQuiz),
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
              print(destination.key);
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
