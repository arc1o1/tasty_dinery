import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class CcOrderIndividualDetail extends StatelessWidget {
  const CcOrderIndividualDetail({
    super.key,
    this.isChildImage = false,
    this.imageString,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.areManyItemsPresent = false,
    this.items,
  });

  final bool? isChildImage, areManyItemsPresent;
  final String? imageString;
  final IconData? icon;
  final String title;
  final String subtitle;
  final int? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CcRoundedContainer(
              width: 35,
              height: 35,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(CcSizes.sm),
              child: isChildImage!
                  ? Image(image: AssetImage(imageString!), fit: BoxFit.contain)
                  : Icon(icon, color: Colors.blue.shade700),
            ),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          ],
        )
      ],
    );
  }
}
