import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class AppButton extends ConsumerWidget {
  final String? imageTitle;
  final bool isLoading;
  final bool isLarge;
  final String? title;
  final Function()? function;
  final Color color;
  const AppButton(
      {required this.isLoading,
      this.title,
      this.imageTitle,
      required this.function,
      required this.isLarge,
      this.color = const Color(0xff1FCC79),
      super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: isLarge ? Size(327.w, 56.h) : Size(205.w, 59.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.r))),
        onPressed: function,
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : imageTitle == null
                ? Text(
                    title.toString(),
                    style: RecipeText.small(
                        color: title == "Send Again" ? grey : Colors.white),
                  )
                : Image.asset(
                    imageTitle.toString(),
                    scale: 2,
                  ));
  }
}
