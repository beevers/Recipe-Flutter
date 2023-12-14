import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/data/provider/drink_provider/get_drink_provider.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/view/presentation/loading/loading_indicator.dart';
import 'package:recipe_app/view/presentation/other/recipe_detail_screen.dart';
import 'package:recipe_app/view/presentation/other/search_screen.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/filter_card.dart';
import 'package:recipe_app/view/widget/card/recipe_card_template.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

import '../../../data/helper/process_helper.dart';
import '../../../data/provider/global_provider/global_var.dart';
import '../../../data/provider/screen_provider.dart';
import '../../widget/card/drink_card_template.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  StateProvider<int> selectedIndexProvider = StateProvider<int>((ref) => 0);
  StateProvider<int> filterIndexProvider = StateProvider<int>((ref) => 0);

  StateProvider<int> drinkSelectedIndexProvider =
      StateProvider<int>((ref) => 0);
  StateProvider<int> foodSelectedIndexProvider = StateProvider<int>((ref) => 0);
  late final TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foodVm = ref.watch(getFoodViewModel).getFoodData.data;
    final drinkVm = ref.watch(getDrinkViewModel).getDrinkData.data;
    return Padding(
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
                      style: RecipeText.medium(color: const Color(0xff3d5481)),
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
                    children: List.generate(
                        ref.watch(viewDrinksProvider)
                            ? drinkOption.length
                            : foodOption.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterCard(
                          selectedIndex: ref.watch(viewDrinksProvider)
                              ? ref.watch(drinkSelectedIndexProvider)
                              : ref.watch(selectedIndexProvider),
                          function: () {
                            ref.watch(viewDrinksProvider)
                                ? ref
                                    .read(drinkSelectedIndexProvider.notifier)
                                    .state = index
                                : ref
                                    .read(selectedIndexProvider.notifier)
                                    .state = index;

                            //
                            ref.watch(viewDrinksProvider)
                                ? ref.read(optionProvider.notifier).state =
                                    drinkOption[index]
                                : ref.read(optionProvider.notifier).state =
                                    foodOption[index];

                            // This method below is used to get data from the api

                            // ref.watch(viewDrinksProvider)
                            //     ? ref.read(getDrinkViewModel).getDrink(
                            //         number: 20,
                            //         query: drinkOption[index].toLowerCase())
                            //     : ref.read(getFoodViewModel).getFood(
                            //         number: 20,
                            //         query: foodOption[index].toLowerCase());
                            //This method above is used to get data from the api
                          },
                          index: index,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              HelpSpace.h(17),
              const Divider(
                color: Color(0xffF4F5F7),
                thickness: 8,
              ),
              HelpSpace.h(5),
              TabBar(
                onTap: (value) {
                  ref.read(viewDrinksProvider.notifier).state = value == 1;
                  ref.watch(viewDrinksProvider)
                      ? ref.read(optionProvider.notifier).state =
                          drinkOption[ref.watch(drinkSelectedIndexProvider)]
                      : ref.read(optionProvider.notifier).state =
                          foodOption[ref.watch(selectedIndexProvider)];
                },
                labelColor: const Color(0xff3E5481),
                unselectedLabelColor: grey,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: green,
                controller: controller,
                tabs: const [
                  Tab(text: "Foods"),
                  Tab(text: "Drinks"),
                ],
              ),
              HelpSpace.h(8),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    // // Content for Tab 1
                    50 == 50
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 12.5, // spacing between rows
                              crossAxisSpacing: 12.5, // spacing between columns
                              childAspectRatio:
                                  0.5, // Adjust this value to control aspect ratio
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // padding around the grid
                            itemCount: 4, // total number of items
                            itemBuilder: (context, index) {
                              return const LoadingIndicator();
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 12.5, // spacing between rows
                              crossAxisSpacing: 12.5, // spacing between columns
                              childAspectRatio:
                                  0.70, // Adjust this value to control aspect ratio
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // padding around the grid
                            itemCount: foodVm!.searchResults?[0].results!
                                .length, // total number of items
                            itemBuilder: (context, index) {
                              extractedMinutes = AppServices.extractMinutes(
                                  foodVm
                                      .searchResults![0].results![index].content
                                      .toString());
                              return foodVm.searchResults![0].results!.isEmpty
                                  ? const Center(child: Text("Empty"))
                                  : FoodCardTemplate(
                                      index: index,
                                      onTap: () {
                                        Get.to(
                                            () => const RecipeDetailScreen());
                                      },
                                    );
                            },
                          ),

                    // Content for Tab 2
                    ref.watch(getDrinkViewModel).getDrinkData.loading ||
                            drinkVm == null
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 12.5, // spacing between rows
                              crossAxisSpacing: 12.5, // spacing between columns
                              childAspectRatio:
                                  0.70, // Adjust this value to control aspect ratio
                            ),
                            // padding: const EdgeInsets.all(
                            //     8.0), // padding around the grid
                            itemCount: 4, // total number of items
                            itemBuilder: (context, index) {
                              return const LoadingIndicator();
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 12.5, // spacing between rows
                              crossAxisSpacing: 12.5, // spacing between columns
                              childAspectRatio:
                                  0.70, // Adjust this value to control aspect ratio
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // padding around the grid
                            itemCount: ref
                                .watch(getDrinkViewModel)
                                .getDrinkData
                                .data
                                ?.recommendedWines
                                ?.length, // total number of items
                            itemBuilder: (context, index) {
                              return DrinkCardTemplate(
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
