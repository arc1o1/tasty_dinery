import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/features/shop/models/order_model.dart';
import 'package:tasty_dinery/utils/popups/loaders.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // get all orders related to the current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again later.';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw CcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw CcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
