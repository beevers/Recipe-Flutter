import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/storage_helper.dart';

class FirebaseAuthService {
  Future<String> signIn() async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      StorageHelper.setBool('isEmailVerified', response.user!.emailVerified);
      return "success";
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthService Class Error- ${e.toString()}");
      return e.message.toString();
    }
  }

  Future<String> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: semailController.text.trim(),
          password: spasswordController.text.trim());
      return "success";
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthService ${e.toString()}");
      return e.message.toString();
    }
  }

  Future<bool> verifyEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthService ${e.toString()}");
      return false;
    }
  }

//TODO 1: Add resetPassword method
  Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthService ${e.toString()}");
      return false;
    }
  }
}
