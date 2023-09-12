import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class TickCard extends StatelessWidget {
  final bool isValidated;
  const TickCard({super.key, required this.isValidated});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          color: isValidated ? lightGreen : lightGrey,
          borderRadius: BorderRadius.circular(100.r)),
      child: Icon(
        Icons.done_rounded,
        size: 13,
        color: isValidated ? green : grey,
      ),
    );
  }
}
