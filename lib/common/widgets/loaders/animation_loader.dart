import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

// widget for displaying animated loading indicator with optional text and action button
class CcAnimationLoaderWidget extends StatelessWidget {
  const CcAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  // parameters
  //
  //  - text: text to be displayed below the animation
  //  - animation: path to Lottie animation file
  //  - showAction: whether to show action button below the text
  //  - actionText: the text to be displayed within the action button
  //  - onActionPressed: cllback function to be executed once the action button is pressed

  final String text, animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // display lottie animation
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.15),

          const SizedBox(height: CcSizes.defaultSpace),

          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: CcSizes.defaultSpace),

          // show action button or not
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: CcColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: CcColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
