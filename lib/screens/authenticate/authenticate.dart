import 'package:flutter/material.dart';
import 'package:gp_app/screens/authenticate/admin_sign_in.dart';
import 'package:gp_app/screens/authenticate/select_person.dart';
import 'package:gp_app/screens/authenticate/doctor_sign_in.dart';
import 'package:gp_app/screens/home/admin_home.dart';
import 'package:gp_app/screens/home/student_home.dart';

class  Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool ShowSignIn = true;
  void toggleView () {
    setState(() => ShowSignIn = !ShowSignIn);
  }

  @override
  Widget build(BuildContext context) {
    /*if (ShowSignIn){
      return Log_IN();
    }
    else{
      return StudentProfile();
    }*/
    return Container(
      child: SelectPerson(),
    );
  }
}