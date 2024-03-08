import 'package:flutter/material.dart';
// import 'package:tasty_dinery/common/widgets/brands/brand_showcase.dart';
import 'package:tasty_dinery/common/widgets/layout/grid_layout.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
// import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcSearchTab extends StatelessWidget {
  const CcSearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 305,
                child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (content, index) =>
                        const SizedBox(width: CcSizes.spaceBtnItems_1),
                    itemBuilder: (context, index) =>
                        const CcVerticalProductCard()),
              ),

              // const CcVerticalProductCard(),

              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

              // products
              CcSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

              CcGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const CcProductCardVertical()),

              const SizedBox(height: CcSizes.spaceBtnItems_2),
            ],
          ),
        ),
      ],
    );
  }
}
