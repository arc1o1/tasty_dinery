import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductMetaData extends StatelessWidget {
  const CcProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // column widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        CcProductTitleText(title: product.title),
        const SizedBox(height: CcSizes.spaceBtnItems_2),

        // stock status
        Row(
          children: [
            // Brand
            // make a row, and incorporate image icon before a brand
            CcBrandTitleWithVerifiedIcon(
              title: product.brand!,
              brandTextSize: TextSizes.medium,
            )
          ],
        ),
      ],
    );
  }
}
