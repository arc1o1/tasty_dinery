import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/features/shop/screens/order_details/widgets/order_details_per_row.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              color: Colors.transparent,
              height: 250,
              child: QrImageView(
                data: "[#35g34]",
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
              child: Column(
                children: [
                  // date for both created at and served at

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text("04/03/24, 08:56",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 13)),
                                ],
                              ),
                              Text("Ordering Time",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text("04/03/24, 08:56",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 13)),
                                ],
                              ),
                              Text("Serving Time",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          const SizedBox(width: 10),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // order ID and control number
                  const CcOrderDetailPerRow(
                    // order id
                    icon1: Iconsax.tag,
                    title1: "[#35g34]",
                    subtitle1: "Order ID",

                    // control number
                    icon2: Icons.inventory_rounded,
                    title2: "2024670890",
                    subtitle2: "Control Number",
                  ),

                  const SizedBox(height: CcSizes.spaceBtnSections),

                  // items and quantity and individual price
                  // pass grid for better efficiency in coding
                  const Column(
                    children: [
                      CcMealItems(
                        productString: "Vegetable Rice with Chicken Stew",
                        quantity: "1",
                        price: "10,000",
                      ),
                      CcMealItems(
                        productString: "Vegetable Rice with Chicken Stew",
                        quantity: "1",
                        price: "10,000",
                      ),
                      CcMealItems(
                        productString: "Vegetable Rice with Chicken Stew",
                        quantity: "1",
                        price: "10,000",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text("Products Ordered",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),

                  // total price and price with vat included
                  const SizedBox(height: CcSizes.spaceBtnSections),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text("30,000/=",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text("Total Price",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("31,000/=",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text("Including VAT",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          const SizedBox(width: 30),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnSections),

                  // payment method and total price
                  const CcOrderDetailPerRow(
                    // payment method
                    isChildOneImage: true,
                    imageString1: CcImages.airtel,
                    title1: "Airtel Money",
                    subtitle1: "Payment Method",

                    // phone number
                    icon2: Icons.phone,
                    title2: "0788****976",
                    subtitle2: "Phone Number",
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

class CcMealItems extends StatelessWidget {
  const CcMealItems({
    super.key,
    required this.productString,
    required this.quantity,
    required this.price,
  });
  final String productString, quantity, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CcRoundedContainer(
          width: 40,
          height: 40,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(CcSizes.sm),
          child: Icon(
            Icons.circle,
            color: Colors.blue.shade700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productString,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 11)),
            const SizedBox(width: 5),
            Text("x$quantity",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 11)),
            const SizedBox(width: 15),
            Text("$price/=",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
