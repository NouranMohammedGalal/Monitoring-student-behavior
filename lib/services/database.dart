import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gp_app/models/doctor.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  // collection reference

  // Admin Collection
  final CollectionReference adminCollection = Firestore.instance.collection('Admin');
    Future adminData  ({String email = ('hanan2000@cis.asu.edu.eg'),String password = ('2000170573')})async{
     return await adminCollection
        .document(uid)
        .setData({'email': email, 'password': password});
  }
  // student collection
  final CollectionReference stdCollection = Firestore.instance.collection('Student');
    Future studentData  (String name,String email,String password)async{
     return await stdCollection
     .document(uid)
     .setData({'Name':name,'Email': email,'Password':password});
  }
  // doctor collection
  final CollectionReference docCollection = Firestore.instance.collection('Doctor');
    Future doctorData  (String name,String email,String password)async{
      return await docCollection
      .document(uid)
      .setData({'Name':name,'Email': email,'Password':password});
  }

  

  // get student stream
 /* Stream <QuerySnapshot> get Student {
    return stdCollection.snapshots();
  }

  // doctor name form snapshot
  List<Doctor> _doctorsNames (QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Doctor(
         name: doc.data['name'] ?? '',
      );

    }).toList();
  }

  // get doctor stream
  Stream <List<Doctor>> get Doctorstream {
    return docCollection.snapshots()
    .map(_doctorsNames);
  }*/
}
