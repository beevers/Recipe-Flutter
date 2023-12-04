import 'package:flutter/material.dart';
import 'package:recipe_app/data/helper/storage_helper.dart';
import 'package:recipe_app/view/dashboard_screen.dart';
import 'package:recipe_app/view/presentation/onboarding/onboard_screen.dart';
import 'package:recipe_app/view/theme/text_style.dart';

/// A widget that manages the size and layout of the main content based on the device's screen dimensions.
class SizeManager extends StatelessWidget {
  /// Constructs a new instance of SizeManager.
  const SizeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return constraint.maxHeight < 900 && constraint.maxWidth < 450
          ? StorageHelper.getBool('active') == true
              ? const DashboardScreen()
              : const OnboardScreen()
          : _buildWebViewInProgressText();
    });
  }

  /// Builds the "Web View in progress" text widget.
  Widget _buildWebViewInProgressText() {
    return Text(
      "Web View in progress",
      style: RecipeText.big(),
    );
  }
}
