import 'package:tasty_dinery/utils/constants/image_strings.dart';
import 'package:tasty_dinery/utils/constants/text_strings.dart';

class OnboardingInfo {
  final String title;
  final String subTitle;
  final String image;

  OnboardingInfo(
      {required this.title, required this.subTitle, required this.image});
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: CcTexts.onBoardingTitle1,
      subTitle: CcTexts.onBoardingSubTitle1,
      image: CcImages.onBoardingImage1,
    ),
    OnboardingInfo(
      title: CcTexts.onBoardingTitle2,
      subTitle: CcTexts.onBoardingSubTitle2,
      image: CcImages.onBoardingImage2,
    ),
    OnboardingInfo(
      title: CcTexts.onBoardingTitle3,
      subTitle: CcTexts.onBoardingSubTitle3,
      image: CcImages.onBoardingImage3,
    ),
  ];
}
