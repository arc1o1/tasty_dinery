import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/features/shop/screens/order_details/order_details.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcOrderListItems extends StatelessWidget {
  const CcOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (_, __) =>
          const SizedBox(height: CcSizes.spaceBtnItems_1),
      itemBuilder: (_, index) => CcRoundedContainer(
        padding: const EdgeInsets.all(CcSizes.md),
        showBorder: true,
        borderColor: Colors.grey,
        backgroundColor: Colors.grey.withOpacity(0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // row 1
            Row(
              children: [
                // 1 - icon
                // circle_rounded for completed status....and lets try flutter_spinkit animation
                const Icon(
                  Icons.check_circle_outline_rounded,
                ),
                const SizedBox(width: CcSizes.spaceBtnItems_1 / 2),

                // 2 - status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Served",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: CcColors.primary, fontWeightDelta: 1)),
                      Text(
                        "04 Mar 2024",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),

                // 3 - icon button
                IconButton(
                  onPressed: () => Get.to(() => const OrderDetailsScreen()),
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: CcSizes.iconSm,
                  ),
                ),
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_2),

            // row 2
            Row(
              children: [
                // fisrt sub-row
                Expanded(
                  child: Row(
                    children: [
                      // 1 - icon
                      // circle_rounded for completed status....and lets try flutter_spinkit animation or incomple_circle
                      const Icon(Iconsax.tag),
                      const SizedBox(width: CcSizes.spaceBtnItems_1 / 2),

                      // 2 - status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order ",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("[#35g34]",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // second sub-row
                Expanded(
                  child: Row(
                    children: [
                      // 1 - icon
                      // circle_rounded for completed status....and lets try flutter_spinkit animation or incomple_circle
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: CcSizes.spaceBtnItems_1 / 2),

                      // 2 - status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order Date",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("03 Mar 2024",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
