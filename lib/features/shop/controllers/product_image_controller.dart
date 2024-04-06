import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  // variable
  RxString selectedProductImage = ''.obs;

  // get all images from product
  List<String> getAllProductImages(ProductModel product) {
    // use set to add unique images only
    Set<String> images = {};

    // load thumbnail
    images.add(product.thumbnail);

    // assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    // get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }
    // return value
    return images.toList();
  }

  // show image popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        backgroundColor: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: CcSizes.spaceBtnSections),

            // image
            Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              child: CachedNetworkImage(imageUrl: image),
            ),

            const SizedBox(height: CcSizes.spaceBtnSections),

            // button
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
