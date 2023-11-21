import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/data/provider/auth_provider/auth_provider.dart';
import 'package:recipe_app/view_model/base_vm.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel(super.ref);

  FutureManager signInData = FutureManager();
  FutureManager signUpData = FutureManager();

  Future<bool> signUp() async {
    signUpData.load();
    notifyListeners();
    final result = await ref.read(authServiceProvider).signUp();
    if (result == "done") {
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
    final result = await ref.read(authServiceProvider).signIn();
    print("result $result");
    if (result == "done") {
      signInData.onSuccess("Success");
      notifyListeners();
      return true;
    } else {
      signInData.onError(result == "true" ? null : result);
      notifyListeners();
      return false;
    }
  }
}
