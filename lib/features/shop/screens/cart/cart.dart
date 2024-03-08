import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/checkout.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: CcAppBar(
        showBackArrow: true,
        title: Text("cart", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),

      // body
      body: const Padding(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child: CcCartItems(),
      ),

      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            style: ElevatedButton.styleFrom(backgroundColor: CcColors.primary),
            child: const Text("checkout - 10,000/="),
          ),
        ),
      ),
    );
  }
}
