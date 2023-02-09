import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/widgets/reusable_card.dart';
import '../../../utils/widgets/text_style.dart';
import 'add_address_scrn.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  static const route = '/shippingScreen';

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

bool isChanged = false;

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
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
                  const Text('Shipping Address',
                      style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: isChanged,
                      onChanged: (value) {
                        setState(() {});
                        isChanged = value!;
                      },
                    ),
                    const Text('Use as the shipping address',
                        style: MyTextStyle.textStyle1),
                  ],
                ),
              ),
              ReusableCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name', style: MyTextStyle.textStyle2b),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mode_edit_outlined),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text('Your address is here',
                        maxLines: 5, style: MyTextStyle.textStyle2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(AddAdressScreen.route);
          },
          child: const Icon(Icons.add)),
    );
  }
}
