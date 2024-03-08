import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/features/shop/controllers/home_controller.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcPromoSlider extends StatelessWidget {
  const CcPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // promo banners
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 0.7,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
            items:
                banners.map((url) => CcRoundedImage(imageUrl: url)).toList()),

        const SizedBox(height: CcSizes.spaceBtnItems_1),

        // containers
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CcCircularContainer(
                    width: 40,
                    height: 6,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? CcColors.primary
                        : Colors.white,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
