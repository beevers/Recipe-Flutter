import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/helper/validation_helper.dart';
import 'package:recipe_app/data/provider/auth_provider/firebase_auth_provider.dart';
import 'package:recipe_app/data/utils/notify_user.dart';
import 'package:recipe_app/data/utils/page_transistion_utils.dart';
import 'package:recipe_app/view/presentation/authentication/password_recovery_screen.dart';
import 'package:recipe_app/view/presentation/authentication/sign_up_screen.dart';
import 'package:recipe_app/view/dashboard_screen.dart';
import 'package:recipe_app/view/presentation/authentication/verify_email_screen.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';
import '../../../data/helper/storage_helper.dart';
import '../../../data/provider/auth_provider/google_auth_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final isObscure = StateProvider<bool>((ref) {
    return true;
  });
  @override
  Widget build(BuildContext context) {
    final authVm = ref.watch(firebaseAuthVmProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    validator: (value) =>
                        ValidationHelper.isValidEmail(value.toString()),
                    controller: emailController,
                    title: "Email address"),
                HelpSpace.h(16),
                AppFormField(
                    isIcon: true,
                    prefixIcon: IconlyLight.lock,
                    suffixAction: () {
                      ref.read(isObscure.notifier).state = !ref.read(isObscure);
                    },
                    suffixIcon: ref.watch(isObscure)
                        ? IconlyLight.show
                        : IconlyLight.hide,
                    isObscure: ref.watch(isObscure),
                    validator: (value) => ValidationHelper.isValidInput(
                        value.toString(),
                        minLength: 5),
                    controller: passwordController,
                    title: "Password"),
                HelpSpace.h(24),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PasswordRecoveryScreen());
                        },
                        child: Text(
                          "Forgot Password?",
                          style:
                              RecipeText.small(color: const Color(0xff2e3d5c)),
                        ),
                      ),
                    ],
                  ),
                ),
                HelpSpace.h(72),
                AppButton(
                    isLoading: authVm.signInData.loading,
                    title: "Login",
                    function: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        final response =
                            await ref.read(firebaseAuthVmProvider).signIn();
                        if (response) {
                          StorageHelper.getBool('isEmailVerified') == true
                              ? Get.to(() => const DashboardScreen())
                              : Get.to(() => const VerifyEmailScreen());
                        }
                      } else {
                        return NotifyUser.showAlert(
                            "Please fill all the required fields");
                      }
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
                    function: () {
                      ref.read(googleFirebaseAuthViewModel).signInWithGoogle();
                      Get.to(() => const DashboardScreen());
                    },
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
