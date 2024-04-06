class PaymentMethodModel {
  PaymentMethodModel({required this.name, required this.image});

  String name;
  String image;

  static PaymentMethodModel empty() => PaymentMethodModel(name: '', image: '');
}
