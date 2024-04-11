import 'dart:convert';

import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/product/product_repository.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/local_storage/storage_utility.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  // variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // initialize favorites by reading from storage
  Future<void> initFavorites() async {
    final json = CcLocalStorage.instance().readData('favorites');

    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;

      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;

      saveFavoritesToStorage();

      CcLoaders.customToast(message: 'Product has been added to Wishlist.');
    } else {
      CcLocalStorage.instance().removeData(productId);
      favorites.remove(productId);

      saveFavoritesToStorage();
      favorites.refresh();

      CcLoaders.customToast(message: 'Product has been removed from Wishlist.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);

    CcLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavoriteProducts(favorites.keys.toList());
  }
}
