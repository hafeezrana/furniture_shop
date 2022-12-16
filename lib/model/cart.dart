import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:furniture_shop/model/product.dart';

@immutable
class Cart {
  final Product product;

  const Cart({
    required this.product,
  });

  Cart copyWith({
    Product? product,
  }) {
    return Cart(
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'product': product.toMap()});

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart && other.product == product;
  }

  @override
  int get hashCode => product.hashCode;
}
