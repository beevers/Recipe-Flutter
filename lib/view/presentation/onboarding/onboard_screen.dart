import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/utils/page_transistion_utils.dart';
import 'package:recipe_app/view/presentation/authentication/sign_in_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'dart:math' as math;

import 'package:recipe_app/view/widget/card/onboarding_card.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends ConsumerState<OnboardScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 4 * math.pi).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 400.h,
                    width: 375.h,
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: animation.value,
                          child: Container(
                              color: Colors.transparent,
                              height: 400.h,
                              width: 375.h,
                              child: const OnboardingPictureCard()),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/onboarding/center.png",
                            scale: 2.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HelpSpace.h(48),
                  Text(
                    "Start Cooking",
                    style: RecipeText.big(),
                  ),
                  HelpSpace.h(16),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Let's join our community to cook better food!",
                      style: RecipeText.medium(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  HelpSpace.h(72),
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                        isLoading: false,
                        title: "Get Started",
                        function: () {
                          Navigator.push(context,
                              SlideUpRoute(page: const SignInScreen()));
                        },
                        isLarge: true),
                  )
                ],
              ),
            );
          }),
    );
  }
}
