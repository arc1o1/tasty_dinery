import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';

class CcRatingBarIndicator extends StatelessWidget {
  const CcRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: 20,
      rating: rating,
      unratedColor: CcColors.darkGrey.withOpacity(0.6),
      itemBuilder: (_, __) => const Icon(Icons.star, color: CcColors.primary),
    );
  }
}
