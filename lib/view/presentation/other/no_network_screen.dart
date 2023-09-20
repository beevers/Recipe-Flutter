import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class NoNetworkScreen extends ConsumerWidget {
  const NoNetworkScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 128.w,
              height: 128.h,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(100.r)),
              child: Image.asset(
                "assets/images/profile/network_bad.png",
                scale: 2,
              ),
            ),
            HelpSpace.h(20),
            Text("Connection Failed!!", style: RecipeText.big(color: grey)),
            Text(
              "You will get connected when internet is stable",
              style: RecipeText.medium(),
            )
          ],
        ),
      ),
    );
  }
}
