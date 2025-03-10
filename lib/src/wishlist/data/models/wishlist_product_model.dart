import 'dart:convert';

import '../../../../core/common/entities/wishlist_product.dart';
import '../../../../core/utils/typedefs.dart';

class WishlistProductModel extends WishlistProduct {
  const WishlistProductModel({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.productExists,
    required super.productOutOfStock,
    required super.productPrice,
  });

  const WishlistProductModel.empty()
      : this(
          productId: 'Test String',
          productName: 'Test String',
          productImage: 'Test String',
          productExists: true,
          productOutOfStock: true,
          productPrice: 1.0,
        );

  WishlistProductModel.fromMap(DataMap map)
      : this(
          productId: map['productId'] as String,
          productName: map['productName'] as String,
          productImage: map['productImage'] as String,
          productExists: map['productExists'] as bool,
          productOutOfStock: map['productOutOfStock'] as bool,
          productPrice: map['productPrice'] as double,
        );

  factory WishlistProductModel.fromJson(String source) =>
      WishlistProductModel.fromMap(jsonDecode(source) as DataMap);

  Map<String, dynamic> toMap() {
    return {
      'productId': this.productId,
      'productName': this.productName,
      'productImage': this.productImage,
      'productExists': this.productExists,
      'productOutOfStock': this.productOutOfStock,
      'productPrice': this.productPrice,
    };
  }

  String toJson() => jsonEncode(toMap());

  WishlistProductModel copyWith({
    String? productId,
    String? productName,
    String? productImage,
    bool? productExists,
    bool? productOutOfStock,
    double? productPrice,
  }) {
    return WishlistProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productExists: productExists ?? this.productExists,
      productOutOfStock: productOutOfStock ?? this.productOutOfStock,
      productPrice: productPrice ?? this.productPrice,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        productImage,
        productExists,
        productOutOfStock,
        productPrice,
      ];
}
