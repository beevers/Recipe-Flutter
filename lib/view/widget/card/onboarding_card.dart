import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPictureCard extends StatelessWidget {
  const OnboardingPictureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        const Align(alignment: Alignment(1, 0), child: FoodPic()),
        Align(
          alignment: const Alignment(-1.3, 0),
          child: Image.asset(
            "assets/images/onboarding/f_image.png",
            scale: 2.3,
          ),
        ),
      ],
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
