import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/utils/page_transistion_utils.dart';
import 'package:recipe_app/view/presentation/authentication/sign_up_screen.dart';
import 'package:recipe_app/view/presentation/home/dashboard_screen.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 107),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back!",
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
                    prefixIcon: IconlyLight.message,
                    isObscure: false,
                    validator: (value) {
                      return null;
                    },
                    controller: TextEditingController(),
                    title: "Email or phone number"),
                HelpSpace.h(16),
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
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: RecipeText.small(color: const Color(0xff2e3d5c)),
                      ),
                    ],
                  ),
                ),
                HelpSpace.h(72),
                AppButton(
                    isLoading: false,
                    title: "Login",
                    function: () {
                      Navigator.push(context,
                          RotationRoute(page: const DashboardScreen()));
                    },
                    isLarge: true),
                HelpSpace.h(24),
                Text(
                  "Or continue with",
                  style: RecipeText.small(),
                ),
                HelpSpace.h(24),
                AppButton(
                    imageTitle: "assets/images/onboarding/google.png",
                    color: red,
                    isLoading: false,
                    function: () {},
                    isLarge: true),
                HelpSpace.h(24),
                RichText(
                    text: TextSpan(
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff2e3d5c),
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: "Don't have any account? "),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              SlideLeftRoute(page: const SignUpScreen()));
                        },
                      text: 'Sign Up',
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1fcc79),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
