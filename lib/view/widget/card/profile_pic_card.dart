import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureCard extends ConsumerWidget {
  final bool isRound;
  // final bool isPicture;
  final double width;
  final double height;
  final Color color;
  const ProfilePictureCard(
      {super.key,
      // required this.isPicture,
      required this.isRound,
      this.width = 38,
      this.height = 38,
      this.color = Colors.red});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(isRound ? 100.r : 10.r)),
          child: const Center(child: Text("C")),
        ),
      ],
    );
  }
}
