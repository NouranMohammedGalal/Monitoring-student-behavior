
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/models/doctor.dart';
import 'package:gp_app/models/user.dart';
import 'package:gp_app/screens/authenticate/doctor_sign_in.dart';
import 'package:gp_app/screens/home/doctor_view_report.dart';
import 'package:gp_app/screens/home/notification.dart';
//import 'package:flutter/widgets.dart';
import 'package:gp_app/services/auth.dart';
import 'package:gp_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:gp_app/screens/home/doctor_name.dart';
import 'package:gp_app/models/doctor.dart';
import 'package:gp_app/screens/home/date_of_time.dart';
import 'package:gp_app/screens/home/my_students.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
class _DoctorProfileState extends State<DoctorProfile> {
  FirebaseUser user;
  
  Future <void> getUserName () async{
     FirebaseUser userName = await FirebaseAuth.instance.currentUser();
     setState(() {
       user = userName;
       print( userName.displayName);
      
     });
  }
  @override
  void initState (){
    super.initState();
    getUserName();
  }

  DoctorProfile doc = DoctorProfile();
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    /*return StreamProvider<List<Doctor>>.value(
     value: DatabaseService().Doctorstream,
     child: Scaffold(*/
    
    return  Scaffold(
      
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
                  leading: Icon(Icons.description),
                  title: Text('View Reports Of My Students ',
                    style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',),),
                    onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => DoctorViewReport()),);
                },
                  /*onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
      //  builder: (context) => new ListaDeCompras(),));
                  },*/
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
                icon: new Icon(Icons.arrow_back,size: 35.0,color: Colors.white,),
                onPressed: (){
                  //Navigator.pushNamed(context,'/DoctorLogIn');
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoctorLogIN()),);
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
          //prof(context),
          ProfileCardlowerHalf(context),
          ProfileCardupperHalf(context),
      ],
      ),
     );
  
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
Widget ProfileCardlowerHalf(BuildContext context) {
   
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding( padding: EdgeInsets.symmetric(vertical: circleRadius / 2.0,horizontal: 20),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 70.0),
              child: Row(
                children: <Widget>[
                  Text('Dr.',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),),
                  Container(
                    child : Text(user.displayName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),),
                  )
                //  Text(user.displayName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),),
                /*  StreamBuilder(
                    stream: Firestore.instance.collection('Doctor').snapshots(),
                    builder:(context,snapshot){
                      return Column(
                        children:<Widget>[
                         /* Text('Dr.',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black87),
                           
                          ),*/
                          ,
                          
                        Text (snapshot.data.documents[0]['Name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),),

                        ],
                      );
                      
                    }
                  ),*/

                /*  FutureBuilder(
                   future : Provider.of(context).auth.getCurrentUser(),
                   builder : (context,snapshot){
                    if (snapshot.connectionState == ConnectionState.done){
                      return Text("${snapshot.data.displayName}");
                    }
                    else return CircularProgressIndicator();
                    }
                 // Text('Dr.',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black87),
                  
                 ),*/
                  
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

/*Widget displayUserName(context,snapshot){
  final user = snapshot.data;
   return Column(children: <Widget>[
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text("${snapshot.data.name}",style: TextStyle(fontSize: 20),),
     )
   ],
   );
   
}*/
/*Widget prof (BuildContext context){
  return SingleChildScrollView(
    child: Column(
      children:<Widget>[
        FutureBuilder(
          future : Provider.of(context).auth.getCurrentUser(),
          builder : (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return Text("${snapshot.data.displayName}");
          }
          else return CircularProgressIndicator();
          }

        )

      ],
    ),
  );
}*/

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

              Image.asset('assets/notification_icon.jpeg'),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,150,115,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              RaisedButton(
                elevation: 5.0,
                child: Text("Start Notifaying",style: TextStyle(letterSpacing: 1.5,fontSize: 18,fontWeight: FontWeight.bold,)),
                color: Color(0xFF4B9DFE),
                textColor: Colors.white,
                padding: EdgeInsets.only(
                    left: 38, right: 38, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => DateOfTimee()),);
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