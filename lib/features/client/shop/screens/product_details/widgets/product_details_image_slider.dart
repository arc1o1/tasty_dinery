import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/features/client/shop/controllers/product_image_controller.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductImageSlider extends StatelessWidget {
  const CcProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    // container
    return CcCurvedEdgeWidget(
      child: Container(
        color: Colors.grey.shade400,
        child: Stack(
          children: [
            SizedBox(
              // height is to be added for those images with no background
              // find images of food with no background color
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: CcColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // slider
            Positioned(
              right: 0,
              bottom: 30,
              left: 20,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: CcSizes.spaceBtnItems_2),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return CcRoundedImage(
                        width: 67,
                        isNetworkImage: true,
                        backgroundColor: CcColors.darkGrey.withOpacity(0.9),
                        border: Border.all(
                            color: imageSelected
                                ? CcColors.primary
                                : CcColors.grey),
                        borderRadius: 10,
                        padding: const EdgeInsets.all(1),
                        imageUrl: images[index],
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                      );
                    },
                  ),
                ),
              ),
            ),

            // appbar icons
            const CcAppBar(
              showBackArrow: true,
            )
          ],
        ),
      ),
    );
  }
}
