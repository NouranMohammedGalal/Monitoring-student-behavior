import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gp_app/models/doctor.dart';

class DoctorName extends StatefulWidget {
  @override
  _DoctorNameState createState() => _DoctorNameState();
}

class _DoctorNameState extends State<DoctorName> {
  @override
  Widget build(BuildContext context) {
    final doctorName = Provider.of<List<Doctor>>(context);
    /*doctorName.forEach((doctor) { 
        print (doctor.name);
    });*/
      
    return ListView.builder(
      itemCount: doctorName.length,
      itemBuilder: (context,index){
        
      }
       
    );
  }
}