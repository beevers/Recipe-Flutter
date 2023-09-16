import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/helper/space_helper.dart';
import 'package:recipe_app/view/theme/app_color.dart';
import 'package:recipe_app/view/theme/text_style.dart';
import 'package:recipe_app/view/widget/card/profile_pic_card.dart';
import 'package:recipe_app/view/widget/card/tick_card.dart';

//ensure all this parameter
// useSafeArea: true,
//  isScrollControlled: true,

class WrapModalBottomSheeet extends ConsumerStatefulWidget {
  final Widget sheetContent;
  const WrapModalBottomSheeet({super.key, required this.sheetContent});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WrapModalBottomSheeetState();
}

class _WrapModalBottomSheeetState extends ConsumerState<WrapModalBottomSheeet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [widget.sheetContent],
    );
  }
}

class ModalBottomSheeet extends ConsumerStatefulWidget {
  final Widget sheetContent;
  const ModalBottomSheeet({super.key, required this.sheetContent});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModalBottomSheeetState();
}

class _ModalBottomSheeetState extends ConsumerState<ModalBottomSheeet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 1,
        minChildSize: 0.7,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            //The sheet content is the child widget.
            child: widget.sheetContent,
          );
        });
  }
}

//This bottom sheet scrolls like a roller pin
class ModalBottomSheet extends ConsumerStatefulWidget {
  const ModalBottomSheet({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModalBottomSheetState();
}

class _ModalBottomSheetState extends ConsumerState<ModalBottomSheet> {
  StateProvider<double> heightProvider = StateProvider<double>((ref) => 500.0);

  void _handleScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      ref.read(heightProvider.notifier).state =
          300.0 + notification.metrics.pixels;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = ref.watch(heightProvider);
    return SizedBox(
        height: currentHeight,
        child: SizedBox(
          height: currentHeight,
          child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _handleScroll(notification);
                return true;
              },
              child: const ModalBottomSheetContent()),
        ));
  }
}
//It ends here

class ModalBottomSheetContent extends ConsumerStatefulWidget {
  const ModalBottomSheetContent({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModalBottomSheetContentState();
}

class _ModalBottomSheetContentState
    extends ConsumerState<ModalBottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Container(
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(5.r)),
              width: 40.w,
              height: 5.h,
            ),
          ),
          HelpSpace.h(23),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Cacao Maca Walnut Milk",
                style: RecipeText.medium(color: const Color(0xff3d5481)),
              ),
            ],
          ),
          HelpSpace.h(8),
          Row(
            children: [
              Text(
                "Food",
                style: RecipeText.small(),
              ),
              HelpSpace.w(2),
              Image.asset(
                "assets/images/onboarding/big_dot.png",
                scale: 1.5,
              ),
              Text(
                "  60 mins",
                style: RecipeText.small(),
              ),
            ],
          ),
          HelpSpace.h(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const ProfilePictureCard(isRound: true),
                  HelpSpace.w(8),
                  Text("Elena Shwelby", style: RecipeText.small(color: dBlue))
                ],
              ),
              Row(
                children: [
                  const ProfilePictureCard(isRound: true),
                  HelpSpace.w(8),
                  Text("273 Likes", style: RecipeText.small(color: dBlue))
                ],
              ),
            ],
          ),
          HelpSpace.h(16),
          Divider(
            color: lightGrey,
            thickness: 1,
          ),
          HelpSpace.h(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: RecipeText.small(color: dBlue),
              ),
            ],
          ),
          HelpSpace.h(8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 75,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                ),
              ),
            ],
          ),
          Divider(
            color: lightGrey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Ingredients", style: RecipeText.small(color: dBlue)),
            ],
          ),
          HelpSpace.h(16),
          Column(
            children: List.generate(
              70,
              (index) => Row(
                children: [
                  const TickCard(
                    isValidated: true,
                  ),
                  HelpSpace.w(5),
                  Text(
                    "4 eggs",
                    style: RecipeText.small(color: dBlue),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
