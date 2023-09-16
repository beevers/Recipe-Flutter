import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view/theme/text_style.dart';

class NoNetworkScreen extends ConsumerWidget {
  const NoNetworkScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/profile/network_bad.png",
              scale: 2,
            ),
            Text("No Network", style: RecipeText.big()),
          ],
        ),
      ),
    );
  }
}
