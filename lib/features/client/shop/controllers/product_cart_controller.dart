import 'package:get/get.dart';
import 'package:tasty_dinery/features/client/shop/models/cart_item_model.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/local_storage/storage_utility.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // var
  RxInt cartItemsNo = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItems();
  }

  // add item to cart
  void addToCart(ProductModel product) {
    // quantity check
    if (productQuantityInCart < 1) {
      CcLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // out of stock status
    if (product.stock < 1) {
      CcLoaders.warningSnackBar(
          title: 'Oh Snap!', message: 'Selected Product is out of order.');
      return;
    }

    // convert productmodel to cartmodel with given quantity
    final selectedCartItem = convertToCartItem(
      product,
      productQuantityInCart.value,
    );

    // check if added to the cart
    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      // this quantity is already added in the cart
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    CcLoaders.customToast(message: 'Product has been added to cart');
  }

  // add one item to cart
  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  // remove one product from cart
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  // remove item from cart popup
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product',
      onConfirm: () {
        // remove the item from cart
        cartItems.removeAt(index);
        updateCart();
        CcLoaders.customToast(message: 'Product removed from cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  // initialize already added product count
  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }

  // convert productmodel to cartmodel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      image: product.thumbnail,
      brand: product.brand != null ? product.brand! : '',
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedItemsNo = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedItemsNo += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    cartItemsNo.value = calculatedItemsNo;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();

    CcLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        CcLocalStorage.instance().readData<List<dynamic>>('cartItems');

    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));

      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
