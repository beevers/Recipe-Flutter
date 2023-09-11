import 'package:flutter/material.dart';
import 'package:recipe_app/view/presentation/onboarding/onboard_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class SizeManager extends StatelessWidget {
  const SizeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return constraint.maxHeight < 800 && constraint.maxWidth < 450
          ? const OnboardScreen()
          : Text(
              "Web View in progress",
              style: RecipeText.big(),
            );
      // print(constraint.maxHeight);
      // print(constraint.maxWidth);
      // print(constraint.minHeight);
      // print(constraint.minWidth);
    });
  }
}
