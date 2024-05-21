import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/devices/device_utility.dart';

class CcRatingProgressIndicator extends StatelessWidget {
  const CcRatingProgressIndicator({
    super.key,
    required this.text,
    this.value = 0.5,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // text
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),

        // value
        Expanded(
          flex: 11,
          child: SizedBox(
            width: CcDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: CcColors.darkGrey.withOpacity(0.4),
              valueColor: const AlwaysStoppedAnimation(CcColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
