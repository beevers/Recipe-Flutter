import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view_model/auth_vm/google_auth_vm.dart';

import '../../services/auth/google_auth_service.dart';

final googleAuthServiceProvider = Provider((ref) => GoogleAuthService());

final googleAuthViewModel = ChangeNotifierProvider<GoogleAuthViewModel>(
    (ref) => GoogleAuthViewModel(ref));
