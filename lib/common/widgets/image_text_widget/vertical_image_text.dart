import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcVerticalImageText extends StatelessWidget {
  const CcVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            // circulat icon
            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(CcSizes.xs),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                color: dark ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 5),

            // text
            SizedBox(
              height: 50,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
