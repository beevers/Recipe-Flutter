import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view_model/auth_vm/google_auth_vm.dart';

import '../../services/auth/google_auth_service.dart';

final googleFirebaseAuthServiceProvider =
    Provider((ref) => GoogleFirebaseAuthService());

final googleFirebaseAuthViewModel =
    ChangeNotifierProvider<GoogleFirebaseAuthViewModel>(
        (ref) => GoogleFirebaseAuthViewModel(ref));
