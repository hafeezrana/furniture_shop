import 'package:flutter/material.dart';

import 'package:furniture_shop/utils/constants/images_consts.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import 'add_payment_screen.dart';

class PaymentMethodscrn extends StatefulWidget {
  const PaymentMethodscrn({super.key});

  static const route = '/PayementMethodScreen';

  @override
  State<PaymentMethodscrn> createState() => _PaymentMethodscrnState();
}

bool isChanged = false;

class _PaymentMethodscrnState extends State<PaymentMethodscrn> {
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
                  const Text('Payment Methods', style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 160,
                  width: 400,
                  child: Image.network(ConstsImages.visaImg, fit: BoxFit.fill)),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Checkbox(
                      value: isChanged,
                      onChanged: (value) {
                        setState(() {});
                        isChanged = value!;
                      },
                    ),
                    const Text('Use as default payment method',
                        style: MyTextStyle.textStyle1),
                  ],
                ),
              ),
              SizedBox(
                  height: 160,
                  width: 380,
                  child: Image.network(ConstsImages.visaImg, fit: BoxFit.fill)),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Checkbox(
                      value: isChanged,
                      onChanged: (value) {
                        setState(() {});
                        isChanged = value!;
                      },
                    ),
                    const Text('Use as default payment method',
                        style: MyTextStyle.textStyle1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddPaymentMethodScrn.route);
          },
          child: const Icon(Icons.add)),
    );
  }
}
