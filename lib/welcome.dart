import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
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
            Text('Topics',style: TextStyle(fontWeight: FontWeight.bold ),),
            DataPanel(
              text: 'Word',
              icons: Icons.play_circle_outline, 
              img: AssetImage('images/Lj.png'),
            ),
            DataPanel(
              text: 'Indeed',
              icons: Icons.lock,
              img: NetworkImage('https://i.ytimg.com/vi/hfGgYf-abu8/maxresdefault.jpg'),
            ),
            SizedBox(width: double.infinity),
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

  const DataPanel({Key key, this.text, this.img, this.icons}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 24,
      ),
      padding: EdgeInsets.all(32),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(image: img),
      ),
      child: GestureDetector(
        onTap: (){
          var bar=SnackBar(content: Text('Word, Indeed'));
          ScaffoldMessenger.of(context).showSnackBar(bar);
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
