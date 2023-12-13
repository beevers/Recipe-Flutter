import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/card/modal_sheet_content.dart';

class RecipeDetailScreen extends ConsumerStatefulWidget {
  const RecipeDetailScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends ConsumerState<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Stack(
                children: [
                  Container(
                      color: red,
                      width: double.infinity,
                      height: 375.h,
                      child: Image.network(
                        "https://spoonacular.com/recipeImages/632573-312x231.jpg",
                        fit: BoxFit.cover,
                      )),
                  Align(
                    alignment: const Alignment(-0.89, -0.9),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(100.r)),
                            width: 56.w,
                            height: 56.h,
                          ),
                        ),
                        Icon(
                          IconlyLight.arrow_left_2,
                          color: white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          AppButton(
            isLoading: false,
            function: () {
              showModalBottomSheet(
                  useSafeArea: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const ModalBottomSheeet(
                      sheetContent: ModalBottomSheetContent(),
                    );
                  });
            },
            isLarge: false,
            title: "Show Recipe",
          ),
          HelpSpace.h(20)
        ],
      )),
    );
  }
}
