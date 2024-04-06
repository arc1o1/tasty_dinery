import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/images/circular_image.dart';

class CcVerticalImageText extends StatelessWidget {
  const CcVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            // circular icon
            CcCircularImage(
              image: image,
              width: 55,
              height: 55,
              borderRadius: 10,
              sWidth: 55,
              sHeight: 55,
              sRadius: 10,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: Colors.black,
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
