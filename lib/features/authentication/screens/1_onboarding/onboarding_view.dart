import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasty_dinery/features/authentication/screens/1_onboarding/widgets/onboarding_items.dart';
import 'package:tasty_dinery/features/authentication/screens/2_login/login.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) =>
              setState(() => isLastPage = controller.items.length - 1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                SizedBox(
                    width: double.infinity,
                    height: CcHelperFunctions.screenHeight() * .4,
                    child: Image.asset(controller.items[index].image)),

                const SizedBox(height: CcSizes.spaceBtnSections),

                // Dot Navigation SmoothPageIndicator
                SmoothPageIndicator(
                  controller: pageController,
                  count: controller.items.length,
                  onDotClicked: (index) => pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  ),
                  effect: const ExpandingDotsEffect(
                    activeDotColor: CcColors.primary,
                    dotHeight: 6,
                    dotWidth: 15,
                  ),
                ),

                const SizedBox(height: CcSizes.spaceBtnSections),

                // text
                Text(
                  controller.items[index].title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: CcSizes.spaceBtnItems_1),

                // title and subtitles
                Text(
                  controller.items[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                      color: dark ? CcColors.white : CcColors.black),
                ),

                const SizedBox(height: CcSizes.spaceBtnSections),

                // next button
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: isLastPage
                      ? getStarted()
                      : Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: CcColors.primary,
                                ),
                                onPressed: () => pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                ),
                                child: const Text('Next'),
                              ),
                            ),

                            const SizedBox(height: CcSizes.spaceBtnSections),

                            // next button
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              height: 60,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: CcColors.primary),
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                ),
                                onPressed: () => pageController
                                    .jumpToPage(controller.items.length - 1),
                              ),
                            ),
                          ],
                        ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  // get started button

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
        color: CcColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 60,
      child: TextButton(
        onPressed: () async {
          // allow onboarding screen be displayed only once, set method as future method

          final storage = GetStorage();
          storage.write("isFirstTime", false);

          // once pressed, the key isFirstTime  is taken to be false

          Get.offAll(() => const LoginScreen());
        },
        child: const Text(
          'Get Started',
          style: TextStyle(
              color: CcColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'NeutriffPro'),
        ),
      ),
    );
  }
}
