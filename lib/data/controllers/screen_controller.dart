import 'package:flutter/material.dart';
import 'package:recipe_app/data/helper/storage_helper.dart';
import 'package:recipe_app/view/dashboard_screen.dart';
import 'package:recipe_app/view/presentation/onboarding/onboard_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class SizeManager extends StatelessWidget {
  const SizeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      // print(constraint.maxHeight);
      // print(constraint.maxWidth);
      // print(constraint.minHeight);
      // print(constraint.minWidth);
      return constraint.maxHeight < 900 && constraint.maxWidth < 450
          ? StorageHelper.getBool('active') == true
              ? const DashboardScreen()
              : const OnboardScreen()
          : Text(
              "Web View in progress",
              style: RecipeText.big(),
            );
    });
  }
}
