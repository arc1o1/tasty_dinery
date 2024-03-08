import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CcLoginHeader extends StatelessWidget {
  const CcLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return Center(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              width: 150,
              child: Image(
                image: AssetImage(CcImages.appLogo),
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UDSM',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Food Point',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: dark ? CcColors.grey : CcColors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
