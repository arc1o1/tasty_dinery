import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/shop/screens/checkout/checkout.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:tasty_dinery/features/shop/screens/product_details/widgets/rating_favorite_widget.dart';
import 'package:tasty_dinery/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:tasty_dinery/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CcBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - product image slider
            const CcProductImageSlider(),

            // 2 - product details
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Column(
                children: [
                  // ratings and share
                  const CcRatingAndFavorite(),

                  // price, title, stock and brand
                  const CcProductMetaData(),

                  // attributes
                  const CcProductAttributes(),
                  const SizedBox(height: CcSizes.spaceBtnSections),

                  // checkout button
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const CheckoutScreen()),
                        child: const Text("checkout")),
                  ),
                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // description
                  // const CcSectionHeading(
                  //     title: "Description", showActionButton: false),
                  // const SizedBox(height: CcSizes.spaceBtnItems_1),
                  // const ReadMoreText(
                  //   "Food with rich exposure to both meat & vegetables fused with exceptional cooking to fill you with the warmness and indiana flavor. \nThe food comes in three different dishes with each dishes come with different composition of chicken meat as well as warm preparation and offers.\nHope you enjoy it\t\t\t",
                  //   trimLines: 3,
                  //   trimMode: TrimMode.Line,
                  //   trimCollapsedText: "Show More",
                  //   trimExpandedText: "Show Less",
                  //   textAlign: TextAlign.justify,
                  //   moreStyle: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.blue),
                  //   lessStyle: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.blue),
                  // ),

                  // reviews
                  const Divider(),
                  const SizedBox(height: CcSizes.spaceBtnItems_2),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Get.to(() => const ProductReviewsScreen()),
                            child: const CcSectionHeading(
                                title: "Customer Reviews",
                                showActionButton: false),
                          ),
                          TextButton(
                              onPressed: () =>
                                  Get.to(() => const ProductReviewsScreen()),
                              child: const Text("Show More")),
                        ],
                      ),
                    ],
                  ),
                  const UserReviewCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
