import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/loaders/animation_loader_sizeable.dart';
// import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/shop/controllers/product_order_controller.dart';
import 'package:tasty_dinery/features/shop/screens/order_details/order_details.dart';
import 'package:tasty_dinery/navigation_menu.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/cloud_helper_functions.dart';

class CcOrderListItems extends StatelessWidget {
  const CcOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(OrderController());
    // final cartController = CartController.instance;

    // listview
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          // nothing found widget
          final emptyWidget = CcAnimationLoaderWidgetSizeable(
            text: 'Whoops! No orders Yet',
            animation: CcImages.pencilLoading,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          // helper function to handle loader, no record or error
          final response = CcCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);

          if (response != null) return response;

          // record found
          final orders = snapshot.data!;

          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, index) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                final order = orders[index];

                return CcRoundedContainer(
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
                                Text(order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: CcColors.primary,
                                            fontWeightDelta: 1)),
                                Text(
                                  order.formattedServedDate,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),

                          // 3 - icon button
                          IconButton(
                            onPressed: () =>
                                Get.to(() => OrderDetailsScreen(order: order)),
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
                                const SizedBox(
                                    width: CcSizes.spaceBtnItems_1 / 2),

                                // 2 - status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Order ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.id,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
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
                                const SizedBox(
                                    width: CcSizes.spaceBtnItems_1 / 2),

                                // 2 - status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Order Date",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.formattedOrderDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
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
                );
              });
        });
  }
}
