import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'product.dart';

@immutable
class Order {
  final int orderNo;
  final DateTime date;
  final Product product;

  const Order({
    required this.orderNo,
    required this.date,
    required this.product,
  });

  Order copyWith({
    int? orderNo,
    DateTime? date,
    Product? product,
  }) {
    return Order(
      orderNo: orderNo ?? this.orderNo,
      date: date ?? this.date,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'orderNo': orderNo});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'product': product.toMap()});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderNo: map['orderNo']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() =>
      'Order(orderNo: $orderNo, date: $date, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.orderNo == orderNo &&
        other.date == date &&
        other.product == product;
  }

  @override
  int get hashCode => orderNo.hashCode ^ date.hashCode ^ product.hashCode;
}
