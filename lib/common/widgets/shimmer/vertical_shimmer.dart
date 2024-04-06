import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcVerticalProductShimmer extends StatelessWidget {
  const CcVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CcGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 160,
        height: 305,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            CcShimmerEffect(width: 160, height: 160),
            SizedBox(height: CcSizes.spaceBtnItems_1),

            // text
            CcShimmerEffect(width: 160, height: 15),
            SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

            CcShimmerEffect(width: 100, height: 15),
          ],
        ),
      ),
    );
  }
}
