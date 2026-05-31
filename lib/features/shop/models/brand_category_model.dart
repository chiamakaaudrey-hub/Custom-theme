class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  const BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  /// Empty instance
  static BrandCategoryModel empty() => const BrandCategoryModel(
    brandId: '',
    categoryId: '',
  );

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  /// Create object from JSON
  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) {
    return BrandCategoryModel(
      brandId: json['BrandId'] ?? '',
      categoryId: json['CategoryId'] ?? '',
    );
  }
}