import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthAbstract {
  Future<UserCredential?> signInWithGoogle(ref);
}
