import 'package:crowd_food/screens/welcome_screen.dart';
import 'package:crowd_food/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign-in with email and password
  Future<void> signUpUser(
      {BuildContext context,
      String name,
      String email,
      String password,
      String imageUrl}) async {
    try {
      final AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user.uid != null) {
        await DatabaseService().createUser(
          uid: result.user.uid,
          name: name,
          email: email,
          profileImageUrl: "",
        );
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e);
      return null;
    }
  }

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, WelcomeScreen.id);
  }

  Future<AuthResult> signInUser({String email, String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
