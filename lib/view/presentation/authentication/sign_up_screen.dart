import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/process_helper.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/helper/validation_helper.dart';
import 'package:recipe_app/data/provider/auth_provider/firebase_auth_provider.dart';
import 'package:recipe_app/data/utils/notify_user.dart';
import 'package:recipe_app/view/presentation/authentication/verify_email_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/card/tick_card.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

import '../../../data/helper/storage_helper.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  StateProvider hasUppercaseProvider = StateProvider<bool>((ref) {
    return false;
  });
  StateProvider hasLowercaseProvider = StateProvider<bool>((ref) {
    return false;
  });
  final GlobalKey<FormState> _formKeyS = GlobalKey<FormState>();
  final isObscure = StateProvider<bool>((ref) {
    return true;
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Form(
              key: _formKeyS,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: RecipeText.big(),
                  ),
                  HelpSpace.h(8),
                  Text(
                    "Please enter your account here",
                    style: RecipeText.small(),
                  ),
                  HelpSpace.h(32),
                  AppFormField(
                      isIcon: true,
                      prefixIcon: IconlyLight.profile,
                      isObscure: false,
                      validator: (value) =>
                          ValidationHelper.isValidInput(value.toString()),
                      controller: susernameController,
                      title: "Username"),
                  HelpSpace.h(16),
                  AppFormField(
                      isIcon: true,
                      prefixIcon: IconlyLight.message,
                      isObscure: false,
                      validator: (value) =>
                          ValidationHelper.isValidEmail(value.toString()),
                      controller: semailController,
                      title: "Email Address"),
                  HelpSpace.h(14),
                  AppFormField(
                      onChanged: (value) {
                        ref.read(hasUppercaseProvider.notifier).state =
                            AppServices.hasUppercase(value);
                        ref.read(hasLowercaseProvider.notifier).state =
                            AppServices.hasLowercase(value);
                        setState(() {});
                      },
                      suffixAction: () {
                        ref.read(isObscure.notifier).state =
                            !ref.read(isObscure);
                      },
                      isIcon: true,
                      prefixIcon: IconlyLight.lock,
                      suffixIcon: ref.watch(isObscure)
                          ? IconlyLight.show
                          : IconlyLight.hide,
                      isObscure: ref.watch(isObscure),
                      validator: (value) => ValidationHelper.isValidPassword(
                          value.toString(),
                          minLength: 5),
                      controller: spasswordController,
                      title: "Password"),
                  HelpSpace.h(24),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your password must contain:",
                              style: RecipeText.medium(
                                  color: const Color(0xff3d5481)),
                            ),
                            TickCardWidget(
                                title: "At least 8 characters",
                                isValidated:
                                    spasswordController.text.length >= 8),
                            TickCardWidget(
                                title: "Contains a number and symbol",
                                isValidated: spasswordController.text
                                    .contains(RegExp(r'[0-9]'))),
                            TickCardWidget(
                                title: "Contains a symbol",
                                isValidated: spasswordController.text
                                    .contains(RegExp(r'\W'))),
                            TickCardWidget(
                                title: "Contains a uppercase",
                                isValidated:
                                    ref.watch(hasUppercaseProvider) == true),
                            TickCardWidget(
                                title: "Contains a lowercase",
                                isValidated:
                                    ref.watch(hasLowercaseProvider) == true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  HelpSpace.h(23),
                  AppButton(
                      isLoading:
                          ref.watch(firebaseAuthVmProvider).signUpData.loading,
                      title: "Sign Up",
                      function: () async {
                        FocusScope.of(context).unfocus();
                        if (_formKeyS.currentState!.validate()) {
                          //   StorageHelper.setString(
                          //       'username', susernameController.text);
                          //   final response =
                          //       await ref.read(firebaseAuthVmProvider).signUp();
                          //   if (response) {
                          //     Get.to(() => const VerifyEmailScreen());
                          //     NotifyUser.showAlert("Sign Up successful");
                          //   }
                          // } else {
                          //   NotifyUser.showAlert(
                          //       "Please fill all the required fields");
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
