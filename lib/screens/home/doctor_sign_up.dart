
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gp_app/main.dart';
import 'package:gp_app/services/auth.dart';
import 'package:gp_app/screens/home/test.dart';
//import 'package:gp_app/pictures/lecture.jpg';
//import 'package:mobileapp/pages/LogIn.dart';
//import 'package:mobileapp/pages/home.dart';

class DoctorSignUp extends StatefulWidget {
  @override
  _DoctorSignUpState createState() => _DoctorSignUpState();
}

double screenHeight;
class _DoctorSignUpState extends State<DoctorSignUp> {

  final AuthService _auth = AuthService();
  final formkey = new GlobalKey <FormState>();

  // text field state
  String name = '';
  String email = '';
  String password = '';
  String error = '';

  void validateAndSave(){
    final form = formkey.currentState;
    if (form.validate()){
      form.save();
      print('Form is valid. Name:$name,Email:$email,password:$password');
    } 
    else print('Form is invalid. Name:$name,Email:$email,password:$password');
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
        Align(
        alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight / 2,
            color: Color(0xFFECF0F3),
          ),
        ),
          Container(
            height: screenHeight / 2,
            child: Image.asset(
              'assets/lecture.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: screenHeight / 4),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Form(
                  key: formkey,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name", hasFloatingPlaceholder: true
                            ,prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          ),
                          validator: (val) => val.isEmpty? 'Name can\'t be empty':null,
                          onChanged: (val){
                            setState(() => name = val);
                          },

                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email", hasFloatingPlaceholder: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (val) => val.isEmpty? 'Email can\'t be empty':null,
                          onChanged: (val){
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password", hasFloatingPlaceholder: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(Icons.visibility,color: Colors.grey[600],),
                          ),
                           validator: (val) => val.length < 8? 'Enter at least 8 characters':null,
                          onChanged: (val){
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Password must be at least 8 characters and include a special character and number",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(),
                            ),
                            FlatButton(
                              child: Text("Sign Up"),
                              color: Color(0xFF4B9DFE),
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () async {
                                //{Navigator.pushNamed(context, '/');},
                                //validateAndSave();
                                if (formkey.currentState.validate()){
                                  dynamic result = await _auth.createUserWithEmailAndPassword_doctor(name, email, password);
                                  if (result == null){
                                    setState(() => error = 'Please supply a valid email');
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red,fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.videocam,
                size: 48,
                color: Colors.white,
              ),
              Text(
                "Monitoring Students Behavior",
                style: TextStyle(
                    fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),

          ],
        ),
      ),

    );
  }
}
