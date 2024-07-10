import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/products/cart/coupon_widget.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_checkout_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_order_controller.dart';
import 'package:tasty_dinery/features/client/shop/screens/cart/widgets/cart_items.dart';
import 'package:tasty_dinery/features/client/shop/screens/checkout/widget/billing_payment_method_section.dart';
import 'package:tasty_dinery/features/client/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:tasty_dinery/features/client/shop/screens/checkout/widget/payment_dialog_box.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/pricing_calculator.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    // ignore: unused_local_variable
    final checkoutController = Get.put(CheckOutController());

    final orderController = Get.put(OrderController());
    final totalAmount = CcPricingCalculator.calculateTotalPrice(subTotal, 'Tz');

    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '99.99',
        status: PaymentItemStatus.final_price,
      )
    ];

    // scaffold
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

                    // SizedBox(height: CcSizes.spaceBtnItems_1),

                    // payment methods
                    CcBillingPaymentMethodSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.openPaymentDialogue(totalAmount)
                : () => CcLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add Items to cart to proceed.'),
            style: ElevatedButton.styleFrom(backgroundColor: CcColors.primary),
            child: Text("Pay $totalAmount/="),
          ),
        ),
      ),
    );
  }
}
