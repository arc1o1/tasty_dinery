import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/common/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:tasty_dinery/common/widgets/texts/section_heading.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CcAppBar(
        title: Text("Lunch"),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 1 - banner
              const CcRoundedImage(
                width: double.infinity,
                imageUrl: CcImages.promoBanner3,
                applyImageRadius: true,
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // 2 - sub categories
              Column(
                children: [
                  // heading
                  CcSectionHeading(title: "Rice", onPressed: () {}),

                  const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (content, index) =>
                            const SizedBox(width: CcSizes.spaceBtnItems_1),
                        itemBuilder: (context, index) =>
                            const CcProductCardHorizontal()),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // heading
                  CcSectionHeading(title: "Ugali", onPressed: () {}),

                  const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (content, index) =>
                            const SizedBox(width: CcSizes.spaceBtnItems_1),
                        itemBuilder: (context, index) =>
                            const CcProductCardHorizontal()),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),

                  // heading
                  CcSectionHeading(title: "Chips", onPressed: () {}),

                  const SizedBox(height: CcSizes.spaceBtnItems_1 / 2),

                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (content, index) =>
                            const SizedBox(width: CcSizes.spaceBtnItems_1),
                        itemBuilder: (context, index) =>
                            const CcProductCardHorizontal()),
                  ),

                  const SizedBox(height: CcSizes.spaceBtnItems_1),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
