import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/form_controller/text_form_cont.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';
import 'package:recipe_app/view/widget/card/filter_card.dart';
import 'package:recipe_app/view/widget/card/modal_sheet_content.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    IconlyLight.arrow_left_2,
                  ),
                ),
                HelpSpace.w(5),
                SearchFormField(
                    suffixIcon: Icons.cancel,
                    prefixIcon: IconlyLight.search,
                    isObscure: false,
                    validator: (v) {
                      return null;
                    },
                    controller: searchController,
                    isIcon: true,
                    title: "Search"),
                HelpSpace.w(5),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const WrapModalBottomSheeet(
                                sheetContent: SearchSheetContent());
                          });
                    },
                    icon: const Icon(
                      IconlyBold.filter,
                      size: 20,
                    ))
              ],
            ),
            HelpSpace.h(24),
            Divider(
              thickness: 8,
              color: lightGrey,
            ),
            HelpSpace.h(10),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.time_circle)),
                            Text(
                              "Pancakes",
                              style: RecipeText.medium(),
                            )
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_outward_outlined),
                          onPressed: () {},
                        )
                      ],
                    );
                  }),
            ),
            HelpSpace.h(10),
            Divider(
              thickness: 8,
              color: lightGrey,
            ),
            HelpSpace.h(24),
            Text(
              "Search Suggestion",
              style: RecipeText.medium(),
            ),
            HelpSpace.h(24),
            Row(
              children:
                  List.generate(3, (index) => FilterCard(index: index + 1)),
            )
          ],
        ),
      ),
    );
  }
}

class SearchSheetContent extends ConsumerStatefulWidget {
  const SearchSheetContent({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchSheetContentState();
}

class _SearchSheetContentState extends ConsumerState<SearchSheetContent> {
  double height = 30;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h, bottom: 10.h),
        child: Column(
          children: [
            Text(
              "Add a Filter",
              style: RecipeText.big(color: dBlue),
            ),
            HelpSpace.h(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: RecipeText.medium(color: dBlue),
                ),
              ],
            ),
            HelpSpace.h(31),
            Row(
              children: List.generate(3, (index) => FilterCard(index: index)),
            ),
            HelpSpace.h(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Cooking Duration (in minutes)",
                    style: RecipeText.small(color: dBlue)),
              ],
            ),
            HelpSpace.h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      height = 10;
                    });
                  },
                  child: Text(
                    "<10",
                    style: RecipeText.small(color: height >= 10 ? green : grey),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      height = 35;
                    });
                  },
                  child: Text(
                    "35",
                    style: RecipeText.small(color: height >= 35 ? green : grey),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      height = 60;
                    });
                  },
                  child: Text(
                    ">60",
                    style: RecipeText.small(color: height >= 60 ? green : grey),
                  ),
                ),
              ],
            ),
            Slider(
              min: 10,
              max: 60,
              value: height,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            HelpSpace.h(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  2,
                  (index) => AppButton(
                      title: index == 0 ? "Cancel" : "Done",
                      color: index == 0 ? grey : green,
                      isLoading: false,
                      function: index == 0
                          ? () {
                              Get.back();
                            }
                          : () {},
                      isLarge: false)),
            )
          ],
        ));
  }
}
