import 'package:firebase_database/firebase_database.dart';
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

  Future<void> saveQuiz({introduction, animals, travel, beach}) {
    String id = Uuid().v1();
    final quizReference = connection.child('quiz status').child(id);
    quizReference.set({
      'introduction': introduction,
      'animals': animals,
      'travel': travel,
      'beach': beach,
    });
  }
}
