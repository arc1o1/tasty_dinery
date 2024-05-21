import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/features/client/shop/screens/order_details/widgets/meal_items.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminOrderDetailScreen extends StatelessWidget {
  const AdminOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Order Details",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "dashboard/orders/order_detail",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // order id
              Row(
                children: [
                  Text(
                    "[#6ce45]",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // customer information
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: CcSizes.spaceBtnItems_1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // customer profile pic
                          const CcCircularImage(
                            image: CcImages.user2,
                            width: 50,
                            height: 50,
                          ),

                          const SizedBox(width: CcSizes.spaceBtnItems_2),

                          // customers name and email
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alphonce Adam",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "a_adam16@gmail.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 16, color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // order information
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const AdminRowComponent(
                        title1: "Date",
                        subtitle1: "25 Mar 2024",
                        title2: "Items",
                        subtitle2: "2 items    ",
                      ),
                      const SizedBox(height: CcSizes.spaceBtnItems_2),
                      AdminRowComponent(
                        showContainer: true,
                        title1: "Status",
                        subtitle1: "Pending",
                        containerColor: Colors.green.withOpacity(0.2),
                        textColor: Colors.lightBlue,
                        title2: "Total",
                        subtitle2: "20000/=",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // order items and etc
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Items",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // items and quantity and individual price
                      // pass grid for better efficiency in coding
                      const Column(
                        children: [
                          CcMealItems(
                            productString: "Vegetable Rice with Chicken Stew",
                            productStringFontSize: 12.3,
                            quantity: "1",
                            quantityStringFontSize: 13,
                            price: "10,000",
                            priceStringFontSize: 13,
                          ),
                          CcMealItems(
                            productString: "Vegetable Rice with Chicken Stew",
                            productStringFontSize: 12.3,
                            quantity: "1",
                            quantityStringFontSize: 13,
                            price: "10,000",
                            priceStringFontSize: 13,
                          ),
                          CcMealItems(
                            productString: "Vegetable Rice with Chicken Stew",
                            productStringFontSize: 12.3,
                            quantity: "1",
                            quantityStringFontSize: 13,
                            price: "10,000",
                            priceStringFontSize: 13,
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

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
                            "30,000/=",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "0.0/=",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

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
                            "330/=",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      const Divider(),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

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
                            "30,330/=",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // payment method
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction Payment",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: CcSizes.spaceBtnItems_1 * 1.5),
                      Row(
                        children: [
                          const CcRoundedImage(
                            imageUrl: CcImages.airtel,
                            height: 30,
                            width: 50,
                            borderRadius: 5,
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment via Airtel Money",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Payment fee 100",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: CcSizes.spaceBtnItems_1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "25th Mar 2024",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "30330/=",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdminRowComponent extends StatelessWidget {
  const AdminRowComponent({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    this.showContainer = false,
    this.textColor,
    this.containerColor,
  });

  final String title1, title2, subtitle1, subtitle2;
  final bool showContainer;
  final Color? textColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
            ),
            const SizedBox(height: CcSizes.spaceBtnItems_2),
            showContainer
                ? Container(
                    width: 100,
                    padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      subtitle1,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17, color: textColor),
                    ),
                  )
                : Text(
                    subtitle1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 17),
                  ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
            ),
            const SizedBox(height: CcSizes.spaceBtnItems_2),
            Text(
              subtitle2,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 17),
            ),
          ],
        )
      ],
    );
  }
}
