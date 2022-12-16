import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Payment {
  final String cardholderName;
  final int cardNo;
  final int cvv;
  final DateTime expiryDate;

  const Payment({
    required this.cardholderName,
    required this.cardNo,
    required this.cvv,
    required this.expiryDate,
  });

  Payment copyWith({
    String? cardholderName,
    int? cardNo,
    int? cvv,
    DateTime? expiryDate,
  }) {
    return Payment(
      cardholderName: cardholderName ?? this.cardholderName,
      cardNo: cardNo ?? this.cardNo,
      cvv: cvv ?? this.cvv,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cardholderName': cardholderName});
    result.addAll({'cardNo': cardNo});
    result.addAll({'cvv': cvv});
    result.addAll({'expiryDate': expiryDate.millisecondsSinceEpoch});

    return result;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      cardholderName: map['cardholderName'] ?? '',
      cardNo: map['cardNo']?.toInt() ?? 0,
      cvv: map['cvv']?.toInt() ?? 0,
      expiryDate: DateTime.fromMillisecondsSinceEpoch(map['expiryDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(cardholderName: $cardholderName, cardNo: $cardNo, cvv: $cvv, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payment &&
        other.cardholderName == cardholderName &&
        other.cardNo == cardNo &&
        other.cvv == cvv &&
        other.expiryDate == expiryDate;
  }

  @override
  int get hashCode {
    return cardholderName.hashCode ^
        cardNo.hashCode ^
        cvv.hashCode ^
        expiryDate.hashCode;
  }
}
