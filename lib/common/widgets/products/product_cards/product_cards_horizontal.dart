import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/common/widgets/products/cart/add_remove_button.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/product_details_screen.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductCardHorizontal extends StatelessWidget {
  const CcProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProductScreen()),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(CcSizes.productImageRadius),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Row(
          children: [
            // thumbnail
            CcRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(CcSizes.sm),
              backgroundColor: Colors.grey.withOpacity(0.2),

              // whare all the elements are placed
              child: const CcRoundedImage(
                imageUrl: CcImages.productImage3,
                applyImageRadius: true,
              ),
            ),

            // details
            SizedBox(
              width: 210,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: CcSizes.sm, left: CcSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // composite row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // food title and brand
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // title text
                              CcProductTitleText(
                                  title: 'Vegetable Rice & Chicken Stew',
                                  smallSize: true),

                              SizedBox(height: CcSizes.spaceBtnItems_2 / 3),

                              CcBrandTitleWithVerifiedIcon(
                                  title: '#rice #chicken'),
                            ],
                          ),
                        ),

                        // favorite icon
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(CcSizes.cardRadiusXs),
                              topRight: Radius.circular(CcSizes.cardRadiusXs),
                              bottomRight:
                                  Radius.circular(CcSizes.cardRadiusXs),
                              bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
                            ),
                          ),
                          child: const SizedBox(
                            width: CcSizes.iconLg,
                            height: CcSizes.iconLg,
                            child: Center(
                              child: Icon(Icons.favorite_rounded,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // const Spacer(),
                    // const SizedBox(height: 10),

                    // rating star and rating value
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_rounded,
                          color: CcColors.primary,
                          size: CcSizes.iconSm,
                        ),
                        const SizedBox(width: CcSizes.spaceBtnItems_1 / 3),
                        Text(
                          "5.0",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),

                    // const SizedBox(height: 10),

                    // price and cart button
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // price
                        Flexible(child: CcProductPriceText(price: '10,000')),

                        // const SizedBox(width: 140),

                        CcProductQuantityWithAddRemove(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
