import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/products/cart/add_remove_button.dart';
import 'package:tasty_dinery/common/widgets/products/cart/cart_item.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';

class CcCartItems extends StatelessWidget {
  const CcCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    // controller
    final cartController = CartController.instance;

    // listview
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, index) => Container(
          // container to give a border layout
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),

          // column that will consist of different cart items information
          child: Obx(
            () {
              final item = cartController.cartItems[index];

              return Column(
                children: [
                  // cart item
                  CcCartItem(cartItem: item),

                  // if (showAddRemoveButtons)
                  // const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // add remove button row with total price
                  if (showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // extra space
                            const SizedBox(width: 97),

                            // remove button
                            CcProductQuantityWithAddRemove(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () =>
                                  cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),

                        // product price
                        CcProductPriceText(
                            price: (item.price * item.quantity)
                                .toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
