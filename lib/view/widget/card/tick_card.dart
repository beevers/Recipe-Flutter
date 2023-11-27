import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

import '../../../data/helper/space_helper.dart';

class TickCardWidget extends ConsumerWidget {
  final String title;
  final bool isValidated;
  const TickCardWidget(
      {super.key, required this.title, required this.isValidated});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TickCard(
          isValidated: isValidated,
        ),
        HelpSpace.w(5),
        Text(
          title,
          style: RecipeText.small(
              color: isValidated
                  ? const Color(0xff2e3d5c)
                  : const Color(0xffa0a5c1)),
        ),
      ],
    );
  }
}

class TickCard extends ConsumerWidget {
  final bool isValidated;
  const TickCard({super.key, required this.isValidated});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
