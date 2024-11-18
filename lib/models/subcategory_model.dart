import 'dart:convert';

class SubCategoryModel {
  final String id;
  final String categoryId;
  final String categoryName;
  final String subCategoryName;
  final String image;

  SubCategoryModel({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.subCategoryName,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'subCategoryName': subCategoryName,
      'image': image
    };
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['_id'] as String,
      categoryId: map['categoryId'] as String,
      categoryName: map['categoryName'] as String,
      subCategoryName: map['subCategoryName'] as String,
      image: map['image'] as String,
    );
  }
}
