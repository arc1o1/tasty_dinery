class CartItemModel {
  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    required this.quantity,
    this.image,
    this.brand,
  });

  String productId, title;
  double price;
  String? image, brand;
  int quantity;

  // empty cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // convert to json
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'brand': brand,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['productId'],
        title: json['title'],
        price: json['price']?.toDouble(),
        image: json['image'],
        brand: json['brand'],
        quantity: json['quantity']);
  }
}
