import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/presentation/authentication/otp_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  const PasswordRecoveryScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState
    extends ConsumerState<PasswordRecoveryScreen> {
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
                  "Password Recovery!",
                  style: RecipeText.big(),
                ),
                HelpSpace.h(8),
                Text(
                  "Enter your email to recover password",
                  style: RecipeText.small(),
                ),
                HelpSpace.h(32),
                AppFormField(
                    isIcon: true,
                    prefixIcon: IconlyLight.message,
                    isObscure: false,
                    validator: (value) {
                      return null;
                    },
                    controller: TextEditingController(),
                    title: "Enter email"),
                HelpSpace.h(23),
                AppButton(
                    isLoading: false,
                    title: "Request OTP",
                    function: () {
                      Get.to(() => const OtpScreen());
                    },
                    isLarge: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
