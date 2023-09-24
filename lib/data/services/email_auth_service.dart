import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';

class AuthService {
  Future<String> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      return "true";
    } on FirebaseAuthException catch (e) {
      debugPrint("Man Error ${e.toString()}");
      return e.message.toString();
    }
  }

  Future<String> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: semailController.text.trim(),
          password: spasswordController.text.trim());
      return "true";
    } on FirebaseAuthException catch (e) {
      debugPrint("Man Error ${e.toString()}");
      return e.message.toString();
    }
  }
}
