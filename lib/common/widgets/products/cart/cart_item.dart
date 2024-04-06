import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_text.dart';
import 'package:tasty_dinery/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:tasty_dinery/features/shop/models/cart_item_model.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcCartItem extends StatelessWidget {
  const CcCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        CcRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          isNetworkImage: true,
          padding: const EdgeInsets.all(CcSizes.sm),
          backgroundColor: CcColors.darkGrey.withOpacity(0.2),
        ),

        const SizedBox(width: CcSizes.spaceBtnItems_1),

        // title, price and category
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CcBrandTitleText(
                title: cartItem.title,
                maxLines: 1,
                brandTextSize: TextSizes.medium,
                textAlign: TextAlign.left,
              ),

              CcBrandTitleWithVerifiedIcon(title: cartItem.brand ?? ''),

              // // attribute
              // Text.rich(
              //   TextSpan(
              //     children: [
              //       TextSpan(
              //           text: "Category: ",
              //           style: Theme.of(context)
              //               .textTheme
              //               .bodySmall!
              //               .copyWith(color: Colors.green.withOpacity(1))),
              //       TextSpan(
              //           text: "Combo",
              //           style: Theme.of(context).textTheme.bodyLarge),
              //     ],
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
