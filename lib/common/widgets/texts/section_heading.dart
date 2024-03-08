import 'package:flutter/material.dart';

class CcSectionHeading extends StatelessWidget {
  const CcSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'show all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // section heading
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // button
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle!)),
      ],
    );
  }
}
