import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/common/widgets/shimmer/horizontal_shimmer.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_controller.dart';
import 'package:tasty_dinery/features/client/shop/screens/all_products/all_products.dart';
import 'package:tasty_dinery/features/client/shop/screens/home/widgets/home_appbar.dart';
import 'package:tasty_dinery/features/client/shop/screens/home/widgets/home_categories.dart';
import 'package:tasty_dinery/features/client/shop/screens/home/widgets/promo_slider.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(ProductController());

    // scaffold
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // primary header container
            const CcPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appbar
                  CcHomeAppBar(),

                  SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                  // popular categories
                  Padding(
                    padding: EdgeInsets.only(left: CcSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CcSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: CcSizes.spaceBtnItems_2),

                  // categories
                  CcHomeCategories(),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
              child: Column(
                children: [
                  // promo slider
                  const CcPromoSlider(
                    banners: [
                      CcImages.promoBanner3,
                      CcImages.promoBanner3,
                      CcImages.promoBanner3,
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_2),

                  // heading
                  CcSectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          // query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),

                  // grid layout for popular products in vertical direction
                  Column(
                    children: [
                      Obx(
                        () {
                          if (controller.isLoading.value) {
                            return const CcHorizontalProductShimmer();
                          }

                          if (controller.featuredProducts.isEmpty) {
                            return Center(
                              child: Text(
                                'No data Found',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          }
                          return CcGridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_, index) => CcProductCardVertical(
                              product: controller.featuredProducts[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
