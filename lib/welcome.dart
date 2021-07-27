import 'package:flutter/material.dart';

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
              //fontFamily: 'Poppins',
              fontSize: 25),
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
                SizedBox(height: 100,),
                Text(
                  'Topics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                //SizedBox(height: 10,)
              ],
              
            ),
            
            DataPanel(
              text: 'Introduction',
              icons: Icons.play_circle_outline,
              img: AssetImage('images/fitjag.png'),
            ),
            DataPanel(
              text: 'Travel',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/plane.png'),
            ),
            DataPanel(
              text: 'Yes',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/Dance.png'),
              destination: Welcome(),
            ),
            DataPanel(
              text:'Ma',
              icons: Icons.lock_outline_sharp,
              img: AssetImage('images/beach.png'),
              destination: Welcome(),
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
                fontSize: 30,
                fontWeight: FontWeight.bold,
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
