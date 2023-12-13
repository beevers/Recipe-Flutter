import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

import '../../data/helper/space_helper.dart';
import '../theme/app_color.dart';
import '../widget/card/profile_pic_card.dart';

class LoadingIndicator extends ConsumerWidget {
  const LoadingIndicator({super.key});
  final image =
      'https://ca-times.brightspotcdn.com/dims4/default/fc493d2/2147483647/strip/false/crop/3982x2556+0+0/resize/1486x954!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F01%2F5f%2Fb0da1d324e06bbb11ea6e419a8da%2F1250986-fo-toadstool-cafe20-mam.jpg';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              children: [
                const ProfilePictureCard(
                  isRound: false,
                ),
                HelpSpace.w(8),
                Container(width: 100, height: 10, color: red),
              ],
            ),
            HelpSpace.h(10),
            Container(
              color: red,
              width: 140.w,
              height: 140.h,
            ),
            HelpSpace.h(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Container(
                    height: 20,
                    width: 100,
                    color: red,
                  ),
                ),
              ],
            ),
            HelpSpace.h(16),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 10,
                  color: red,
                ),
              ],
            )
          ],
        ));
  }
}
