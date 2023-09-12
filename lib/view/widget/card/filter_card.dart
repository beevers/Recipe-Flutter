import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class FilterCard extends ConsumerWidget {
  const FilterCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          width: 68.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: green, borderRadius: BorderRadius.circular(35.r)),
          child: Center(
            child: Text(
              "All",
              style: RecipeText.small(color: white),
            ),
          ),
        ),
        HelpSpace.w(16)
      ],
    );
  }
}
