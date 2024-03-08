import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CcAppBar(
        title: Text(
          "Payment Method",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Customize your payment method",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),

            const Divider(color: Colors.grey),

            const SizedBox(height: CcSizes.spaceBtnItems_2),

            // current payment system
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Online, Seamless Transaction",
                          style: Theme.of(context).textTheme.titleSmall),
                      Icon(Icons.check, color: Colors.blue.shade700),
                    ],
                  ),

                  const Divider(color: Colors.grey),

                  const SizedBox(height: CcSizes.spaceBtnItems_2),

                  // mobile payment info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // image logo for payment mobile facilitator
                          const CcRoundedContainer(
                            width: 35,
                            height: 35,
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                            child: Image(
                              image: AssetImage(CcImages.airtel),
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(width: CcSizes.spaceBtnItems_2),

                          // payment method name
                          Text("Airtel Money",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),

                      // payment number
                      Text("0788****976",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_2 / 2),

                  // outlined button to remove payment method
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Remove",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // change payment Method
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  isDismissible: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 500,
                      child: Column(
                        children: [
                          // close icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.clear_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),

                          // choose payment method header
                          Row(
                            children: [
                              Text(
                                "Choose Payment Method",
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                          // payment method filter container
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.monetization_on),
                                  ),
                                  onChanged: (value) {},
                                  items: [
                                    "Airtel Money",
                                    "Tigo Pesa",
                                    "M-Pesa",
                                    "Halopesa",
                                    "T-Pesa",
                                    "Ezy-Pesa",
                                  ]
                                      .map((option) => DropdownMenuItem(
                                          value: option, child: Text(option)))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: CcSizes.spaceBtnSections / 2),

                          // phone number text field header
                          Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                          // phone number text field header
                          TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.smartphone,
                              ),
                              labelText: "phone number",
                              hintText: '0789400500',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),

                          const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                          // option to remove this number at any time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("You can remove this number"),
                              Switch(
                                value: false,
                                onChanged: (_) {},
                                thumbColor: const MaterialStatePropertyAll(
                                    CcColors.darkerGrey),
                                trackOutlineWidth:
                                    const MaterialStatePropertyAll(0),
                              ),
                            ],
                          ),
                          const SizedBox(height: CcSizes.spaceBtnItems_1),

                          // update button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle_outline_rounded),
                                SizedBox(width: CcSizes.spaceBtnItems_1 / 2),
                                Text("Update Payment Method")
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outlined),
                  SizedBox(width: CcSizes.spaceBtnItems_1 / 2),
                  Text("Change Payment Method")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
