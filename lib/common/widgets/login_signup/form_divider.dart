import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CcFormDivider extends StatelessWidget {
  const CcFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? CcColors.white : CcColors.darkGrey,
            thickness: 1,
            indent: 10,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: dark ? Colors.grey.shade100 : Colors.grey.shade700),
        ),
        Flexible(
          child: Divider(
            color: dark ? CcColors.white : CcColors.darkGrey,
            thickness: 1,
            indent: 5,
            endIndent: 10,
          ),
        )
      ],
    );
  }
}
