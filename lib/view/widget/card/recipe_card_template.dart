import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/data/provider/global_provider/global_var.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/profile_pic_card.dart';
import 'package:recipe_app/view/widget/card/recipe_card.dart';

class FoodCardTemplate extends ConsumerWidget {
  final int index;
  final Function()? onTap;

  const FoodCardTemplate({super.key, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodVm = ref.watch(getFoodViewModel).getFoodData.data;
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
              image: foodVm!.searchResults![0].results![index].image!
                      .contains('wximages')
                  ? 'https://ca-times.brightspotcdn.com/dims4/default/fc493d2/2147483647/strip/false/crop/3982x2556+0+0/resize/1486x954!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F01%2F5f%2Fb0da1d324e06bbb11ea6e419a8da%2F1250986-fo-toadstool-cafe20-mam.jpg'
                  : foodVm.searchResults![0].results![index].image.toString(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    "${foodVm.searchResults![0].results![index].name}",
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
                  " > $extractedMinutes mins",
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
