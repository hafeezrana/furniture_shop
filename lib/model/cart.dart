import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Cart {
  const Cart({
    this.cartId,
    this.productId,
    this.title,
    this.imageUrl,
    this.quantity,
    this.price,
    this.promo,
    this.total,
  });

  final String? cartId;
  final String? productId;
  final String? title;
  final String? imageUrl;
  final int? quantity;
  final double? price;
  final String? promo;
  final double? total;

  Cart copyWith({
    String? cartId,
    String? productId,
    String? title,
    String? imageUrl,
    int? quantity,
    double? price,
    String? promo,
    double? total,
  }) {
    return Cart(
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      promo: promo ?? this.promo,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (cartId != null) {
      result.addAll({'cartId': cartId});
    }
    if (productId != null) {
      result.addAll({'productId': productId});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (quantity != null) {
      result.addAll({'quantity': quantity});
    }
    if (price != null) {
      result.addAll({'price': price});
    }
    if (promo != null) {
      result.addAll({'promo': promo});
    }
    if (total != null) {
      result.addAll({'total': total});
    }

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cartId: map['cartId'],
      productId: map['productId'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      quantity: map['quantity']?.toInt(),
      price: map['price']?.toDouble(),
      promo: map['promo'],
      total: map['total']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cart(cartId: $cartId, productId: $productId, title: $title, imageUrl: $imageUrl, quantity: $quantity, price: $price, promo: $promo, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.cartId == cartId &&
        other.productId == productId &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity &&
        other.price == price &&
        other.promo == promo &&
        other.total == total;
  }

  @override
  int get hashCode {
    return cartId.hashCode ^
        productId.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        promo.hashCode ^
        total.hashCode;
  }
}
