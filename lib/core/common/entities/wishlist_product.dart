// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WishlistProduct extends Equatable {
  const WishlistProduct({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productExists,
    required this.productOutOfStock,
    required this.productPrice,
  });

  final String productId;
  final String productName;
  final String productImage;
  final bool productExists;
  final bool productOutOfStock;
  final double productPrice;

  const WishlistProduct.empty()
      : productId = 'Test String',
        productName = 'Test String',
        productImage = 'Test String',
        productExists = true,
        productOutOfStock = true,
        productPrice = 1.0;
  factory WishlistProduct.fromMap(Map<String, dynamic> map) {
    return WishlistProduct(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      productImage: map['productImage'] as String,
      productExists: map['productExists'] as bool,
      productOutOfStock: map['productOutOfStock'] as bool,
      productPrice: map['productPrice'] as double,
    );
  }
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

  WishlistProduct copyWith({
    String? productId,
    String? productName,
    String? productImage,
    bool? productExists,
    bool? productOutOfStock,
    double? productPrice,
  }) {
    return WishlistProduct(
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
