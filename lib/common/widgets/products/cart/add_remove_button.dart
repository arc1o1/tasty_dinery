import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcProductQuantityWithAddRemove extends StatelessWidget {
  const CcProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // minus from cart
        InkWell(
          onTap: remove,
          child: Container(
            decoration: const BoxDecoration(
              color: CcColors.dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CcSizes.cardRadiusXs),
                topRight: Radius.circular(CcSizes.cardRadiusXs),
                bottomRight: Radius.circular(CcSizes.cardRadiusXs),
                bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
              ),
            ),
            child: const SizedBox(
              width: CcSizes.iconLg,
              height: CcSizes.iconLg,
              child: Center(
                child: Icon(Iconsax.minus, color: CcColors.white),
              ),
            ),
          ),
        ),

        // item count
        const SizedBox(width: CcSizes.spaceBtnItems_1),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: CcSizes.spaceBtnItems_1),

        // add to cart icon
        InkWell(
          onTap: add,
          child: Container(
            decoration: const BoxDecoration(
              color: CcColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CcSizes.cardRadiusXs),
                topRight: Radius.circular(CcSizes.cardRadiusXs),
                bottomRight: Radius.circular(CcSizes.cardRadiusXs),
                bottomLeft: Radius.circular(CcSizes.cardRadiusXs),
              ),
            ),
            child: const SizedBox(
              width: CcSizes.iconLg,
              height: CcSizes.iconLg,
              child: Center(
                child: Icon(Iconsax.add, color: CcColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
