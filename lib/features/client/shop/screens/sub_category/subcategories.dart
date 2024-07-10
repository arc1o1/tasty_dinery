import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:tasty_dinery/common/widgets/shimmer/horizontal_shimmer.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/features/client/shop/controllers/category_contoller.dart';
import 'package:tasty_dinery/features/client/shop/models/category_model.dart';
import 'package:tasty_dinery/features/client/shop/screens/all_products/all_products.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_cards_vertical.dart';
import '../../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = CategoryController.instance;

    // scaffold
    return Scaffold(
      appBar: CcAppBar(
        title: Text(category.name),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  // 1 - banner
                  const CcRoundedImage(
                    width: double.infinity,
                    imageUrl: CcImages.promoBanner3,
                    applyImageRadius: true,
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // 2 - sub categories
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
            },
          ),
        ),
      ),
    );
  }
}
