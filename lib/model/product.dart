import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String title;
  final String? description;
  final String imageUrl;
  final List<String>? color;
  final int quantity;
  final double price;

  const Product({
    required this.title,
    this.description,
    required this.imageUrl,
    this.color,
    required this.quantity,
    required this.price,
  });

  Product copyWith({
    String? title,
    String? description,
    String? imageUrl,
    List<String>? color,
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

    result.addAll({'title': title});
    if (description != null) {
      result.addAll({'description': description});
    }
    result.addAll({'imageUrl': imageUrl});
    if (color != null) {
      result.addAll({'color': color});
    }
    result.addAll({'quantity': quantity});
    result.addAll({'price': price});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] ?? '',
      description: map['description'],
      imageUrl: map['imageUrl'] ?? '',
      color: List<String>.from(map['color']),
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
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

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(title: $title, description: $description, imageUrl: $imageUrl, color: $color, quantity: $quantity, price: $price)';
  }
}
