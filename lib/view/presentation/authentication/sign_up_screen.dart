import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/card/tick_card.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final isValidated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 107),
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
                  validator: (value) {
                    return null;
                  },
                  controller: susernameController,
                  title: "Username"),
              HelpSpace.h(16),
              AppFormField(
                  isIcon: true,
                  prefixIcon: IconlyLight.message,
                  isObscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: semailController,
                  title: "Email Address"),
              HelpSpace.h(16),
              AppFormField(
                  isIcon: true,
                  prefixIcon: IconlyLight.lock,
                  suffixIcon: IconlyLight.show,
                  isObscure: false,
                  validator: (value) {
                    return null;
                  },
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
                          style:
                              RecipeText.medium(color: const Color(0xff3d5481)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const TickCard(
                              isValidated: true,
                            ),
                            HelpSpace.w(5),
                            Text(
                              "At least 6 characters",
                              style: RecipeText.small(
                                  color: isValidated
                                      ? const Color(0xff2e3d5c)
                                      : const Color(0xffa0a5c1)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const TickCard(
                              isValidated: false,
                            ),
                            HelpSpace.w(5),
                            Text(
                              "Contains a number",
                              style: RecipeText.small(
                                  color: isValidated
                                      ? const Color(0xff2e3d5c)
                                      : const Color(0xffa0a5c1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              HelpSpace.h(23),
              AppButton(
                  isLoading: false,
                  title: "Sign Up",
                  function: () {},
                  isLarge: true),
            ],
          ),
        ),
      ),
    );
  }
}
