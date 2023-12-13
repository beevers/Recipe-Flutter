import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/helper/storage_helper.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';

import '../authentication/sign_in_screen.dart';

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
            StorageHelper.setBool('active', false);
            FirebaseAuth.instance.signOut();
            Get.offAll(() => const SignInScreen());
          },
          isLarge: false,
          title: "Firebase Sign Out",
        ),
        HelpSpace.h(20),
        AppButton(
          isLoading: false,
          function: () {
            StorageHelper.setBool('active', false);
            GoogleSignIn().signOut();

            Get.offAll(() => const SignInScreen());
          },
          isLarge: false,
          title: "Google Sign Out",
        ),
        const Text("Profile Screen"),
      ],
    ));
  }
}
