import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class AppFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final bool isIcon;
  final bool isObscure;
  final String? iconImage;
  final String title;
  final IconData? prefixIcon;
  const AppFormField({
    required this.isObscure,
    required this.validator,
    required this.controller,
    super.key,
    required this.isIcon,
    this.prefixIcon,
    this.iconImage,
    this.suffixIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 56.h,
      child: TextFormField(
        obscureText: isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        cursorColor: green,
        decoration: InputDecoration(
            suffixIcon: Icon(suffixIcon),
            hintStyle: RecipeText.small(),
            hintText: title,
            prefixIcon: isIcon
                ? Icon(prefixIcon)
                : IconImageWidget(
                    iconImage: iconImage,
                  ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(width: 1.5, color: green)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: grey),
                borderRadius: BorderRadius.circular(40.r))),
      ),
    );
  }
}

class IconImageWidget extends ConsumerWidget {
  final String? iconImage;
  const IconImageWidget({super.key, required this.iconImage});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: const EdgeInsets.only(right: 5, left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x1AF67952)),
        width: 48.w,
        height: 45.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                width: 24.w,
                height: 24.h,
                image: AssetImage("assets/images/$iconImage")),
          ],
        ));
  }
}
