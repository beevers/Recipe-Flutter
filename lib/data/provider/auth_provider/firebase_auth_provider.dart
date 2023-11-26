import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/services/auth/firebase_auth_service.dart';
import 'package:recipe_app/view_model/auth_vm/firebase_auth_vm.dart';

final firebaseAuthServiceProvider = Provider((ref) => FirebaseAuthService());
final firebaseAuthVmProvider = ChangeNotifierProvider<FirebaseAuthViewModel>(
    (ref) => FirebaseAuthViewModel(ref));
