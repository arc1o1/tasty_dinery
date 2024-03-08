import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/common/widgets/texts/product_title_text.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductMetaData extends StatelessWidget {
  const CcProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        CcProductTitleText(title: "Vegetable Rice & Chicken Stew"),
        SizedBox(height: CcSizes.spaceBtnItems_2),

        // stock status
        Row(
          children: [
            // Brand
            // make a row, and incorporate image icon before a brand
            CcBrandTitleWithVerifiedIcon(
              title: "#rice #chicken",
              brandTextSize: TextSizes.medium,
            )
          ],
        ),
      ],
    );
  }
}
