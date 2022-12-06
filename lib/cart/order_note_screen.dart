import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../home/home_screen.dart';
import '../myorders/order_screen.dart';

class OrderNoteScreen extends StatefulWidget {
  const OrderNoteScreen({super.key});

  static const route = '/orderNoteScreen';

  @override
  State<OrderNoteScreen> createState() => _OrderNoteScreenState();
}

class _OrderNoteScreenState extends State<OrderNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Success!', style: MyTextStyle.textStyle4),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.network(ConstsImages.randomImage)),
                  const SizedBox(height: 10),
                  const Text(
                      'Your order will be delivered soon.\n Thanks for choosing our app.',
                      style: MyTextStyle.textStyle2),
                  const SizedBox(height: 10),
                  ResuableButton(
                    buttonText: 'Track Your Order',
                    onTap: () {
                      Navigator.pushNamed(context, OrderScreen.route);
                    },
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: ConstColors.black2)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 6),
                      onPressed: () {
                        // Navigator.push(

                        //   context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return const HomeScreen();
                        //   },
                        // ));
                        Navigator.pushNamed(context, HomeScreen.route);
                      },
                      child: Text('Back to Home',
                          style: MyTextStyle.textStyle3
                              .copyWith(color: ConstColors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
