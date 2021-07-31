import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStudents extends StatefulWidget {
  @override
  _MyStudentsState createState() => _MyStudentsState();
}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;

class _MyStudentsState extends State<MyStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  // Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1,0.4,0.7],
              ),
            ),
          ),

          Positioned(
            child: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back,size: 35.0,color: Colors.white,),
                onPressed: (){
                  Navigator.pushNamed(context, '/my_students');
                },
              ),
              title: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text("My Students",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,
                ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          lowerHalf(context),
          ReportCard(context),
        ],
      ),
    );
  }
}
Widget lowerHalf(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 750 / 2,
      color: Color(0xFFECF0F3),
    ),
  );
}

Widget ReportCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding( padding: EdgeInsets.symmetric(vertical: circleRadius / 2.0,horizontal: 20),
          child: Container(
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Nadien Mohammed',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Menna Ahmed',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Mohammed Ezz',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Maryem Adel',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Amira Ashraf',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Lina Tarik',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Nada Ahmed',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Diaa Mohammed',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Mostafa Ahmed',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Nour Essam',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),
                ListTile(
                  //leading: Icon(Icons.description),
                  title: Text('Sara Ibrahim',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_report');
                  },
                ),

              ],
            ),
            color: Colors.white,
            height: 600.0,
          ),
        ),
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/students.jpeg',
                      ))),
            ),
          ),
        )
        
      ],
    ),
  );
}

