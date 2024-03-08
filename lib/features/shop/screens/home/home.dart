import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:tasty_dinery/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/shop/screens/all_products/all_products.dart';
import 'package:tasty_dinery/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tasty_dinery/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tasty_dinery/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                  // search bar
                  // CcSearchContainer(text: 'what do you want to eat'),

                  // SizedBox(height: CcSizes.spaceBtnItems_2),

                  // section heading for popular categories
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
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),

                  // grid layout for popular products in vertical direction
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        CcGridLayout(
                            itemCount: 6,
                            itemBuilder: (_, index) =>
                                const CcProductCardVertical()),
                      ],
                    ),
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
