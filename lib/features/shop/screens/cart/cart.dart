import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/loaders/animation_loader_sizeable.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/checkout.dart';
import 'package:tasty_dinery/navigation_menu.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    // scaffold
    return Scaffold(
      // appbar
      appBar: CcAppBar(
        showBackArrow: true,
        title: Text("cart", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),

      // body
      body: Obx(
        () {
          // nothing found widget
          final emptyWidget = CcAnimationLoaderWidgetSizeable(
            text: 'Whoops! Cart is EMPTY.',
            animation: CcImages.pencilLoading,
            width: MediaQuery.of(context).size.width * 0.7,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),

                // cart items
                child: CcCartItems(),
              ),
            );
          }
        },
      ),

      // checkout button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CcColors.primary),
                  child: Obx(() =>
                      Text("checkout - ${controller.totalCartPrice.value}/=")),
                ),
              ),
            ),
    );
  }
}
