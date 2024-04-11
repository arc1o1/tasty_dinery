import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/favorite_icon/favorite_icon.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_details/product_details_screen.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcVerticalProductCard extends StatelessWidget {
  const CcVerticalProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.zero,
        width: 160,
        height: 305,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          children: [
            // image
            GestureDetector(
              onTap: () => Get.to(() => ProductDetailsScreen(
                    product: product,
                  )),
              child: CcRoundedContainer(
                width: 160,
                padding: const EdgeInsets.all(CcSizes.sm),
                backgroundColor: Colors.grey.withOpacity(0.2),

                // whare all the elements are placed
                child: CcRoundedImage(
                  imageUrl: product.thumbnail,
                  isNetworkImage: true,
                  applyImageRadius: true,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

            Container(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_2 / 2),

                  // brand text
                  CcBrandTitleWithVerifiedIcon(title: product.brand!),

                  const SizedBox(height: CcSizes.spaceBtnItems_2 / 2),

                  // rating star, rating value, price and favorite icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // rating star
                          Row(
                            children: [
                              Text("Rating: ",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border_rounded,
                                    color: Colors.blue.shade700,
                                    size: CcSizes.iconMd,
                                  ),

                                  // rating value
                                  const SizedBox(
                                      width: CcSizes.spaceBtnItems_1 / 4),
                                  Text(
                                    "5.0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              // price
                              Text("Price  :  ",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              Text(product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                            ],
                          ),
                        ],
                      ),

                      // favorite icon
                      CcFavoriteIcon(productId: product.id),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
