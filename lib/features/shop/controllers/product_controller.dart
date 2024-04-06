import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/product/product_repository.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      // show loader while loading products
      isLoading.value = true;

      // fetch products
      final products = await productRepository.getFeaturedProducts();

      // assign products

      featuredProducts.assignAll(products);
    } catch (e) {
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // fetch products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // get product price
  String getProductPrice(ProductModel product) {
    // since no variation exists
    return (product.salePrice > 0 ? product.salePrice : product.price)
        .toString();
  }

  // calculate discount percentage if there exist

  // check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Available' : 'Out of Order';
  }
}
