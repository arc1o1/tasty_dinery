import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/features/shop/screens/cart/cart.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcBottomAddToCart extends StatelessWidget {
  const CcBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    // container
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: CcColors.darkerGrey.withOpacity(0.2),
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CcSizes.cardRadiusSm),
          topRight: Radius.circular(CcSizes.cardRadiusSm),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // shall i use the add remove button instead of this or not.....
            // depends on how the app reacts
            Row(
              children: [
                // minus from cart
                InkWell(
                  onTap: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CcColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(CcSizes.cardRadiusXs),
                        topRight: Radius.circular(CcSizes.cardRadiusXs),
                        bottomRight: Radius.circular(CcSizes.cardRadiusXs),
                        bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
                      ),
                    ),
                    child: const SizedBox(
                      width: CcSizes.iconLg,
                      height: CcSizes.iconLg,
                      child: Center(
                        child: Icon(Iconsax.minus, color: CcColors.white),
                      ),
                    ),
                  ),
                ),

                // item count
                const SizedBox(width: CcSizes.spaceBtnItems_1),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: CcSizes.spaceBtnItems_1),

                // add to cart icon
                InkWell(
                  onTap: () => controller.productQuantityInCart.value += 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CcColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(CcSizes.cardRadiusXs),
                        topRight: Radius.circular(CcSizes.cardRadiusXs),
                        bottomRight: Radius.circular(CcSizes.cardRadiusXs),
                        bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
                      ),
                    ),
                    child: const SizedBox(
                      width: CcSizes.iconLg,
                      height: CcSizes.iconLg,
                      child: Center(
                        child: Icon(Iconsax.add, color: CcColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // see if an error results in this functional block
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () {
                      controller.addToCart(product);
                      Get.to(() => const CartScreen());
                    },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(CcSizes.md),
                  backgroundColor: CcColors.black,
                  side: const BorderSide(color: CcColors.black)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // cart icon
                  const Icon(Icons.shopping_cart_checkout, size: 25),

                  const SizedBox(width: CcSizes.spaceBtnItems_1 / 2),

                  Text(
                    "cart",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: CcColors.white,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
