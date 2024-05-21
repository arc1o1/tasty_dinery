import 'package:flutter/material.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class CcOverallProductRating extends StatelessWidget {
  const CcOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text("5.0", style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              CcRatingProgressIndicator(text: "5", value: 1),
              CcRatingProgressIndicator(text: "4", value: 0.9),
              CcRatingProgressIndicator(text: "3", value: 0),
              CcRatingProgressIndicator(text: "2", value: 0),
              CcRatingProgressIndicator(text: "1", value: 0),
            ],
          ),
        )
      ],
    );
  }
}
