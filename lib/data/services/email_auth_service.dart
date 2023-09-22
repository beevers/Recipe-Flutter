import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';

class AuthService {
  Future<bool> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Man Error ${e.toString()}");
      return false;
    }
  }
}
