import 'package:flutter/material.dart';
import 'package:seremeni/screens/quiz_page.dart';
import 'package:seremeni/services/phrases.dart';
//AnimalQuiz anqz = new AnimalQuiz();

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Overview',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 40),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(
                'images/Flag.png',
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
                SizedBox(height: 100, ),
                
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
              img: AssetImage('images/fitjag.png'),
              destination: Quizzler(animalQuiz),
            ),
            DataPanel(
              text: 'Travel',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/plane.png'),
              destination: Quizzler(travelQuiz),
            ),
            DataPanel(
              text: 'Yes',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/Dance.png'),
              destination: Quizzler(travelQuiz),
            ),
            DataPanel(
              text:'Ma',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/beach.png'),
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

  const DataPanel({Key key, this.text, this.img, this.icons, this.destination}) : super(key: key);
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
        image: DecorationImage(image: img),
        
      ),

      child: GestureDetector(
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context)=> destination));
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
              color: Colors.yellow,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
