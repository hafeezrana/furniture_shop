import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ShippingAddress {
  final String name;
  final String address;
  final int zipCode;
  final String country;
  final String city;
  final String district;

  const ShippingAddress({
    required this.name,
    required this.address,
    required this.zipCode,
    required this.country,
    required this.city,
    required this.district,
  });

  ShippingAddress copyWith({
    String? name,
    String? address,
    int? zipCode,
    String? country,
    String? city,
    String? district,
  }) {
    return ShippingAddress(
      name: name ?? this.name,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'address': address});
    result.addAll({'zipCode': zipCode});
    result.addAll({'country': country});
    result.addAll({'city': city});
    result.addAll({'district': district});

    return result;
  }

  factory ShippingAddress.fromMap(Map<String, dynamic> map) {
    return ShippingAddress(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      zipCode: map['zipCode']?.toInt() ?? 0,
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingAddress.fromJson(String source) =>
      ShippingAddress.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShippingAddress(name: $name, address: $address, zipCode: $zipCode, country: $country, city: $city, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShippingAddress &&
        other.name == name &&
        other.address == address &&
        other.zipCode == zipCode &&
        other.country == country &&
        other.city == city &&
        other.district == district;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        zipCode.hashCode ^
        country.hashCode ^
        city.hashCode ^
        district.hashCode;
  }
}
