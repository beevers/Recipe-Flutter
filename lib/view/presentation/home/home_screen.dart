import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/view/presentation/other/recipe_detail_screen.dart';
import 'package:recipe_app/view/presentation/other/search_screen.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/filter_card.dart';
import 'package:recipe_app/view/widget/card/recipe_card_template.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

import '../../../data/provider/global_provider/global_var.dart';
import '../../../data/provider/screen_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  StateProvider<int?> selectedIndexProvider = StateProvider<int?>((ref) => 0);
  late final TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foodVm = ref.watch(getFoodViewModel).getFoodData.data;
    return foodVm == null
        ? Center(
            child: CircularProgressIndicator(
              color: green,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: Column(
                children: [
                  AppFormField(
                    readOnly: true,
                    onTap: () {
                      Get.to(() => const SearchScreen());
                    },
                    isObscure: false,
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                    isIcon: true,
                    title: "Search",
                    prefixIcon: IconlyLight.search,
                  ),
                  HelpSpace.h(16),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Category",
                          style:
                              RecipeText.medium(color: const Color(0xff3d5481)),
                        ),
                      ],
                    ),
                  ),
                  HelpSpace.h(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FilterCard(
                              selectedIndex: ref.watch(selectedIndexProvider),
                              function: () {
                                ref.read(selectedIndexProvider.notifier).state =
                                    index;
                                ref.read(optionProvider.notifier).state =
                                    option[index];
                              },
                              index: index,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  HelpSpace.h(24),
                  const Divider(
                    color: Color(0xffF4F5F7),
                    thickness: 8,
                  ),
                  HelpSpace.h(5),
                  TabBar(
                    labelColor: const Color(0xff3E5481),
                    unselectedLabelColor: grey,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: green,
                    controller: controller,
                    tabs: const [
                      Tab(text: "Left"),
                      Tab(text: "Right"),
                    ],
                  ),
                  HelpSpace.h(8),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        // // Content for Tab 1
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 12.5, // spacing between rows
                            crossAxisSpacing: 12.5, // spacing between columns
                            childAspectRatio:
                                0.67, // Adjust this value to control aspect ratio
                          ),
                          padding: const EdgeInsets.all(
                              8.0), // padding around the grid
                          itemCount: foodVm
                              .searchResults!.length, // total number of items
                          itemBuilder: (context, index) {
                            return foodVm.searchResults![index].results!.isEmpty
                                ? Container()
                                : RecipeCardTemplate(
                                    index: index,
                                    onTap: () {
                                      Get.to(() => const RecipeDetailScreen());
                                    },
                                  );
                          },
                        ),

                        // Content for Tab 2
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 12.5, // spacing between rows
                            crossAxisSpacing: 12.5, // spacing between columns
                            childAspectRatio:
                                0.67, // Adjust this value to control aspect ratio
                          ),
                          padding: const EdgeInsets.all(
                              8.0), // padding around the grid
                          itemCount: 1, // total number of items
                          itemBuilder: (context, index) {
                            return RecipeCardTemplate(
                              index: index,
                              onTap: null,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
