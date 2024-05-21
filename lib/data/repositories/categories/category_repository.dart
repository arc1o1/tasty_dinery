import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:tasty_dinery/features/client/shop/models/category_model.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // get subcategories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();

      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories along with their images
      final storage = Get.put(CcFirebaseStorageService());

      // loop through each category
      for (var category in categories) {
        // get image data link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // assign url to category.image attribute
        category.image = url;

        // store category in the firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
