import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/data/provider/global_provider/global_var.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/profile_pic_card.dart';
import 'package:recipe_app/view/widget/card/recipe_card.dart';

class DrinkCardTemplate extends ConsumerWidget {
  final int index;
  final Function()? onTap;

  const DrinkCardTemplate(
      {super.key, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 151.w,
        height: 250.h,
        child: Column(
          children: [
            Row(
              children: [
                const ProfilePictureCard(
                  isRound: false,
                ),
                HelpSpace.w(8),
                Text(
                  "Calum Lewis",
                  style: RecipeText.small(color: const Color(0xff2e3d5c)),
                ),
              ],
            ),
            HelpSpace.h(16),
            RecipeImage(
              image: ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    "${foodVm.searchResults![index].results![index].name}",
                    maxLines: 1,
                    style: RecipeText.medium(color: const Color(0xff3d5481)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  ref.watch(optionProvider),
                  style: RecipeText.small(),
                ),
                HelpSpace.w(2),
                Image.asset(
                  "assets/images/onboarding/big_dot.png",
                  scale: 1.5,
                ),
                Text(
                  "price > $extractedMinutes mins",
                  style: RecipeText.small(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
