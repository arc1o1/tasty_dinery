class ProductAttributeModel {
  ProductAttributeModel({this.name, this.values});

  String? name;
  final List<String>? values;

  // json format
  toJson() {
    return {'Name': name, 'Values': values};
  }

  // map json oriented document snapshot from firebase to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
