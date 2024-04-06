import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/shop/screens/cart/cart.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';

class CcCartCounterIcon extends StatelessWidget {
  const CcCartCounterIcon({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(CartController());

    // stack
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.cartItemsNo.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: CcColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
