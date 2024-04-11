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
                  // // 1 - banner
                  // const CcRoundedImage(
                  //   width: double.infinity,
                  //   imageUrl: CcImages.promoBanner3,
                  //   applyImageRadius: true,
                  // ),

                  // const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // 2 - sub categories
                  FutureBuilder(
                    future: controller.getSubCategories(category.id),
                    builder: (context, snapshot) {
                      // loader
                      const loader = CcHorizontalProductShimmer();
                      final widget =
                          CcCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      // record found
                      final subCategories = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];

                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                // loader
                                final widget = CcCloudHelperFunctions
                                    .checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;

                                // record found
                                final products = snapshot.data!;

                                return Column(
                                  children: [
                                    // heading
                                    CcSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          )),
                                    ),

                                    const SizedBox(
                                        height: CcSizes.spaceBtnItems_2),

                                    // listview
                                    SizedBox(
                                      height: 125,
                                      child: ListView.separated(
                                          itemCount: products.length,
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (content, index) =>
                                              const SizedBox(
                                                  width:
                                                      CcSizes.spaceBtnItems_1),
                                          itemBuilder: (context, index) =>
                                              CcProductCardHorizontal(
                                                  product: products[index])),
                                    ),

                                    const SizedBox(
                                        height: CcSizes.spaceBtnItems_1),
                                  ],
                                );
                              });
                        },
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
