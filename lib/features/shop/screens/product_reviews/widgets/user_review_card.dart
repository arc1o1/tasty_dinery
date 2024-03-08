import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(CcImages.user2)),
                const SizedBox(width: CcSizes.spaceBtnItems_1),
                Text("John Amon",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: CcSizes.spaceBtnItems_1),

        // reviews
        Row(
          children: [
            const CcRatingBarIndicator(rating: 5),
            const SizedBox(width: CcSizes.spaceBtnItems_1),
            Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1),

        const ReadMoreText(
          "The food contained in the mobile app quitely resemble the food actually served in the cafeteria.\nThe food is quite amazing and highly recommend it to you all. Please grab a bite\t\t\t",
          textAlign: TextAlign.justify,
          trimLines: 2,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          trimLength: 1,
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blue),
          lessStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blue),
        ),

        const SizedBox(height: CcSizes.spaceBtnItems_1),

        CcRoundedContainer(
          showBorder: true,
          borderColor: Colors.grey,
          backgroundColor: CcColors.darkGrey.withOpacity(0.2),
          padding: const EdgeInsets.all(CcSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("tasty dinery",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text("01 Nov, 2023",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1),
              const ReadMoreText(
                "The food contained in the mobile app quitely resemble the food actually served in the cafeteria.\nThe food is quite amazing and highly recommend it to you all. Please grab a bite\t\t\t",
                textAlign: TextAlign.justify,
                trimLines: 2,
                trimExpandedText: "show less",
                trimCollapsedText: "show more",
                trimLength: 1,
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
                lessStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
