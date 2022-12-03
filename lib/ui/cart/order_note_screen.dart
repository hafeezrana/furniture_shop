import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

class OrderNoteScreen extends StatelessWidget {
  const OrderNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.values[4],
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Success!',
                style: MyTextStyle.textStyle4,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(ConstsImages.randomImage),
              ),
              const Text(
                'Your order will be delivered soon.\n Thanks for choosing our app.',
                style: MyTextStyle.textStyle2,
              ),
              ResuableButton(
                buttonText: 'Track Your Order',
                onTap: () {},
              ),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 6),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Home',
                    style: MyTextStyle.textStyle3
                        .copyWith(color: ConstColors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
