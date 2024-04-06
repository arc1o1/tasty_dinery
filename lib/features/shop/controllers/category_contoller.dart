import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/categories/category_repository.dart';
import 'package:tasty_dinery/data/repositories/product/product_repository.dart';
import 'package:tasty_dinery/features/shop/models/category_model.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source(firestore, api etc)
      final categories = await _categoryRepository.getAllCategories();

      // update category list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  // load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      CcLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  // get category or sub category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // fetch limited 4 products against each subcategories
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);

    return products;
  }
}
