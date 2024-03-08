import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/products/cart/add_remove_button.dart';
import 'package:tasty_dinery/common/widgets/products/cart/cart_item.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcCartItems extends StatelessWidget {
  const CcCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: CcSizes.spaceBtnItems_1),
      itemCount: 2,
      itemBuilder: (_, index) => Container(
        // container to give a border layout
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),

        // column that will consist of different cart items information
        child: Column(
          children: [
            // cart item
            const CcCartItem(),

            if (showAddRemoveButtons)
              // const SizedBox(height: CcSizes.spaceBtnItems_1),

              // add remove button row with total price
              if (showAddRemoveButtons)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // extra space
                        SizedBox(width: 97),

                        // remove button
                        CcProductQuantityWithAddRemove(),
                      ],
                    ),

                    // product price
                    CcProductPriceText(price: "10,000"),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
