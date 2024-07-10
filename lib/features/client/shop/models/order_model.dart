import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasty_dinery/features/client/shop/models/cart_item_model.dart';
import 'package:tasty_dinery/utils/constants/enums.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class OrderModel {
  OrderModel({
    this.id = "",
    required this.orderID,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Airtel Money',
    required this.paymentNumber,
    this.servedDate,
  });

  final String id, userId, orderID;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod, paymentNumber;
  final DateTime? servedDate;
  final List<CartItemModel> items;

  String get formattedOrderDate =>
      CcHelperFunctions.getFormattedDate(orderDate);

  String get formattedServedDate =>
      servedDate != null ? CcHelperFunctions.getFormattedDate(servedDate!) : '';

  String get orderStatusText => status == OrderStatus.pending
      ? 'Pending'
      : status == OrderStatus.served
          ? 'Served'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'paymentNumber': paymentNumber,
      'servedDate': servedDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: snapshot.id,
        orderID: data['orderID'] as String,
        userId: data['userId'] as String,
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['status']),
        totalAmount: data['totalAmount'] as double,
        orderDate: (data['orderDate'] as Timestamp).toDate(),
        paymentMethod: data['paymentMethod'] as String,
        paymentNumber: data['paymentNumber'] as String,
        servedDate: data['servedDate'] == null
            ? null
            : (data['servedDate'] as Timestamp).toDate(),
        items: (data['items'] as List<dynamic>)
            .map((itemData) =>
                CartItemModel.fromJson(itemData as Map<String, dynamic>))
            .toList());
  }
}
