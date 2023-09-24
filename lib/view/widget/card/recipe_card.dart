import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class RecipeCard extends ConsumerWidget {
  final int index;

  const RecipeCard({super.key, required this.index});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodVm = ref.watch(getFoodViewModel).getFoodData.data;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 151,
          height: 151,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              "${foodVm!.searchResults![index].results![index].image}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity: 0.25,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r), color: white),
                  width: 38.w,
                  height: 38.h,
                ),
              ),
              Icon(
                IconlyLight.heart,
                color: white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
