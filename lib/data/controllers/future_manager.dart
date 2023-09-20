import 'package:flutter/material.dart';
import 'package:recipe_app/data/utils/notify_user.dart';

class FutureManager<T> extends ChangeNotifier {
  bool autoloading = true;
  bool loading = false;
  String? error = "";
  T? data;

  load() {
    loading = true;
    autoloading = true;
    error = "";
    data = null;
    notifyListeners();
  }

  onSuccess(T result) {
    data = result;
    error = "";
    loading = false;
    autoloading = false;
    notifyListeners();
  }

  onError(String? errorMesssage) {
    data = null;
    error = errorMesssage;
    loading = false;
    autoloading = false;
    notifyListeners();
    if (error != null) {
      NotifyUser.showAlert(error ?? "");
    }
  }
}
