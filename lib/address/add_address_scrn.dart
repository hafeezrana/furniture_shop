import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/widgets/text_style.dart';
import '../model/address.dart';
import 'geo_map_screen.dart';

class AddAdressScreen extends StatefulWidget {
  AddAdressScreen({this.address, super.key});

  static const route = '/addAddressScreen';
  Address? address;

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text('Add Shipping Address',
                      style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 10),
              AddressContainer('Full Name', 'Rizwan Javed'),
              AddressContainer('Address', 'Ex: 25 Brownie street'),
              AddressContainer('Zip Code (Postal Code)', '222'),
              AddressContainer('Country', 'Pakistan'),
              AddressContainer('City', 'Lahore'),
              const SizedBox(height: 20),
              ResuableButton(
                buttonText: 'Choose from Map',
                onTap: () {
                  context.push(MapScreen.route);
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'SAVE ADDRESS',
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  AddressContainer(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: ConstColors.white2),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              TextField(
                textAlign: TextAlign.start,
                style: MyTextStyle.textStyle2b,
                decoration: InputDecoration(
                    hintText: subtitle,
                    hintStyle: MyTextStyle.textStyle1b,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
