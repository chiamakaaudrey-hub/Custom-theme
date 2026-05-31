import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  const ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  /// Empty instance
  static ProductCategoryModel empty() => const ProductCategoryModel(
    productId: '',
    categoryId: '',
  );

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  /// Create object from JSON
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      productId: json['ProductId'] ?? '',
      categoryId: json['CategoryId'] ?? '',
    );
  }

  /// Create object from Firestore snapshot
  factory ProductCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return ProductCategoryModel(
        productId: data['ProductId'] ?? '',
        categoryId: data['CategoryId'] ?? '',
      );
    }

    return ProductCategoryModel.empty();
  }
}