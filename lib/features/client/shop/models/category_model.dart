import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  // constructor
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  // variables
  String id, name, image, parentId;
  bool isFeatured;

  // empty helper function
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: 'image',
        isFeatured: false,
      );

  // convert model into a json format so as to store data in the database i.e firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  // map json oriented document snapshot froma firebase to user model
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // map json record to the model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
