import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminCustomerDetailInformation extends StatelessWidget {
  const AdminCustomerDetailInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "Customer Details",
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
                    "dashboard/customers/customer_details",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // search bar
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heading
                      Text(
                        "Customer Information",
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
                                "Alphonce Alfred",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 15),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "alphoncealfred@gmail.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          )
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // username
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            ":   alfredo21",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // phone number
                      Row(
                        children: [
                          Text(
                            "Phone Number",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 15.8),
                          Text(
                            ":   0610203040",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      const Divider(),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // last order
                      Row(
                        children: [
                          Text(
                            "Last Order",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            ":   alfredo21",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // username
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            ":   alfredo21",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // username
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            ":   alfredo21",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // username
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15, color: CcColors.darkGrey),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            ":   alfredo21",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
