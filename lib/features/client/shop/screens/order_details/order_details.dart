import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/features/client/personnalization/controllers/user_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_order_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/cart_item_model.dart';
import 'package:tasty_dinery/features/client/shop/models/order_model.dart';
import 'package:tasty_dinery/features/client/shop/screens/order_details/widgets/full_screen_qrcode.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    // controller
    // ignore: unused_local_variable
    final orderController = Get.put(OrderController());
    // ignore: unused_local_variable
    final cartController = Get.put(CartController());

    final userController = Get.put(UserController());

    String qrcodeData = userController.user.value.id + order.id;

    // scaffold
    return Scaffold(
      appBar: CcAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text("Order Details",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Column(
          children: [
            // QR Code takes one argument from the database which is "order id"
            // inrease the height of the container for more clarification
            InkWell(
              onTap: () => Get.to(() => FullScreenQRCode(data: qrcodeData)),
              child: Container(
                padding: const EdgeInsets.only(bottom: 5),
                color: Colors.transparent,
                height: 250,
                child: QrImageView(
                  data: qrcodeData,
                ),
              ),
            ),

            Container(
              // height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),

              // outer column
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // only one
                  // inside row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // first
                      // column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 01
                          // ordering time
                          Text(
                            order.formattedOrderDate,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13),
                          ),
                          Text(
                            "Ordering Time",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          const SizedBox(height: CcSizes.spaceBtnItems_1),

                          // 02
                          // order id
                          Text(
                            order.orderID,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13),
                          ),
                          Text(
                            "Order ID",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),

                      // second
                      // column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 01
                          // served time
                          Text(
                            order.formattedServedDate,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13),
                          ),

                          Text("Served Time",
                              style: Theme.of(context).textTheme.bodySmall),

                          const SizedBox(height: CcSizes.spaceBtnItems_1),

                          // 02
                          // control number
                          Text(
                            '2024670890',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13),
                          ),

                          Text("Control Number  ",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnSections),

                  // items and quantity and individual price
                  // pass grid for better efficiency in coding

                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: order.items.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 5),
                    itemBuilder: (_, index) {
                      final itemBought = order.items[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CcBoughtProductItems(itemBought: itemBought),
                        ],
                      );
                    },
                  ),
                  Text("Products Ordered",
                      style: Theme.of(context).textTheme.bodySmall),

                  // total price and price with vat included
                  const SizedBox(height: CcSizes.spaceBtnSections),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // first
                      // column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 01
                          // total price without vat
                          Text(
                            '${(order.totalAmount) / 1.01}/=',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "Total Price",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          const SizedBox(height: CcSizes.spaceBtnItems_1),

                          // 02
                          // payment method
                          Row(
                            children: [
                              // text
                              Text(order.paymentMethod,
                                  style: Theme.of(context).textTheme.bodyLarge),

                              // image
                              CcRoundedContainer(
                                width: 35,
                                height: 35,
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.all(CcSizes.sm),
                                child: Image(
                                  image: AssetImage(
                                    order.paymentMethod == 'Airtel Money'
                                        ? CcImages.airtel
                                        : order.paymentMethod == 'Tigo Pesa'
                                            ? CcImages.tigo
                                            : order.paymentMethod == 'Halo Pesa'
                                                ? CcImages.halotel
                                                : order.paymentMethod ==
                                                        'M-Pesa'
                                                    ? CcImages.vodacom
                                                    : CcImages.ttcl,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                          Text('Payment Method',
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),

                      // second
                      // column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 01
                          // total price with vat
                          Text(
                            '${order.totalAmount}/=',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "Including VAT",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          const SizedBox(height: CcSizes.spaceBtnItems_1),

                          const SizedBox(height: 5),

                          // 02
                          // payment number

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                order.paymentNumber,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 13),
                              )
                            ],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              Text('Payment Number',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CcBoughtProductItems extends StatelessWidget {
  const CcBoughtProductItems({
    super.key,
    required this.itemBought,
  });

  final CartItemModel itemBought;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cartController = CartController.instance;
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 3),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.transparent,
            width: 175,
            child: Text(
              '${itemBought.title} x ${itemBought.quantity}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            color: Colors.transparent,
            width: 89,
            child: Text(
              '${itemBought.price * itemBought.quantity}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
