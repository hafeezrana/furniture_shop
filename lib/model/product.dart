import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String? title;
  final String? description;
  final String? imageUrl;
  final List<int>? color;
  final int? quantity;
  final double? price;

  Product({
    this.title,
    this.description,
    this.imageUrl,
    this.color,
    this.quantity,
    this.price,
  });

  Product copyWith({
    String? title,
    String? description,
    String? imageUrl,
    List<int>? color,
    int? quantity,
    double? price,
  }) {
    return Product(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (color != null) {
      result.addAll({'color': color});
    }
    if (quantity != null) {
      result.addAll({'quantity': quantity});
    }
    if (price != null) {
      result.addAll({'price': price});
    }

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      color: List<int>.from(map['color']),
      quantity: map['quantity']?.toInt(),
      price: map['price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(title: $title, description: $description, imageUrl: $imageUrl, color: $color, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        listEquals(other.color, color) &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        color.hashCode ^
        quantity.hashCode ^
        price.hashCode;
  }
}
