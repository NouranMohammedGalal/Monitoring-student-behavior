//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gp_app/screens/home/student_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorViewReport extends StatefulWidget {
  @override
  _DoctorViewReportState createState() => _DoctorViewReportState();
}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
String d1;
String d2;

class _DoctorViewReportState extends State<DoctorViewReport> {
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
                 // Navigator.pushNamed(context,'/StudentProfile');
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentProfile()),);
                },
              ),
              title: Padding(
                padding: const EdgeInsets.all(98.0),
                child: Text("REPORT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,
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
            //my repoort
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
                  shape: CircleBorder( ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/report.jpeg',
                      ))),
            ),
          ),
        ),
     Padding(
          padding: const EdgeInsets.all(100.0), 
          child:
       StreamBuilder(
                      stream: Firestore.instance.collection('Report').snapshots(),
                      builder: (context,snapshot){
                       
                        if (!snapshot. hasData){
                          return Text('Loading Data..Please wait..');
                        }
                      
                      Firestore.instance.collection('Report').getDocuments().then((QuerySnapshot){
                        
                        QuerySnapshot.documents.forEach((element) { 
                           if (element.documentID == '14-8-2020'){
                             print (element.documentID.toString());
                             d1 = element.documentID.toString();
                              d1+= ":";
                             d2 = element.data.toString();
                             d2 = d2.substring(1);
                            
                             d1 +='\n' +  d2 ;
                             d1 = d1.substring(0);
                              d1 = '  ' + d1;
                              for (int i=0 ;i<d1.length ;i++){
                                 if (d1[i] == ':'){
                                   d1 = d1.replaceAll(':', '');
                                 }
                                 if (d1[i] == ','){
                                   d1 = d1.replaceAll(',', '\n ');
                                 }
                                 d1 = d1.replaceAll('}', '');
                              }
                             // check = '';

                           }
                           if (element.documentID == '14-8-2020'){
                             print (element.documentID.toString());
                             d1 = element.documentID.toString();
                              d1+= ":";
                             d2 = element.data.toString();
                             d2 = d2.substring(1);
                            
                             d1 +='\n' +  d2 ;
                             d1 = d1.substring(0);
                              d1 = '  ' + d1;
                              for (int i=0 ;i<d1.length ;i++){
                                 if (d1[i] == ':'){
                                   d1 = d1.replaceAll(':', '');
                                 }
                                 if (d1[i] == ','){
                                   d1 = d1.replaceAll(',', '\n ');
                                 }
                                 d1 = d1.replaceAll('}', '');
                              }
                             // check = '';

                           }
                         else  if (element.documentID == '15-8-2020'){
                             print (element.documentID.toString());
                             d1+= '\n'+'\n';
                             d1 += element.documentID.toString();
                              d1+= ":";
                             d2 = element.data.toString();
                             d2 = d2.substring(1);
                            
                             d1 +='\n' +  d2 ;
                             d1 = d1.substring(0);
                              d1 = '  ' + d1;
                              for (int i=0 ;i<d1.length ;i++){
                                 if (d1[i] == ':'){
                                   d1 = d1.replaceAll(':', '');
                                 }
                                 if (d1[i] == ','){
                                   d1 = d1.replaceAll(',', '\n ');
                                 }
                                 d1 = d1.replaceAll('}', '');
                              }
                             // check = '';

                           }
                          
                        });
                  
                       
                      });
                   

                      Firestore.instance.collection('Report').getDocuments().then((QuerySnapshot){
                        QuerySnapshot.documents.forEach((element2) { 
                        
                        });
                       
                      
                      });
                      
                      // return Text(d2,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black87),);
                     
                       return Text(d1,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black87,),);
                       
                        
                    /*  return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          DocumentSnapshot std_report = snapshot.data.documents[index];
                          return ListTile(
                            Text : std_report['Lina'],);

                        });*/
                   
                      }
       
                      
        ),
        
        ),
      ],
      
    ),
  );
}
