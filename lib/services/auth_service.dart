import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Register User

  Future<User?> register(String email, String password) async {
    UserCredential userCerdential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCerdential.user;
  }

  //login

  Future<User?> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}