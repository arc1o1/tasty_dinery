import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';
import 'package:tasty_dinery/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:tasty_dinery/features/client/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: const CcAppBar(
        title: Text("Reviews and Ratings"),
        centerTitle: true,
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same service that you use",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // overall product rating
              const CcOverallProductRating(),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // rating bar indicator
              Row(
                children: [
                  const CcRatingBarIndicator(rating: 5.0),
                  const SizedBox(width: CcSizes.spaceBtnItems_1),
                  Text(
                    "100 Reviews",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: CcColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnSections),

              // user review list
              const UserReviewCard(),

              const SizedBox(height: CcSizes.spaceBtnSections),

              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
