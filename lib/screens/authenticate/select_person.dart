import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gp_app/main.dart';
import 'package:gp_app/screens/authenticate/admin_sign_in.dart';
import 'package:gp_app/screens/authenticate/doctor_sign_in.dart';
import 'package:gp_app/screens/authenticate/student_sign_in.dart';

class SelectPerson extends StatefulWidget {
  @override
  _SelectPersonState createState() => _SelectPersonState();
}
double screenHeight;

class _SelectPersonState extends State<SelectPerson> {

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
         children: <Widget>[
           lowerHalf(context),
           upperHalf(context),
           pageTitle(),
           ChoicesCard(context),
         ],
        ),
      ),
    );
  }
}

Widget upperHalf(BuildContext context) {
  return Container(
    height: screenHeight / 2,
    child: Image.asset(
      'assets/lecture.jpg',
      fit: BoxFit.cover,
    ),
  );
}
Widget lowerHalf(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: screenHeight / 2,
      color: Color(0xFFECF0F3),
    ),
  );
}
Widget pageTitle() {
  return Container(
    margin: EdgeInsets.only(top: 50),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.videocam,
          size: 48,
          color: Colors.white,
        ),
        Text(
          "Monitoring Students Behavior",
          style: TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget ChoicesCard(BuildContext context){
  return Column(
    children: <Widget>[
      Container(
           margin: EdgeInsets.only(top: screenHeight / 4),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                //padding: EdgeInsets.symmetric(vertical: 25.0),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(
                  elevation: 5.0,
                 onPressed: (){
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context) => DoctorLogIN()),); 
                  },
                  padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                    color: Color(0xFF398AE5),
                    child: Text(

                    'DOCTOR',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),

                 ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: (){ 
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentLogIN()),); 
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFF398AE5),
                    child: Text(

                      'STUDENT',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),

                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminLogIN()),);
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFF398AE5),
                    child: Text(

                      'ADMIN',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),

                ),

                ],
            ),
          ),
 ),
      ),
    ],
  );
}
/*import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('home'),
    );
 }
  
}*/
