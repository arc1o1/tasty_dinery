import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:tasty_dinery/common/widgets/shimmer/horizontal_shimmer.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/shop/controllers/category_contoller.dart';
import 'package:tasty_dinery/features/shop/models/category_model.dart';
import 'package:tasty_dinery/features/shop/screens/all_products/all_products.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/cloud_helper_functions.dart';

class CcSearchTab extends StatelessWidget {
  const CcSearchTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(CategoryController());

    // listview
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: controller.getCategoryProducts(
                  categoryId: category.id, limit: 2),
              builder: (context, snapshot) {
                // helper function
                final response = CcCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const CcHorizontalProductShimmer());

                if (response != null) return response;

                // record found
                final products = snapshot.data!;
                // column
                return Column(
                  children: [
                    SizedBox(
                      height: 305,
                      child: ListView.separated(
                          itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (content, index) =>
                              const SizedBox(width: CcSizes.spaceBtnItems_1),
                          itemBuilder: (context, index) =>
                              CcVerticalProductCard(product: products[index])),
                    ),

                    // const CcVerticalProductCard(),

                    const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                    // products
                    FutureBuilder(
                      future: controller.getCategoryProducts(
                          categoryId: category.id),
                      builder: (context, snapshot) {
                        // helper function
                        final response =
                            CcCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: const CcHorizontalProductShimmer());

                        if (response != null) return response;

                        // record found
                        final products = snapshot.data!;

                        // column
                        return Column(
                          children: [
                            CcSectionHeading(
                              title: 'You might like',
                              showActionButton: true,
                              onPressed: () => Get.to(
                                AllProducts(
                                  title: category.name,
                                  futureMethod: controller.getCategoryProducts(
                                      categoryId: category.id, limit: -1),
                                ),
                              ),
                            ),

                            const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                            // grid fort product cards
                            CcGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => CcProductCardVertical(
                                product: products[index],
                              ),
                            ),

                            const SizedBox(height: CcSizes.spaceBtnItems_2),
                          ],
                        );
                      },
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
