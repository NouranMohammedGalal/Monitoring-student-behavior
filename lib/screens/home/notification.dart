

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/screens/home/doctor_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_core/firebase_core.dart';

/*final FirebaseApp app = FirebaseApp(
  options: FirebaseOptions(
     googleAppID: 'gpapp-60383',
     apiKey: '',
     databaseURL: 'https://gpapp-60383.firebaseio.com',)
  
);*/
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
String read = '';
String check = '';
int indx;
String s1,s2;

 
class _NotificationPageState extends State<NotificationPage> {
  FirebaseUser notify;
  
  Future <void> getUserId () async{
     FirebaseUser userId = await FirebaseAuth.instance.currentUser();
     setState(() {
       notify = userId;
       print( userId.uid);
      
     });
  }
  @override
  void initState (){
    super.initState();
    getUserId();
  }
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
                  //Navigator.pushNamed(context,'/DoctorProfile');
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoctorProfile()),);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Text("NOTIFICATION",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,
                ),
              /*  child: Row(
                  children: <Widget>[
                    StreamBuilder(
                      stream: Firestore.instance.collection('Notifications').snapshots(),
                      builder: (context,snapshot){
                        if (!snapshot. hasData){
                          return Text('Loading Data..Please wait..');
                        }
                        return Text(snapshot.data.document[0]);
                      }
                    ),
                  ],
                ),*/
             //  ),
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

Widget ReportCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding( padding: EdgeInsets.symmetric(vertical: circleRadius / 2.0,horizontal: 20),
          child: Container(
            //NOTIFICATION
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
                        'assets/notification_view.jpeg',
                      ))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(100.0), 
          child:
       StreamBuilder(
                      stream: Firestore.instance.collection('Notifications').snapshots(),
                      builder: (context,snapshot){
                       
                        if (!snapshot. hasData){
                          return Text('Loading Data..Please wait..');
                        }
                      
                      Firestore.instance.collection('Lectures').getDocuments().then((QuerySnapshot){
                        
                        QuerySnapshot.documents.forEach((element) { 
                          check = '';
                          s1 = notify.uid;
                          if (element.documentID == '2'){
                          s2 = element.data.values.first;
                          s2.toString();
                          
                            if (' ' +s1 == s2){
                              check = 'hey';
                          }
                          }
                        /*  if (element.documentID == '2' ){
                      
                              if (s1 == s2){
                                read =  element.data.toString();
                              }
                              else read = ''; 
                          }*/
                        });
                     //  print (read);
                       
                      });
                      s1 = '';

                      Firestore.instance.collection('Notifications').getDocuments().then((QuerySnapshot){
                        QuerySnapshot.documents.forEach((element2) { 
                          read = '';
                          if (element2.documentID == '2' ){
                            if (check == 'hey'){
                              print('hi');
                              read = element2.data.toString();
                              read = read.substring(1);
                              read = '  ' + read;
                              for (int i=0 ;i<read.length ;i++){
                                 if (read[i] == ':'){
                                   read = read.replaceAll(':', '');
                                 }
                                 if (read[i] == ','){
                                   read = read.replaceAll(',', '\n ');
                                 }
                                 read = read.replaceAll('}', '');
                              }
                              check = '';
                      
                            }
                          }
                        });
                       
                        print(s1);
                        print (s2);
                     //   print (check);
                      //  print (read);
                      });
                      
                   //   if (read != null)
                     
                       return Text(read,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black87),);
                       
                    //  return   Text(snapshot.data.document().snapshots());
                        // Text(snapshot.data.documents[0]['Reham']),
                     //     ],
                      //  );
                      }
       
                      
        ),
        
        ),
      ],
    ),
  );
 
}
}
