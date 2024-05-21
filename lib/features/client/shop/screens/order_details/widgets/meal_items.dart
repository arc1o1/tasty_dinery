import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcMealItems extends StatelessWidget {
  const CcMealItems({
    super.key,
    required this.productString,
    required this.quantity,
    required this.price,
    this.productStringFontSize = 11,
    this.quantityStringFontSize = 11,
    this.priceStringFontSize = 12,
  });
  final String productString, quantity, price;
  final double productStringFontSize,
      quantityStringFontSize,
      priceStringFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CcRoundedContainer(
          width: 40,
          height: 40,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(CcSizes.sm),
          child: Icon(
            Icons.circle,
            color: Colors.blue.shade700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productString,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: productStringFontSize)),
            const SizedBox(width: 5),
            Text("x$quantity",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: quantityStringFontSize)),
            const SizedBox(width: 15),
            Text("$price/=",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: priceStringFontSize,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
