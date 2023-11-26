// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:recipe_app/data/provider/auth_provider/firebase_auth_provider.dart';
// import 'package:recipe_app/data/services/auth/firebase_auth_service.dart';
// import 'package:recipe_app/view_model/auth_vm/firebase_auth_vm.dart';

// // Mock class for FirebaseAuth
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// // Mock class for FirebaseAuthUser
// class MockFirebaseUser extends Mock implements User {}

// void main() {
//   group('Auth Provider', () {
//     test(
//         'FirebaseAuthServiceProvider returns an instance of FirebaseAuthService',
//         () {
//       final container = ProviderContainer();
//       final FirebaseAuthService = container.read(firebaseAuthServiceProvider);
//       expect(FirebaseAuthService, isA<FirebaseAuthService>());
//       container.dispose();
//     });

//     test('authVmProvider returns an instance of FirebaseAuthViewModel', () {
//       final container = ProviderContainer();
//       final FirebaseAuthViewModel = container.read(authVmProvider);
//       expect(FirebaseAuthViewModel, isA<FirebaseAuthViewModel>());
//       container.dispose();
//     });
//   });
// }
