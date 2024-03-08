import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcBrandCard extends StatelessWidget {
  const CcBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    this.width,
  });

  final bool showBorder;
  final void Function()? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () {},

        // container design
        child: CcRoundedContainer(
          padding: const EdgeInsets.all(CcSizes.xs),
          showBorder: showBorder,
          borderColor: CcHelperFunctions.isDarkMode(context)
              ? CcColors.light
              : CcColors.darkGrey,
          backgroundColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // container reduces the dimension of this widget....hope it could go well in grid layout
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(CcSizes.xs),

                // icon child of container
                child: CcCircularImage(
                  isNetworkImage: false,
                  image: CcImages.fruitsIcon,
                  backgroundColor: Colors.transparent,
                  overlayColor: CcHelperFunctions.isDarkMode(context)
                      ? CcColors.white
                      : CcColors.black,
                ),
              ),

              const SizedBox(width: CcSizes.spaceBtnItems_2 / 2),

              // text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CcBrandTitleWithVerifiedIcon(title: "Apple"),
                  Text(
                    '200 Items',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
