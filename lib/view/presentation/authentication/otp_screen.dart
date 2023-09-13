import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/otp_form_field.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
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
                  "Check your email",
                  style: RecipeText.big(),
                ),
                HelpSpace.h(8),
                Text(
                  "We have sent the code to your email",
                  style: RecipeText.small(),
                ),
                HelpSpace.h(32),
                OtpField(
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                ),
                HelpSpace.h(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "code expires in: ",
                      style: RecipeText.small(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "03:12",
                      style: RecipeText.small(color: red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                HelpSpace.h(23),
                AppButton(
                    isLoading: false,
                    title: "Next",
                    function: () {},
                    isLarge: true),
                HelpSpace.h(16),
                OutlinedAppButton(
                    isLoading: false, function: () {}, isLarge: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
