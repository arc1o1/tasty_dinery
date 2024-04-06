import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:tasty_dinery/features/shop/models/product_model.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/platform_exceptions.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

// repo for managing the products related data and operations

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // firestore instance for database interractions
  final _db = FirebaseFirestore.instance;

  // get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // get products based on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return productList;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // get all user favorite products
  Future<List<ProductModel>> getFavoriteProducts(
      List<String> productIds) async {
    try {
      // try to create a collection of wishlist that will have product id
      // use product category method to fetch the exact details
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      final snapshots = snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();

      return snapshots;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      CcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // get products for each category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      // query to get all the documents where productId matches the provided categoryId and fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // extracts productid from documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // query to get all doc where productid is in the list of productids, fieldpath.documentid to query documents in collection
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // extract brand name or other relevant data from the document
      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // upload dummy data on the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // upload all the products along with their image
      final storage = Get.put(CcFirebaseStorageService());

      // loop through each product
      for (var product in products) {
        // get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // assign url to product.thumbnail attribute
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // get image data link from asset locally
            final assetImage = await storage.getImageDataFromAssets(image);

            // upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // assign url to product.thumbnail attribute

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        // store products in firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  // end
}
