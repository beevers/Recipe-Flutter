import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class SearchFormField extends ConsumerWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final bool isIcon;
  final bool isObscure;
  final String? iconImage;
  final String title;
  final IconData? prefixIcon;
  const SearchFormField({
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
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 241.w,
      height: 56.h,
      child: TextFormField(
        autofocus: true,
        obscureText: isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        cursorColor: green,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: () {
                controller.clear();
              },
            ),
            hintStyle: RecipeText.small(),
            hintText: title,
            prefixIcon: isIcon
                ? Icon(
                    prefixIcon,
                    color: grey,
                    size: 20,
                  )
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

class AppFormField extends ConsumerWidget {
  final bool? readOnly;
  final Function()? suffixAction;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function()? onTap;
  final IconData? suffixIcon;
  final bool isIcon;
  final bool isObscure;
  final String? iconImage;
  final String title;
  final IconData? prefixIcon;
  const AppFormField({
    this.suffixAction,
    this.readOnly,
    this.onTap,
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: TextFormField(
          readOnly: readOnly ?? false,
          onTap: onTap,
          obscureText: isObscure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          cursorColor: green,
          decoration: InputDecoration(
              //In this case a notify is displaying the error message.
              errorStyle: const TextStyle(fontSize: 0),
              suffixIcon: IconButton(
                onPressed: suffixAction,
                icon: Icon(suffixIcon),
                color: Colors.black,
              ),
              hintStyle: RecipeText.small(),
              hintText: title,
              prefixIcon: isIcon
                  ? Icon(prefixIcon)
                  : IconImageWidget(
                      iconImage: iconImage,
                    ),
              filled: true,
              fillColor: Colors.white,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(width: 1.5, color: red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(width: 1.5, color: red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(
                      width: 1.5, color: readOnly == null ? green : grey)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey),
                  borderRadius: BorderRadius.circular(40.r))),
        ),
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
