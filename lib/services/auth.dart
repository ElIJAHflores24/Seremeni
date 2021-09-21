import 'package:seremeni/models/user.dart';
import 'package:seremeni/services/data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> registerUser(email,password, password_confrimation)async{
    if(password==password_confrimation){
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      DataService (uid: user.uid).saveUser(user);
      DataService (uid: user.uid).saveQuiz();
      return userFromFirebase(user);
    }
  }

  Future<User> logInUser(email,password)async{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return userFromFirebase(user);
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(userFromFirebase);
  }


User userFromFirebase(FirebaseUser user) {
    return user != null ? User(email: user.email, uid: user.uid) : null;
  }

  Future<String> getCurrentUser() async{
  final FirebaseUser user = await _auth.currentUser();

  final uid = user.uid.toString();
  return uid;
}
}


