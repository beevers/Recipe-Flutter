import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          isLoading: false,
          function: () {},
          isLarge: false,
          title: "Test APi",
        ),
        HelpSpace.h(20),
        AppButton(
          isLoading: false,
          function: () {
            FirebaseAuth.instance.signOut();
          },
          isLarge: false,
          title: "Firebase Sign Out",
        ),
        HelpSpace.h(20),
        AppButton(
          isLoading: false,
          function: () {
            GoogleSignIn().signOut();
          },
          isLarge: false,
          title: "Google Sign Out",
        ),
        const Text("Profile Screen"),
      ],
    ));
  }
}
