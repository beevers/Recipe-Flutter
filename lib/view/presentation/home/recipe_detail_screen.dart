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
                    width: 375.w,
                    height: 375.h,
                  ),
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

// class ModalContent extends ConsumerWidget {
//   const ModalContent({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: EdgeInsets.only(left: 24.w, right: 24.w),
//       child: SizedBox(
//         height: 400,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 16.h),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: grey, borderRadius: BorderRadius.circular(5.r)),
//                 width: 40.w,
//                 height: 5.h,
//               ),
//             ),
//             HelpSpace.h(23),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "Cacao Maca Walnut Milk",
//                   style: RecipeText.medium(color: const Color(0xff3d5481)),
//                 ),
//               ],
//             ),
//             HelpSpace.h(8),
//             Row(
//               children: [
//                 Text(
//                   "Food",
//                   style: RecipeText.small(),
//                 ),
//                 HelpSpace.w(2),
//                 Image.asset(
//                   "assets/images/onboarding/big_dot.png",
//                   scale: 1.5,
//                 ),
//                 Text(
//                   "  60 mins",
//                   style: RecipeText.small(),
//                 ),
//               ],
//             ),
//             HelpSpace.h(16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const ProfilePictureCard(isRound: true),
//                     HelpSpace.w(8),
//                     Text("Elena Shwelby", style: RecipeText.small(color: dBlue))
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const ProfilePictureCard(isRound: true),
//                     HelpSpace.w(8),
//                     Text("273 Likes", style: RecipeText.small(color: dBlue))
//                   ],
//                 ),
//               ],
//             ),
//             HelpSpace.h(16),
//             Divider(
//               color: lightGrey,
//               thickness: 1,
//             ),
//             HelpSpace.h(16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "Description",
//                   style: RecipeText.small(color: dBlue),
//                 ),
//               ],
//             ),
//             HelpSpace.h(8),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 300,
//                   height: 75,
//                   child: Text(
//                     "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
//                   ),
//                 ),
//               ],
//             ),
//             Divider(
//               color: lightGrey,
//               thickness: 1,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("Ingredients", style: RecipeText.small(color: dBlue)),
//               ],
//             ),
//             HelpSpace.h(16),
//             Column(
//               children: List.generate(
//                 70,
//                 (index) => Row(
//                   children: [
//                     const TickCard(
//                       isValidated: true,
//                     ),
//                     HelpSpace.w(5),
//                     Text(
//                       "4 eggs",
//                       style: RecipeText.small(color: dBlue),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
