import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'dart:math' as math;

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
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
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
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(0.6, -0.95),
                                  child: Image.asset(
                                    "assets/images/onboarding/f_image.png",
                                    scale: 2.3,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.56, -0.75),
                                  child: Image.asset(
                                    "assets/images/onboarding/s_image.png",
                                    scale: 2.5,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.52, 0.95),
                                  child: Image.asset(
                                    "assets/images/onboarding/last_image.png",
                                    scale: 2,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.7, 0.75),
                                  child: Image.asset(
                                    "assets/images/onboarding/sixth_image.png",
                                    scale: 2,
                                  ),
                                ),
                                const Align(
                                    alignment: Alignment(1, 0),
                                    child: FoodPic()),
                                Align(
                                  alignment: const Alignment(-1.3, 0),
                                  child: Image.asset(
                                    "assets/images/onboarding/f_image.png",
                                    scale: 2.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                        function: () {},
                        isLarge: true),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class FoodPic extends StatelessWidget {
  const FoodPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(100.r),
          ),
          width: 72,
          height: 72,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.r),
          ),
          width: 60,
          height: 60,
          child: ClipOval(
            child: Image.asset(
              "assets/images/onboarding/ts_image.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
