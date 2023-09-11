import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class AppFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isObscure;
  final String image;
  final String title;
  const AppFormField({
    required this.isObscure,
    required this.validator,
    required this.controller,
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      cursorColor: const Color(0xffF67952),
      decoration: InputDecoration(
          hintStyle: RecipeText.small(color: const Color(0xffF67952)),
          hintText: title,
          prefixIcon: Container(
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
                      image: AssetImage("assets/images/$image")),
                ],
              )),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 1.5, color: Color(0xffF67952))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
