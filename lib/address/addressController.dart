import 'package:flutter/material.dart';

import '../model/address.dart';

class AddressController {
  static Address? address;

  static saveRequestTemp(Address adrs, BuildContext context) {
    address = adrs;
  }
}
