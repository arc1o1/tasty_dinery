import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/chips/choice_chips.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductAttributes extends StatelessWidget {
  const CcProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // selected attribute pricing and description
        CcRoundedContainer(
          padding: const EdgeInsets.all(CcSizes.md),
          borderColor: Colors.grey,
          showBorder: true,
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: Column(
            children: [
              // title, price and stock status
              Row(
                children: [
                  const CcSectionHeading(
                      title: "Variety", showActionButton: false),
                  const SizedBox(width: CcSizes.spaceBtnItems_1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CcProductTitleText(
                              title: "price\t\t: ", smallSize: true),

                          SizedBox(width: CcSizes.spaceBtnItems_1),

                          // sale price
                          CcProductPriceText(
                            price: "10,000",
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),

                      // status: may be "available with no of plates or products" or "out of order"
                      Row(
                        children: [
                          const CcProductTitleText(
                              title: "status : ", smallSize: true),
                          const SizedBox(width: CcSizes.spaceBtnItems_1),
                          Text(
                            "Out of Order",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // variation description, what dos the variant consist of
              const CcProductTitleText(
                title:
                    "An Indian flavorable signature dish made up of rice with mixture of the veggies and roasted chicken meat.",
                smallSize: true,
                maxLines: 4,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1),

        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              spacing: 10,
              children: [
                CcChoiceChip(
                    text: "Normal", selected: false, onSelected: (value) {}),
                CcChoiceChip(
                    text: "Combo", selected: true, onSelected: (value) {}),
                CcChoiceChip(
                    text: "Super", selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
