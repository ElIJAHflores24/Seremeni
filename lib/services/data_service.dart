import 'package:firebase_database/firebase_database.dart';


class DataService {
  final String uid;
  DataService({this.uid});
  final connection = FirebaseDatabase.instance.reference();


  Future<void> saveUser(user){
    final userRef=connection.child('users').child(user.uid);
    userRef.set({
      'uid': user.uid,
      'email': user.email,

    });
  }
}