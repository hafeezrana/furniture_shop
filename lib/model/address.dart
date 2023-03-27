import 'dart:convert';

class Address {
  String name;
  String address;
  String city;
  String zipCode;
  String country;
  Address({
    required this.name,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.country,
  });

  Address copyWith({
    String? name,
    String? address,
    String? city,
    String? zipCode,
    String? country,
  }) {
    return Address(
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'address': address});
    result.addAll({'city': city});
    result.addAll({'zipCode': zipCode});
    result.addAll({'country': country});

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      zipCode: map['zipCode'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(name: $name, address: $address, city: $city, zipCode: $zipCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.name == name &&
        other.address == address &&
        other.city == city &&
        other.zipCode == zipCode &&
        other.country == country;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        city.hashCode ^
        zipCode.hashCode ^
        country.hashCode;
  }
}
