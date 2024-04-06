import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';

class CcCategoryShimmer extends StatelessWidget {
  const CcCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: CcSizes.spaceBtnItems_1,
        ),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              CcShimmerEffect(width: 55, height: 55, radius: 55),

              SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

              // text
              CcShimmerEffect(width: 55, height: 10),
            ],
          );
        },
      ),
    );
  }
}
