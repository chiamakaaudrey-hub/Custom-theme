import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BrandModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
    required this.productsCount,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '', isFeatured: false, productsCount: 0);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name' : name,
      'Image' : image,
      'ParentId' : parentId,
      'IsFeatured' : isFeatured,
      'ProductsCount': productsCount,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
  final data = document;
  if (data.isEmpty) return BrandModel.empty();
  return BrandModel(
  id: data['Id'] ?? '',
  name: data['Name'] ?? '',
  image: data['Image'] ?? '',
  isFeatured: data['IsFeatured'] ?? false,
  productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
  );
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? 0,
      );
    } else {
      return BrandModel.empty();
    }
  }


}