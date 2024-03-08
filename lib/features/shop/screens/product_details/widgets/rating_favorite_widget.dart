import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcRatingAndFavorite extends StatelessWidget {
  const CcRatingAndFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //rating
        Row(
          children: [
            const CcRatingBarIndicator(rating: 5.0),
            const SizedBox(width: CcSizes.spaceBtnItems_2),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "5.0",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
            )
          ],
        ),
        // favorite icon
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(CcSizes.cardRadiusSm),
              topRight: Radius.circular(CcSizes.cardRadiusSm),
              bottomRight: Radius.circular(CcSizes.cardRadiusSm),
              bottomLeft: Radius.circular(CcSizes.cardRadiusSm),
            ),
          ),
          child: const SizedBox(
            width: CcSizes.iconXl,
            height: CcSizes.iconXl,
            child: Center(
              child: Icon(Icons.favorite_rounded, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
