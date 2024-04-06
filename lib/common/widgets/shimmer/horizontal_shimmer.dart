import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/shimmer/shimmer_effects.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcHorizontalProductShimmer extends StatelessWidget {
  const CcHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CcGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 320,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            CcShimmerEffect(width: 100, height: 150),
            SizedBox(height: CcSizes.spaceBtnItems_1),

            // Column
            Column(
              children: [
                // text
                CcShimmerEffect(width: 260, height: 20),
                SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                CcShimmerEffect(width: 260, height: 20),
                SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                CcShimmerEffect(width: 260, height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
