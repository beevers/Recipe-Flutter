import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/helper/validation_helper.dart';
import 'package:recipe_app/data/provider/auth_provider/firebase_auth_provider.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

import '../../../data/helper/storage_helper.dart';
import '../../dashboard_screen.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  final isValidated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 107),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verify your email",
                  style: RecipeText.big(),
                ),
                HelpSpace.h(8),
                Text(
                  "We have sent a link to your email",
                  style: RecipeText.small(),
                ),
                HelpSpace.h(30),
                AppFormField(
                  isObscure: false,
                  validator: (data) =>
                      ValidationHelper.isValidEmail(data.toString()),
                  controller: semailController,
                  isIcon: true,
                  prefixIcon: IconlyLight.message,
                  title: 'Verify Email',
                ),
                HelpSpace.h(23),
                AppButton(
                    isLoading: ref
                        .watch(firebaseAuthVmProvider)
                        .verifyEmailData
                        .loading,
                    title: "verify Email",
                    function: () {
                      ref.read(firebaseAuthVmProvider).verifyEmail();
                      StorageHelper.getBool('isEmailVerified') == true
                          ? Get.to(() => const DashboardScreen())
                          : Get.to(() => const VerifyEmailScreen());
                    },
                    isLarge: true),
                HelpSpace.h(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
