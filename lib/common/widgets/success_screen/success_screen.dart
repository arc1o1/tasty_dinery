import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/styles/spacing_styles.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';
// import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subtitle;
  final String? image;
  final bool imageRequired;
  final VoidCallback? onPressed;
  const SuccessScreen({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.imageRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CcSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage(image!),
              //   width: CcHelperFunctions.screenWidth() * .6,
              //   height: CcHelperFunctions.screenHeight() * .35,
              // ),

              const SizedBox(height: 200),

              // title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnItems_1,
              ),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CcSizes.spaceBtnSections,
              ),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(CcTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
