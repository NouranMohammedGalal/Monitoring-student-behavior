
import 'package:flutter/material.dart';
import 'package:gp_app/screens/authenticate/authenticate.dart';
import 'package:gp_app/screens/authenticate/select_person.dart';
import 'package:gp_app/screens/home/doctor_home.dart';
import 'package:gp_app/screens/home/student_home.dart';
import 'package:gp_app/screens/home/view_report.dart';
//import 'package:gp_app/screens/home/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:gp_app/models/user.dart';
//import 'package:gp_app/screens/home/home.dart';
class  Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget
   // if (user == null){
      return Authenticate(); 
  //  } else {
  //    return StudentProfile();
  //  }
    
  }
}
