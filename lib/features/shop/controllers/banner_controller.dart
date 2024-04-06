import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/banners/banners_repository.dart';
import 'package:tasty_dinery/features/shop/models/banner_model.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // variable
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;

  final bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // update page navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // fetch banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      final banner = await bannerRepository.getAllBanners();
      // assign banners
      banners.assignAll(banner);
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
