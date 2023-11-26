import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view_model/auth_vm/google_auth_vm.dart';

final googleAuthViewModel =
    ChangeNotifierProvider<GoogleAuthViewModel>((ref) => GoogleAuthViewModel());
