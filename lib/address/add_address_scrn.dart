import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';

import '../../../utils/widgets/text_style.dart';

class AddAdressScreen extends StatefulWidget {
  const AddAdressScreen({super.key});

  static const route = '/addAddressScreen';

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
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
              AddressContainer('Zip Code (Postal Code)', '0203 38283'),
              AddressContainer('Country', 'Pakistan'),
              AddressContainer('City', 'Lahore'),
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
