import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductAttributes extends StatelessWidget {
  const CcProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = ProductController.instance;

    // column
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
                      title: "Product", showActionButton: false),
                  const SizedBox(width: CcSizes.spaceBtnItems_1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CcProductTitleText(
                              title: "price\t\t\t : ", smallSize: true),

                          const SizedBox(width: CcSizes.spaceBtnItems_1),

                          // sale price
                          CcProductPriceText(
                            price: controller.getProductPrice(product),
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
                            controller.getProductStockStatus(product.stock),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                          ),
                          Text(
                            '\t\t(${product.stock})',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 14,
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
              CcProductTitleText(
                title: product.description!,
                smallSize: true,
                maxLines: 4,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),

        // const SizedBox(height: CcSizes.spaceBtnItems_1),

        // attributes
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Wrap(
        //       spacing: 10,
        //       children: [
        //         CcChoiceChip(
        //             text: "Normal", selected: false, onSelected: (value) {}),
        //         CcChoiceChip(
        //             text: "Combo", selected: true, onSelected: (value) {}),
        //         CcChoiceChip(
        //             text: "Super", selected: false, onSelected: (value) {}),
        //       ],
        //     )
        //   ],
        // )
      ],
    );
  }
}
