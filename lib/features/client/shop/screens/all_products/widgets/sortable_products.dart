import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_all_products_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcSortableProducts extends StatelessWidget {
  const CcSortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        // drop down button form field
        // filter bar
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // sort products based on selected option
            controller.sortProducts(value!);
          },
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        const SizedBox(height: CcSizes.spaceBtnSections),

        // products
        Obx(
          () => CcGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => Obx(() =>
                CcProductCardVertical(product: controller.products[index])),
          ),
        ),
      ],
    );
  }
}
