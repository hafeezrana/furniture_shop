import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.title,
    this.description,
    this.isFavorite,
    required this.imageUrl,
    this.color,
    required this.quantity,
    required this.price,
  });

  final String id;
  final String title;
  final String? description;
  final bool? isFavorite;
  final String imageUrl;
  final List<String>? color;
  final int quantity;
  final double price;

  Product copyWith({
    String? id,
    String? title,
    String? description,
    bool? isFavorite,
    String? imageUrl,
    List<String>? color,
    int? quantity,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (isFavorite != null) {
      result.addAll({'isFavorite': isFavorite});
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
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      isFavorite: map['isFavorite'],
      imageUrl: map['imageUrl'] ?? '',
      color: List<String>.from(map['color']),
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, isFavorite: $isFavorite, imageUrl: $imageUrl, color: $color, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isFavorite == isFavorite &&
        other.imageUrl == imageUrl &&
        listEquals(other.color, color) &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isFavorite.hashCode ^
        imageUrl.hashCode ^
        color.hashCode ^
        quantity.hashCode ^
        price.hashCode;
  }
}
