import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class MaterialContainer extends StatelessWidget {
  const MaterialContainer({
    super.key,
    this.elevation = 5,
    this.sizedBoxHeight = CcSizes.spaceBtnItems_1,
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconText,
    this.comparisonText,
    this.color = Colors.lightBlue,
  });

  final double elevation, sizedBoxHeight;
  final String title, subtitle;
  final IconData? icon;
  final String? iconText, comparisonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: CcHelperFunctions.screenWidth() - 40,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            // header information
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.orange, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            SizedBox(height: sizedBoxHeight),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: color,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          iconText!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.lightBlue, fontSize: 17),
                        ),
                      ],
                    ),
                    Text(
                      comparisonText!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.grey, fontSize: 13),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
