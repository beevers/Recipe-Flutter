import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/filter_card.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Column(
            children: [
              AppFormField(
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
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: List.generate(3, (index) => const FilterCard()),
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
                  children: const [
                    // // Content for Tab 1
                    Center(
                      child: Text("Tab 1 content"),
                    ),
                    // ListView.builder(
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //       return Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: List.generate(
                    //             2, (index) => const RecipeCardTemplate()),
                    //       );
                    //     }),
                    // Content for Tab 2
                    Center(
                      child: Text('Tab 2 Content'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
