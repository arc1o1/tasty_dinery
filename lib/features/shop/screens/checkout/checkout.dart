import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/products/cart/coupon_widget.dart';
import 'package:tasty_dinery/common/widgets/success_screen/success_screen.dart';
import 'package:tasty_dinery/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/widget/billing_payment_method_section.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:tasty_dinery/features/shop/screens/order/order.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CcAppBar(
        showBackArrow: true,
        title: Text("order review",
            style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // items in cart
              const CcCartItems(showAddRemoveButtons: false),

              const SizedBox(height: CcSizes.spaceBtnSections),

              // coupon textfields
              const CcCouponCode(),

              const SizedBox(height: CcSizes.spaceBtnSections),

              // billing section
              CcRoundedContainer(
                padding: const EdgeInsets.all(CcSizes.md),
                showBorder: true,
                borderColor: Colors.grey,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Column(
                  children: [
                    // pricing
                    CcBillingAmountSection(),

                    SizedBox(height: CcSizes.spaceBtnItems_1),

                    // divider
                    Divider(),

                    SizedBox(height: CcSizes.spaceBtnItems_1),

                    // payment methods
                    CcBillingPaymentMethodSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => Get.to(
              () => SuccessScreen(
                image: CcImages.successScreen,
                title: "Payment In Progress",
                subtitle:
                    "Payment pop-up window didn't show up? \nYou can also pay using control number below: \n\n2024670890",
                onPressed: () => Get.off(() => const OrderScreen()),
              ),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: CcColors.primary),
            child: const Text("Pay Now"),
          ),
        ),
      ),
    );
  }
}
