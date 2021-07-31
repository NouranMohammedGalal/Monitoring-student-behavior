import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/services/auth.dart';
import 'package:gp_app/shared/loading.dart';
import 'package:gp_app/screens/home/student_home.dart';
//import 'package:mobileapp/pages/sign_up.dart';
//import 'package:mobileapp/pages/home.dart';
//import 'package:mobileapp/pages/doctor_profile.dart';

class StudentLogIN extends StatefulWidget {
  @override
  //final v=Home();
  _StudentLogINState createState() => _StudentLogINState();

}


class _StudentLogINState extends State<StudentLogIN> {
  final AuthService _auth = AuthService();
  final formkey = new GlobalKey <FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  void validateAndSave(){
    final form = formkey.currentState;
    if (form.validate()){
      form.save();
      print('Form is valid. Email:$email,password:$password');
    } 
    else print('Form is invalid. Email:$email,password:$password');
  }

  /*void validateAndSubmit(){
    if (validateAndSave()) 
  }*/

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1,0.4,0.7,0.9],


              ),
            ),
          ),
           Container(
             height: double.infinity,
             child: Form(
               key: formkey,
             child: SingleChildScrollView(
               physics: AlwaysScrollableScrollPhysics(),
               padding: EdgeInsets.symmetric(
                 horizontal: 40.0,
                 vertical: 120.0,
                 ),
                 
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text('Sign In',
                   style: TextStyle(
                     color: Colors.white,
                     fontFamily: 'LibreBaskerville-Italic',
                     fontSize: 30.0,
                     fontWeight: FontWeight.bold,

                   ),
                     ),
                     SizedBox(height: 30.0,),
               Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('Email',
                     style: TextStyle(color: Colors.white ),

                   ),
                   SizedBox(height: 10.0),
                   Container(
                     alignment: Alignment.centerLeft,
                     decoration: BoxDecoration(
                       border: Border.all(
                         color:Color(0xFF478DE0),

                         width: 1,

                       ),
                       borderRadius: BorderRadius.all(
                           Radius.circular(10.0)),
                     ),
                     height: 60.0,
                     child: TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       style: TextStyle(
                           color: Colors.white,
                           fontFamily: 'OpenSans'
                       ),
                       decoration: InputDecoration(
                         border:InputBorder.none,
                         contentPadding: EdgeInsets.only(top: 14.0),
                         prefixIcon: Icon(
                           Icons.email,
                           color: Colors.white,
                         ),
                         hintText: 'Enter Your Email',
                         hintStyle: TextStyle(color: Colors.white54),
                       ),
                       validator: (val) => val.isEmpty? 'Email can\'t be empty':null,
                       onChanged: (val){
                         setState(() => email = val);
                       },

                     ),
                   
                   
                   ),
               
                 ],
               
               ),
                     SizedBox(height: 30.0,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text('Password',
                       style: TextStyle(color: Colors.white ),

                     ),
                     SizedBox(height: 10.0),
                     Container(
                       alignment: Alignment.centerLeft,
                       decoration: BoxDecoration(
                         border: Border.all(
                           color:Color(0xFF61A4F1),

                           width: 1,

                         ),
                         borderRadius: BorderRadius.all(
                             Radius.circular(10.0)),
                       ),
                       height: 60.0,
                       child: TextFormField(
                         obscureText: true,
                         style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'OpenSans'
                         ),
                         decoration: InputDecoration(
                           border:InputBorder.none,
                           contentPadding: EdgeInsets.only(top: 14.0),
                           prefixIcon: Icon(
                             Icons.lock,
                             color: Colors.white,
                           ),
                           hintText: 'Enter Your Password',
                           hintStyle: TextStyle(color: Colors.white54),

                           suffixIcon: Icon(Icons.visibility_off,color: Colors.white,),
                         ),
                         validator: (val) => val.length < 8? 'Enter at least 8 characters':null,
                         onChanged: (val){
                           setState(() => password = val);
                         },


                       ),

                     ),

                   ],
                 ),
              
           Container(
                 padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                   children: <Widget>[
                     ButtonTheme(
                       minWidth: double.infinity,
                       child: RaisedButton(
                         elevation: 5.0,
                         onPressed: () async{
                           if (formkey.currentState.validate()){
                             setState(() => loading = true);
                             dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                             if (result == null){
                              setState((){
                              error = 'could not sign in with those credentials';
                              loading = false;
                            });
                             }
                           else {
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => StudentProfile()),);
                           print ('signed in successfully');
                           }
                     }
                       },

                         // print('Login Button Pressed'),
                         padding: EdgeInsets.all(15.0),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         color: Colors.white,
                         child: Text(
                           'LOGIN',
                           style: TextStyle(
                             color: Color(0xFF527DAA),
                             letterSpacing: 1.5,
                             fontSize: 18.0,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'OpenSans',
                           ),
                         ),
                       ),

                     ),
                     SizedBox(height: 18,),
                     Text(
                       error,
                       style: TextStyle(color: Colors.red,fontSize: 14.0),),
                   ],
                ),
           ),
              
                
              
               
                   ],
                 ),
             ),
             ),
           ),
             ],
           ),
      

    );
  }
}
