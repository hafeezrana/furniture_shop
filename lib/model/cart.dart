import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:furniture_shop/model/product.dart';

@immutable
class Cart {
  final String userId;
  final Product product;

  const Cart({
    required this.userId,
    required this.product,
  });

  Cart copyWith({
    String? userId,
    Product? product,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'product': product.toMap()});

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      userId: map['userId'] ?? '',
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(userId: $userId, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart && other.userId == userId && other.product == product;
  }

  @override
  int get hashCode => userId.hashCode ^ product.hashCode;
}
