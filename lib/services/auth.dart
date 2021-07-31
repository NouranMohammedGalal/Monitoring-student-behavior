import 'package:gp_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_app/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user obj based on firebase user
    User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

   // auth change user stream
     Stream<User> get user {
       return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }
   // get current user
   Future getCurrentUser () async{
     return await _auth.currentUser();
   }

   // Student Sign Up
   
   Future<String> createUserWithEmailAndPassword_student(String name,String email,String password) async{
     final currentUser = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
     // update username
     var userUpdateInfo = UserUpdateInfo();
     userUpdateInfo.displayName = name;
     await currentUser.user.updateProfile(userUpdateInfo);
     await currentUser.user.reload();
     await DatabaseService(uid : currentUser.user.uid).studentData(name, email,password);
     return currentUser.user.uid;
   }
  
   // Doctor Sign Up
   Future<String> createUserWithEmailAndPassword_doctor(String name,String email,String password) async{
     final currentUser = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
     // update username
     var userUpdateInfo = UserUpdateInfo();
     userUpdateInfo.displayName = name;
     await currentUser.user.updateProfile(userUpdateInfo);
     await currentUser.user.reload();
     await DatabaseService(uid : currentUser.user.uid).doctorData(name, email,password);
     return currentUser.user.uid;
   }
   // Sign in
   Future <String> signInWithEmailAndPassword (String email,String password) async {
      try{
        return (await _auth.signInWithEmailAndPassword(email: email, password: password)).user.uid;
      }
      catch(e){
        print(e.toString());
        return null;
      }
      
   }
    
   // Sign out
   SignOut (){
     try {
        return _auth.signOut();
     }
     catch(e){
       print (e.toString());
       return null;
     }
     
   }
}
