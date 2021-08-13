import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:seremeni/models/user.dart';
import 'package:seremeni/services/auth.dart';
import 'package:uuid/uuid.dart';

class DataService {
  final String uid;
  DataService({this.uid});
  final connection = FirebaseDatabase.instance.reference();

  Future<void> saveUser(user) {
    final userRef = connection.child('users').child(user.uid);
    userRef.set({
      'uid': user.uid,
      'email': user.email,
    });
  }

  Future<void> saveQuiz({introduction, animals, travel, beach, user}) async {
    String id = Uuid().v1();
    final quizReference = connection.child('quiz status').child(user);
    quizReference.set({
      'introduction': introduction,
      'animals': animals,
      'travel': travel,
      'beach': beach,
      'uid': user,
    });
  }

  Future<List> quizStatus({user}) async {
    final userTree = connection.child('quiz status').child(user);
    final List status= [];
    await userTree.once().then(
      (DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach(
          (key, values) {
            print("return in database key: $key value: $values");
            status.add(
              values
            );
          },
        );
      },
    );

    return status;
    
  }
}
