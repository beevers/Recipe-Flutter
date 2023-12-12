import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/provider/screen_provider.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class FilterCard extends ConsumerWidget {
  final int index;
  final Function()? function;
  final int? selectedIndex;
  const FilterCard(
      {super.key,
      required this.index,
      required this.function,
      this.selectedIndex});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: index == 0 ? 68.w : 83.w,
        height: index == 0 ? 48.h : 47.h,
        decoration: BoxDecoration(
            color: index == selectedIndex ? green : grey,
            borderRadius: BorderRadius.circular(35.r)),
        child: Center(
          child: Text(
            foodOption[index],
            style: RecipeText.small(color: white),
          ),
        ),
      ),
    );
  }
}
