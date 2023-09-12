import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class OtpField extends StatelessWidget {
  final Function(String)? onCompleted;
  const OtpField({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      cursorHeight: 23,
      textStyle: TextStyle(
          fontSize: 44.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xffa0a5c1)),
      cursorColor: green,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeColor: green,
        selectedColor: green,
        selectedFillColor: white,
        inactiveColor: grey,
        inactiveFillColor: white,
        inactiveBorderWidth: 1,
        activeBorderWidth: 1.2,
        selectedBorderWidth: 1.2,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(25.r),
        fieldHeight: 72,
        fieldWidth: 72,
        activeFillColor: Colors.white,
      ),
      // animationDuration: Duration(milliseconds: 300),
      // backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: onCompleted,
      onChanged: (value) {},
      beforeTextPaste: (text) {
        // print("Allowing to paste $text");
        // //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        // //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
