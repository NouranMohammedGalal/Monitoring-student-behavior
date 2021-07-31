import 'package:flutter/material.dart';
import 'package:gp_app/screens/home/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DateOfTimee extends StatefulWidget {
  @override
  _ViewReportState createState() => _ViewReportState();

}
final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
 DateTime _dateTime;
String error;
String d1,d2;

class _ViewReportState extends State<DateOfTimee> {

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
                  Navigator.pushNamed(context,'/doctor_profile');
                },
              ),
        
              title: Padding(
                padding: const EdgeInsets.all(98.0),
                child: Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,
                ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
           Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 750 / 2,
      color: Color(0xFFECF0F3),
    ),
  ),



  Padding(
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
        Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Padding(padding: EdgeInsets.fromLTRB(10, 200, 0, 0)),
              Row(
                
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Padding(padding: EdgeInsets.fromLTRB(0, 0, 120, 100)),
                   Text(_dateTime == null? 'Nothing has been picked yet' : _dateTime.toString(),style:TextStyle(letterSpacing: 0.75,fontSize: 14,fontWeight: FontWeight.bold, ) ,),
                ],
              ),
             
              RaisedButton(
               elevation: 5.0,
               child: Text("Pick a Date",style: TextStyle(letterSpacing: 1.5,fontSize: 18,fontWeight: FontWeight.bold,)),
                color: Color(0xFF4B9DFE),
                textColor: Colors.white,
                padding: EdgeInsets.only(
                    left: 20, right: 25, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                 onPressed: () {
                   showDatePicker(context: context,
                   initialDate: _dateTime == null?DateTime.now():_dateTime,
                   firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                   ).then((date) {
                      setState(() {
                        _dateTime = date;
                        d1 = _dateTime.toString();
                        if (d1 !=null){
                           Firestore.instance.collection('Report').getDocuments().then((QuerySnapshot){
                        
                        QuerySnapshot.documents.forEach((element) {
                         
                          d2 = d1;
                          d2 = element.data.values.first;
                          print (d2);
                        });
                           });
                        }
                        
                      });

                   });
                   
                 },

              ),
            
            
              Padding(padding: EdgeInsets.fromLTRB(0, 100, 200, 0)),
               RaisedButton(
                elevation: 5.0,
                child: Text("Go",style: TextStyle(letterSpacing: 1.5,fontSize: 18,fontWeight: FontWeight.bold,)),
                color: Color(0xFF4B9DFE),
                textColor: Colors.white,
                padding: EdgeInsets.only(
                    left: 20, right: 25, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  if(_dateTime!=null){
                  
                     Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => NotificationPage()),);
                  
                  }
                  
                 /* else {
                    
                   setState((){
                              error = 'you should pick a date';
                              
                            });
                   }*/
                   
                  

                 
                 // Navigator.pushNamed(context, '/notification_page');
                },

               ),
             /* SizedBox(height: 18,),
               Text(
                       error,
                       style: TextStyle(color: Colors.red,fontSize: 14.0),),*/
                    

            ],
          ),
      

        ),
          

      ],
    ),
  ),


          
        ],
      ),
    );
    
  }
  
}

