import 'package:flutter/material.dart';

class CcProductPriceText extends StatelessWidget {
  const CcProductPriceText({
    super.key,
    this.currencySign = '/=',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currencySign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineSmall!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
