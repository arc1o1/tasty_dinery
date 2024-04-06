import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/pricing_calculator.dart';

class CcBillingAmountSection extends StatelessWidget {
  const CcBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    // cart controller
    final cartController = Get.put(CartController());
    final subTotal = cartController.totalCartPrice.value;

    // column
    return Column(
      children: [
        // subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "$subTotal/=",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax Fee",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "${CcPricingCalculator.calculateTax(subTotal, 'Tz')}/=",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

        // subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "${CcPricingCalculator.calculateTotalPrice(subTotal, 'Tz')}/=",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        // const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
      ],
    );
  }
}
