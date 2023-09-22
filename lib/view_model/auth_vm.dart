import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/data/provider/auth_provider/auth_provider.dart';
import 'package:recipe_app/view_model/base_vm.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel(super.ref);

  FutureManager signInData = FutureManager();

  Future<bool> signIn() async {
    signInData.load();
    notifyListeners();
    final result = await ref.read(authServiceProvider).signIn();
    if (result) {
      signInData.onSuccess("Success");
      notifyListeners();
      return true;
    } else {
      signInData.onError("Invalid Credentials");
      notifyListeners();
      return false;
    }
  }
}
