import 'package:flutter/material.dart';

import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusable_card.dart';

import '../../utils/constants/colors_consts.dart';
import '../../utils/constants/images_consts.dart';
import '../../utils/widgets/text_style.dart';
import 'check_out_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const route = '/cartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text('My Cart', style: MyTextStyle.textStyle3b),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(ConstsImages.randomImage,
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('item name',
                              style: MyTextStyle.textStyle2),
                          const Text('\$ 0.0', style: MyTextStyle.textStyle3),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ConstColors.white2),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.remove,
                                        color: ConstColors.black3, size: 22)),
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('04',
                                      style: MyTextStyle.textStyle2)),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ConstColors.white2,
                                ),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.add,
                                        color: ConstColors.black3, size: 22)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.cancel_outlined),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ReusableCard(
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: const TextField(
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    hintText: 'Enter Your promo code',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none)),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 6.6,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: ConstColors.black2),
                                  borderRadius: BorderRadius.circular(8),
                                  color: ConstColors.black3),
                              width: 20,
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: ConstColors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 50,
                    child: ReusableCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:', style: MyTextStyle.textStyle2),
                          Text('\$67',
                              style: MyTextStyle.textStyle3
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'Check Out',
          onTap: () {
            Navigator.pushNamed(context, CheckOutScreen.route);
          },
        ),
      ),
    );
  }
}
