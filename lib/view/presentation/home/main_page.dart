import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view/presentation/authentication/sign_in_screen.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: SignInScreen()
        // StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator());
        //       } else if (snapshot.hasError) {
        //         return const Center(child: Text("Something Went Wrong"));
        //       } else if (snapshot.hasData) {
        //         return const DashboardScreen();
        //       } else {
        //         return const SignInScreen();
        //       }
        //     }),
        );
  }
}
