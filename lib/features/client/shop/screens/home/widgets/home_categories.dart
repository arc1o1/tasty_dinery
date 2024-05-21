import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:tasty_dinery/features/client/shop/controllers/category_contoller.dart';
import 'package:tasty_dinery/features/client/shop/screens/sub_category/subcategories.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/common/widgets/shimmer/category_shimmer.dart';

class CcHomeCategories extends StatelessWidget {
  const CcHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // controller
    final categoryController = Get.put(CategoryController());

    // container
    return Obx(
      () {
        if (categoryController.isLoading.value) {
          return const CcCategoryShimmer();
        }

        if (categoryController.featuredCategories.isEmpty) {
          return Center(
              child: Text('No Data Found!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)));
        }

        return Expanded(
          child: Container(
            height: 80,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];

                return CcVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () =>
                      Get.to(() => SubCategoriesScreen(category: category)),
                  backgroundColor: CcColors.light,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
