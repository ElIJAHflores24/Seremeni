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

  


  Future<void> saveQuiz({introduction, animals, travel, beach, user}) {
    String id = Uuid().v1();
    final quizReference = connection.child('users').child(user).child(id).child('quizStatus');
    quizReference.push().set({
      'introduction': introduction,
      'animals': animals,
      'travel': travel,
      'beach': beach,
    });
  }
}
