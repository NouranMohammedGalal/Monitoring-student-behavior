import 'package:flutter/material.dart';
import 'package:gp_app/main.dart';
import 'package:gp_app/screens/home/doctor_sign_up.dart';
import 'package:gp_app/screens/home/student_sign_up.dart';
import 'package:gp_app/services/database.dart';

class SignUpAs extends StatefulWidget {
  @override
  _SignUpAsState createState() => _SignUpAsState();
}
double screenHeight;
class _SignUpAsState extends State<SignUpAs> {
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
            padding: const EdgeInsets.all(50.0),
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
                      //Navigator.pushNamed(context, '/sign_up');
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => DoctorSignUp()),);
                     },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFF398AE5),
                    child: Text(

                      'Sign Up As DOCTOR',
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
                      MaterialPageRoute(builder: (context) => StudentSignUp()),);
                    },
                    //Navigator.of(context).pushNamed('/sign_up');},
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFF398AE5),
                    child: Text(

                      'Sign Up As STUDENT',
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
