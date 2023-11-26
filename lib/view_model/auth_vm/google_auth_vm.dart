import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/view_model/base_vm.dart';

import '../../data/provider/auth_provider/google_auth_provider.dart';

class GoogleAuthViewModel extends BaseViewModel {
  GoogleAuthViewModel(super.ref);

  FutureManager googleSignInData = FutureManager();

  Future<bool> signInWithGoogle() async {
    googleSignInData.load();
    notifyListeners();
    final result =
        await ref.read(googleAuthServiceProvider).signInWithGoogle(ref);
    if (result != null) {
      googleSignInData.onSuccess(result);
      notifyListeners();
      return true;
    } else {
      googleSignInData.onError("An Error occured");
      notifyListeners();
      return false;
    }
  }
}
