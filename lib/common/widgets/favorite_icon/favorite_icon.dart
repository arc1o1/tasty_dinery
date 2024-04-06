import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/controllers/favorites_controller.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcFavoriteIcon extends StatelessWidget {
  const CcFavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    // controller
    final controller = Get.put(FavoritesController());

    // container
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CcSizes.cardRadiusXs),
          topRight: Radius.circular(CcSizes.cardRadiusXs),
          bottomRight: Radius.circular(CcSizes.cardRadiusXs),
          bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
        ),
      ),
      child: SizedBox(
        width: CcSizes.iconLg,
        height: CcSizes.iconLg,
        child: Center(
          child: Obx(
            () => GestureDetector(
              onTap: () => controller.toggleFavoriteProduct(productId),
              child: Icon(
                controller.isFavorite(productId)
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color:
                    controller.isFavorite(productId) ? Colors.red : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
