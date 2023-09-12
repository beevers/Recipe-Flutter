import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/filter_card.dart';
import 'package:recipe_app/view/widget/form/appform_field.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
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
                          style:
                              RecipeText.medium(color: const Color(0xff3d5481)),
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
                  HelpSpace.h(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
