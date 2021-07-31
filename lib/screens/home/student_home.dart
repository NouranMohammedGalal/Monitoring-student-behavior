import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/screens/authenticate/student_sign_in.dart';
import 'package:gp_app/screens/home/view_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
class _StudentProfileState extends State<StudentProfile> {
  FirebaseUser student;
  
  
  Future <void> getUserName () async{
     FirebaseUser userName = await FirebaseAuth.instance.currentUser();
     setState(() {
       student = userName;
       print( userName.displayName);
     });
  }
  @override
  void initState (){
    super.initState();
    getUserName();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    /*return StreamProvider<QuerySnapshot>.value(
     value: DatabaseService().Student,
     child: Scaffold(*/
     return Scaffold(
      key: _scaffoldKey,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1,0.4,0.7,0.9],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('SIGN OUT',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',),),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
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
                icon: new Icon(
                  Icons.arrow_back,size: 35.0,color: Colors.white,
                ) ,
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentLogIN()),);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.all(98.0),
                child: Text("PROFILE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,
                ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert,size:35,),
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ],
            ),
          ),
          lowerHalf(context),
          ProfileCardlowerHalf(context),
          ProfileCardupperHalf(context),
        ],
      ),
    );
  
  }
//}

Widget lowerHalf(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 750 / 2,
      color: Color(0xFFECF0F3),
    ),
  );
}
Widget ProfileCardlowerHalf(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding( padding: EdgeInsets.symmetric(vertical: circleRadius / 2.0,horizontal: 20),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 120.0),
              child: Row(
                children: <Widget>[
                  Text(student.displayName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),)
//    
                ],
              ),
            ),
            //replace this Container with your Card
            color: Colors.white,
            height: 150.0,
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
                  shape: CircleBorder( ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/person.jpeg',
                        
                      ))),
            ),
          ),
        )
      ],
    ),
  );
}

Widget ProfileCardupperHalf(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: circleRadius / 2.0,horizontal: 20),
          child: Container(
            //replace this Container with your Card
            color: Colors.white,
            height: 450.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(130, 90, 0, 0),
          child: Row(
            children: <Widget>[
              Image.asset('assets/viewreport.jpeg'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,200,93,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),

              RaisedButton(
                elevation: 5.0,
                child: Text("View My Report",
                    style: TextStyle(letterSpacing: 1.5,fontSize: 18,fontWeight: FontWeight.bold,)
                ),
                color: Color(0xFF4B9DFE),
                textColor: Colors.white,
                padding: EdgeInsets.only(
                    left: 38, right: 38, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => ViewReport()),);
                },

              ),
            ],
          ),
        ),
      ],
    ),
  
  );
}
}