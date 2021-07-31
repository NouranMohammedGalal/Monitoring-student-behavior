
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class PushNotifications {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  FirebaseUser fb;
  

  Future initialise(){
    if (Platform.isIOS){
      // request permission 
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
       onMessage: (Map<String,dynamic>message) async{
         print ('onMessage: $message');
       },
       onLaunch: (Map<String,dynamic>launch) async{
         print ('onMessage: $launch');
       },
       onResume: (Map<String,dynamic>resume) async{
         print ('onMessage: $resume');
       },
    );
  }
}