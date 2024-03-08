import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/brands/brand_card.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcBrandShowcase extends StatelessWidget {
  const CcBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CcRoundedContainer(
      showBorder: true,
      borderColor: Colors.grey,
      backgroundColor: Colors.grey.withOpacity(0.2),
      padding: const EdgeInsets.all(CcSizes.md),
      margin: const EdgeInsets.only(bottom: CcSizes.spaceBtnItems_1),
      child: Column(
        children: [
          // brand with product count
          const CcBrandCard(
            showBorder: false,
            // width: CcDeviceUtils.getScreenWidth(context),
          ),

          // brand top 3 product images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: CcRoundedContainer(
      height: 110,
      radius: 100,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(CcSizes.md),
      margin: const EdgeInsets.only(right: CcSizes.xs),
      child: CcRoundedImage(
        imageUrl: image,
        backgroundColor: Colors.transparent,
        fit: BoxFit.fill,
      ),
    ),
  );
}
