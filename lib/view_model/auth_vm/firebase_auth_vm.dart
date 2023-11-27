import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/data/provider/auth_provider/firebase_auth_provider.dart';
import 'package:recipe_app/view_model/base_vm.dart';

class FirebaseAuthViewModel extends BaseViewModel {
  FirebaseAuthViewModel(super.ref);

  FutureManager signInData = FutureManager();
  FutureManager signUpData = FutureManager();
  FutureManager verifyEmailData = FutureManager();
  FutureManager resetPasswordData = FutureManager();

  Future<bool> signUp() async {
    signUpData.load();
    notifyListeners();
    final result = await ref.read(firebaseAuthServiceProvider).signUp();
    if (result == "success") {
      signUpData.onSuccess("Success");
      notifyListeners();
      return true;
    } else {
      signUpData.onError(result == "true" ? null : result);
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn() async {
    signInData.load();
    notifyListeners();
    final result = await ref.read(firebaseAuthServiceProvider).signIn();
    if (result == "success") {
      signInData.onSuccess("Success");
      notifyListeners();
      return true;
    } else {
      signInData.onError(result);
      notifyListeners();
      return false;
    }
  }

  Future<bool> verifyEmail() async {
    verifyEmailData.load();
    final result = await ref.read(firebaseAuthServiceProvider).verifyEmail();
    if (result) {
      verifyEmailData.onSuccess("Success");
      notifyListeners();
      return true;
    } else {
      verifyEmailData.onError("Could not send verification link Try later");
      notifyListeners();
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    resetPasswordData.load();
    final result =
        await ref.read(firebaseAuthServiceProvider).resetPassword(email);

    if (result == true) {
      resetPasswordData.onSuccess("Password Reset Link Sent");
      notifyListeners();
      return true;
    } else {
      resetPasswordData.onError("Could not send reset link");
      notifyListeners();
      return false;
    }
  }
}
