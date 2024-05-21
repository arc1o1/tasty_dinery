import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/favorite_icon/favorite_icon.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/common/widgets/texts/product_price_text.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_cart_controller.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_details/product_details_screen.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductCardVertical extends StatelessWidget {
  const CcProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = ProductController.instance;
    final cartController = Get.put(CartController());

    // container
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
              width: 95,
              padding: const EdgeInsets.all(CcSizes.sm),
              backgroundColor: Colors.grey.withOpacity(0.2),

              // whare all the elements are placed
              child: CcRoundedImage(
                imageUrl: product.thumbnail,
                applyImageRadius: true,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // title text
                              CcProductTitleText(
                                  title: product.title, smallSize: true),

                              const SizedBox(
                                  height: CcSizes.spaceBtnItems_2 / 2),

                              CcBrandTitleWithVerifiedIcon(
                                  title: product.brand!),
                            ],
                          ),
                        ),

                        // favorite icon
                        CcFavoriteIcon(productId: product.id),
                      ],
                    ),

                    // const Spacer(),
                    const SizedBox(height: 10),

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

                    // price and cart button

                    // row (31:36 => ep 52)
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // price
                          Flexible(
                              child: CcProductPriceText(
                                  price: controller.getProductPrice(product))),

                          // const SizedBox(width: 140),

                          // CcProductQuantityWithAddRemove(),

                          Row(
                            children: [
                              // minus from cart
                              InkWell(
                                onTap: () {
                                  final cartItem = cartController
                                      .convertToCartItem(product, 1);

                                  cartItem.quantity < 1
                                      ? null
                                      : cartController
                                          .removeOneFromCart(cartItem);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: CcColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      topRight:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      bottomRight:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      bottomLeft:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: CcSizes.iconLg,
                                    height: CcSizes.iconLg,
                                    child: Center(
                                      child: Icon(Iconsax.minus,
                                          color: CcColors.white),
                                    ),
                                  ),
                                ),
                              ),

                              // item count
                              const SizedBox(width: CcSizes.spaceBtnItems_1),
                              Text(
                                  cartController
                                      .getProductQuantityInCart(product.id)
                                      .toString(),
                                  style:
                                      Theme.of(context).textTheme.titleSmall),

                              const SizedBox(width: CcSizes.spaceBtnItems_1),

                              // add to cart icon
                              InkWell(
                                onTap: () {
                                  final cartItem = cartController
                                      .convertToCartItem(product, 1);

                                  cartController.addOneToCart(cartItem);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: CcColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      topRight:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      bottomRight:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                      bottomLeft:
                                          Radius.circular(CcSizes.cardRadiusXs),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: CcSizes.iconLg,
                                    height: CcSizes.iconLg,
                                    child: Center(
                                      child: Icon(Iconsax.add,
                                          color: CcColors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
