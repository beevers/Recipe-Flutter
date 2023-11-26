import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/data/provider/auth_provider/auth_provider.dart';
import 'package:recipe_app/data/services/auth/firebase_auth_service.dart';
import 'package:recipe_app/view_model/auth_vm/firebase_auth_vm.dart';

// Mock class for FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock class for FirebaseAuthUser
class MockFirebaseUser extends Mock implements User {}

void main() {
  group('Auth Provider', () {
    test('authServiceProvider returns an instance of AuthService', () {
      final container = ProviderContainer();
      final authService = container.read(authServiceProvider);
      expect(authService, isA<AuthService>());
      container.dispose();
    });

    test('authVmProvider returns an instance of AuthViewModel', () {
      final container = ProviderContainer();
      final authViewModel = container.read(authVmProvider);
      expect(authViewModel, isA<AuthViewModel>());
      container.dispose();
    });
  });
}
