import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/models/doctor.dart';
import 'package:gp_app/models/user.dart';
import 'package:gp_app/screens/authenticate/doctor_sign_in.dart';
import 'package:gp_app/screens/home/notification.dart';
//import 'package:flutter/widgets.dart';
import 'package:gp_app/services/auth.dart';
import 'package:gp_app/services/database.dart';
import 'package:provider/provider.dart';

class profileView extends StatelessWidget{
  @override
Widget build (BuildContext context){
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
}
}