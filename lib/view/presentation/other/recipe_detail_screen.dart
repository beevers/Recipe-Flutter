import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/presentation/web_view/recipe_web_view.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:flutter_html/flutter_html.dart';
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
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Stack(
              children: [
                Container(
                    color: red,
                    width: double.infinity,
                    height: 300.h,
                    child: Image.network(
                      "https://spoonacular.com/recipeImages/632573-312x231.jpg",
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 100,
                  child: Align(
                    alignment: const Alignment(-0.89, 0.4),
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
                  ),
                )
              ],
            ),
          ),
          Html(
            onLinkTap: (url, context, element) {
              Get.to(() => RecipeWebView(
                    url: url ?? 'https://www.google.com.ng/',
                  ));
              // Handle link tap here
              // You can open the link in a browser or perform any other action
            },
            data:
                'The recipe Apple Pie Bars could satisfy your American craving in roughly <b>1 hour and 15 minutes</b>. Watching your figure? This dairy free recipe has <b>134 calories</b>, <b>2g of protein</b>, and <b>3g of fat</b> per serving. For <b>28 cents per serving</b>, you get a dessert that serves 24. 78 people have tried and liked this recipe. A mixture of mcintosh apples, flour, vegetable oil, and a handful of other ingredients are all it takes to make this recipe so flavorful. It is brought to you by Foodista. With a spoonacular <b>score of 21%</b>, this dish is not so super. If you like this recipe, you might also like recipes such as <a href="https://spoonacular.com/recipes/apple-pie-bars-610491">Apple Pie Bars</a>, <a href="https://spoonacular.com/recipes/apple-pie-bars-543608">Apple Pie Bars</a>, and <a href="https://spoonacular.com/recipes/apple-pie-bars-616727">Apple Pie Bars</a>.',
          ),
          const Spacer(),
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
