import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/helper/storage_helper.dart';

// ViewModel class responsible for handling Google Authentication
class GoogleAuthViewModel extends ChangeNotifier {
  final _loadingProvider = StateProvider<bool>((ref) => false);

  StateProvider<bool> get loadingProvider => _loadingProvider;

  // Method to initiate Google Sign-In and authenticate the user
  Future<UserCredential?> signInWithGoogle(WidgetRef ref) async {
    try {
      // Set loading state to true to indicate that the authentication process is ongoing
      ref.read(loadingProvider.notifier).state = true;

      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      // Set 'activeUser' flag based on whether the user signed in successfully

      // Set loading state to false as the authentication process is complete
      ref.read(loadingProvider.notifier).state = false;

      // Obtain authentication details from Google Sign-In
      final GoogleSignInAuthentication? googleAuth = await user?.authentication;

      // Create new credential using Google authentication details
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in to Firebase using the obtained credential
      final logDetails =
          await FirebaseAuth.instance.signInWithCredential(credential);

      StorageHelper.setBool('truGoogleAuth', true);
      // Return the user credential details
      return logDetails;
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException, such as displaying error messages
      debugPrint(e.message);
    }

    // Return null in case of an error
    return null;
  }
}
