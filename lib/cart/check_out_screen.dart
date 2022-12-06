import 'package:flutter/material.dart';

import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusable_card.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import 'order_note_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  static const route = '/checkOut';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
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
                  const Text('Check out', style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Shipping Address',
                        style: MyTextStyle.textStyle1),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit_outlined)),
                  ],
                ),
              ),
              ReusableCard(
                child: Column(
                  children: const [
                    TextField(
                      textAlign: TextAlign.start,
                      style: MyTextStyle.textStyle2b,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: MyTextStyle.textStyle2b,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                    Divider(),
                    TextField(
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: 'your address here',
                          hintStyle: MyTextStyle.textStyle1,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Payment', style: MyTextStyle.textStyle1),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit_outlined)),
                  ],
                ),
              ),
              ReusableCard(
                child: const TextField(
                    textAlign: TextAlign.start,
                    style: MyTextStyle.textStyle2,
                    decoration: InputDecoration(
                        hintText: 'Code no 4637--',
                        hintStyle: MyTextStyle.textStyle2b,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none)),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Delivery Method',
                        style: MyTextStyle.textStyle1),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit_outlined)),
                  ],
                ),
              ),
              ReusableCard(
                child: const TextField(
                    textAlign: TextAlign.start,
                    style: MyTextStyle.textStyle2b,
                    decoration: InputDecoration(
                        hintText: 'DHL Fast(2-3) days',
                        hintStyle: MyTextStyle.textStyle2b,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none)),
              ),
              const SizedBox(height: 40),
              ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Order:', style: MyTextStyle.textStyle2),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child:
                                Text('\$94', style: MyTextStyle.textStyle2b)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Deliver:', style: MyTextStyle.textStyle2),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child:
                                Text('\$06', style: MyTextStyle.textStyle2b)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Total:', style: MyTextStyle.textStyle2),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child:
                                Text('\$100', style: MyTextStyle.textStyle2b)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'SUBMIT ORDER',
          onTap: () {
            Navigator.pushNamed(context, OrderNoteScreen.route);
          },
        ),
      ),
    );
  }
}
