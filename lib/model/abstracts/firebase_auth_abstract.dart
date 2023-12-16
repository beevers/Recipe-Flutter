abstract class FirebaseAbstract {
  Future<String> signIn();
  Future<String> signUp();
  Future<bool> verifyEmail();
  Future<bool> resetPassword(String email);
}
