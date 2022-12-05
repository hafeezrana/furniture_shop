import 'package:flutter/material.dart';

import '../../../utils/constants/colors_consts.dart';
import '../../../utils/constants/images_consts.dart';
import '../../../utils/widgets/resusable_button.dart';
import '../../../utils/widgets/text_style.dart';

class AddPaymentMethodScrn extends StatefulWidget {
  const AddPaymentMethodScrn({super.key});

  static const route = '/AddPayment';

  @override
  State<AddPaymentMethodScrn> createState() => _AddPaymentMethodScrnState();
}

class _AddPaymentMethodScrnState extends State<AddPaymentMethodScrn> {
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
                  const Text('Add Payment Method',
                      style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 160,
                width: 400,
                child: Image.network(ConstsImages.visaImg, fit: BoxFit.fill),
              ),
              PaymentContainer('Full Name', 'Ex: Rizwan Javed'),
              PaymentContainer('Card Number', '**** **** **** 1242'),
              SizedBox(
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: PaymentContainer('Cvv', 'Ex: 123'),
                    ),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: PaymentContainer('Expiration Date', '22/12/2022'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'ADD NEW CARD',
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  PaymentContainer(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ConstColors.white2,
        ),
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
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
