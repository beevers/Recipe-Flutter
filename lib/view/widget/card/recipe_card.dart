import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class RecipeImage extends ConsumerWidget {
  final String image;

  const RecipeImage({super.key, required this.image});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              image,
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
