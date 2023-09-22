import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class NotifyUser {
  static showAlert(String message, [bool error = false]) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: error ? Colors.red : green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
