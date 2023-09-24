import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/services/email_auth_service.dart';
import 'package:recipe_app/view_model/auth_vm.dart';

final authServiceProvider = Provider((ref) => AuthService());
final authVmProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel(ref));
