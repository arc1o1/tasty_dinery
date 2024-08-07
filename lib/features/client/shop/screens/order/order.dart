import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_checkout_controller.dart';
import 'package:tasty_dinery/features/client/shop/screens/order/widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(CheckOutController());
    // ignore: unused_local_variable
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: CcAppBar(
        showBackArrow: true,
        centerTitle: true,
        title:
            Text("My Orders", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),

        // orders
        child: CcOrderListItems(),
      ),
    );
  }
}
