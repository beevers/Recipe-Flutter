import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class RecipeCard extends ConsumerWidget {
  const RecipeCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 151,
          height: 151,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              "assets/images/onboarding/ts_image.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity: 0.25,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r), color: white),
                  width: 38.w,
                  height: 38.h,
                ),
              ),
              Icon(
                IconlyLight.heart,
                color: white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
