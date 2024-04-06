import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/shop/models/banner_model.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // variable
  final _db = FirebaseFirestore.instance;

  // get all order related to the current user
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('Banners').get();

      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
