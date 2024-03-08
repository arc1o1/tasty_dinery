// repo class for user related operations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/features/authentication/models/user/user_model.dart';
import 'package:tasty_dinery/utils/exceptions/firebase_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/format_exceptions.dart';
import 'package:tasty_dinery/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CcFirebaseException(code: e.code).message;
    } on FormatException catch (_) {
      throw const CcFFormatException();
    } on PlatformException catch (e) {
      throw CcPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // function to fetch user details based on user id

  // function to update user data in firestore

  // update any field in specific user collection
}
