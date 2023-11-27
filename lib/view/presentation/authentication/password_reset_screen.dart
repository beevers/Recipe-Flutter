import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/utils/notify_user.dart';
import 'package:recipe_app/view/presentation/authentication/otp_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

import '../../../data/controllers/form_controller/text_form_cont.dart';
import '../../../data/provider/auth_provider/firebase_auth_provider.dart';

class PasswordResetScreen extends ConsumerStatefulWidget {
  const PasswordResetScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordResetScreenState();
}

class _PasswordResetScreenState extends ConsumerState<PasswordResetScreen> {
  final isValidated = true;
  final GlobalKey<FormState> _formKeyS = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 107),
          child: Center(
            child: Form(
              key: _formKeyS,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Password Reset!",
                    style: RecipeText.big(),
                  ),
                  HelpSpace.h(8),
                  Text(
                    "Enter your email to reset password",
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
                      controller: resetPasswordController,
                      title: "Enter email"),
                  HelpSpace.h(23),
                  AppButton(
                      isLoading: ref
                          .watch(firebaseAuthVmProvider)
                          .resetPasswordData
                          .loading,
                      title: "Reset Password",
                      function: () async {
                        if (_formKeyS.currentState!.validate()) {
                          final response = await ref
                              .read(firebaseAuthVmProvider.notifier)
                              .resetPassword(resetPasswordController.text);
                          if (response) {
                            NotifyUser.showAlert(
                                "Password reset link sent to your email");
                          }
                        }
                      },
                      isLarge: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
