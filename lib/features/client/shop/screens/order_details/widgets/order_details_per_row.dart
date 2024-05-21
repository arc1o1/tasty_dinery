import 'package:flutter/material.dart';
import 'package:tasty_dinery/features/client/shop/screens/order_details/widgets/order_individual_detail.dart';

class CcOrderDetailPerRow extends StatelessWidget {
  const CcOrderDetailPerRow({
    super.key,
    this.isChildOneImage = false,
    this.isChildTwoImage = false,
    this.imageString1,
    this.imageString2,
    this.icon1,
    this.icon2,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
  });

  final bool isChildOneImage, isChildTwoImage;
  final String? imageString1, imageString2;
  final IconData? icon1, icon2;
  final String title1, subtitle1, title2, subtitle2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1st element in a row
        CcOrderIndividualDetail(
          isChildImage: isChildOneImage,
          imageString: imageString1,
          icon: icon1,
          title: title1,
          subtitle: subtitle1,
        ),

        // 2nd Element in a row
        CcOrderIndividualDetail(
          isChildImage: isChildTwoImage,
          imageString: imageString2,
          icon: icon2,
          title: title2,
          subtitle: subtitle2,
        ),
      ],
    );
  }
}
