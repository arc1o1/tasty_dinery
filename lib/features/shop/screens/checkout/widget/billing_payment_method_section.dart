import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcBillingPaymentMethodSection extends StatelessWidget {
  const CcBillingPaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CcSectionHeading(
          title: "Payment Method",
          buttonTitle: "Change",
          onPressed: () {
            // to change the payment method and phone number
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
        ),
        const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CcRoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(CcSizes.sm),
                  child: Image(
                    image: AssetImage(CcImages.airtel),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: CcSizes.spaceBtnItems_1 / 2),
                Text("Airtel Money",
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Text("0788****976", style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
