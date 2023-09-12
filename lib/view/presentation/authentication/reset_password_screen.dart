import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/card/tick_card.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
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
                "Reset your password",
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
                  prefixIcon: IconlyLight.lock,
                  suffixIcon: IconlyLight.show,
                  isObscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: TextEditingController(),
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
                  title: "Done",
                  function: !isValidated ? () {} : null,
                  isLarge: true),
            ],
          ),
        ),
      ),
    );
  }
}
