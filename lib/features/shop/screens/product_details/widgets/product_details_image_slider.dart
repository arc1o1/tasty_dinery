import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductImageSlider extends StatelessWidget {
  const CcProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CcCurvedEdgeWidget(
      child: Container(
        color: Colors.grey.shade400,
        child: Stack(
          children: [
            const SizedBox(
              // height is to be added for those images with no background
              // find images of food with no background color
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                  child: Image(
                    image: AssetImage(CcImages.productImage3),
                  ),
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
                  itemCount: 5,
                  itemBuilder: (_, index) => CcRoundedImage(
                    width: 67,
                    backgroundColor: CcColors.darkGrey.withOpacity(0.9),
                    border: Border.all(color: Colors.grey),
                    borderRadius: 10,
                    padding: const EdgeInsets.all(1),
                    imageUrl: CcImages.productImage3,
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
