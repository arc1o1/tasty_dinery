// import 'package:tasty_dinery/features/shop/models/product_attribute_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.productType,
    required this.stock,
    this.sku,
    this.description,
    this.categoryid,
    this.brand,
    required this.price,
    this.salePrice = 0.0,
    this.date,
    required this.isFeatured,
    this.images,
    // this.productAttribute,
  });

  String id, title, thumbnail, productType;
  int stock;
  String? sku, description, categoryid, brand;
  double price, salePrice;
  DateTime? date;
  bool isFeatured;
  List<String>? images; // List<ProductAttributeModel>? productAttribute;

  // create empty function for clean code
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        thumbnail: '',
        productType: '',
        stock: 0,
        price: 0.0,
        isFeatured: false,
      );

  // json format
  toJson() {
    return {
      // 'SKU': sku     // store keeping unit is not needed in food app
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryid,
      'Description': description,
      'ProductType': productType,
      'Brand': brand,
    };
  }

  // map json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // return empty if null
    if (document.data() == null) return ProductModel.empty();

    final data = document.data()!;

    return ProductModel(
      id: document.id,
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      thumbnail: data['Thumbnail'] ?? '',
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryid: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] ?? '',
    );
  }

  // map json oriented document snapshot from firebasse to model
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      thumbnail: data['Thumbnail'] ?? '',
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryid: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] ?? '',
    );
  }
}
