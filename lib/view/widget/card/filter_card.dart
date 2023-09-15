import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/provider/screen_provider.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class FilterCard extends ConsumerWidget {
  final int index;
  const FilterCard({super.key, required this.index});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          width: index == 0 ? 68.w : 83.w,
          height: index == 0 ? 48.h : 47.h,
          decoration: BoxDecoration(
              color: index != 0 ? grey : green,
              borderRadius: BorderRadius.circular(35.r)),
          child: Center(
            child: Text(
              option[index],
              style: RecipeText.small(color: white),
            ),
          ),
        ),
        HelpSpace.w(16)
      ],
    );
  }
}
