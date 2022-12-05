import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';

import '../../utils/constants/colors_consts.dart';
import '../../utils/widgets/resusable_button.dart';
import '../../utils/widgets/text_style.dart';
import '../cart/cart_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.search, size: 30, color: ConstColors.black2),
                  Text('Favorites', style: MyTextStyle.textStyle3b),
                  Icon(Icons.shopping_cart_outlined,
                      size: 30, color: ConstColors.black2),
                ],
              ),
              const SizedBox(height: 10),
              // ListView.separated(
              //     separatorBuilder: (context, index) {
              //       return const Divider();
              //     },
              //     itemCount: 1,
              //     itemBuilder: (context, index) {
              //       return
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
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Coffee Table', style: MyTextStyle.textStyle2),
                          Text('\$ 0.0', style: MyTextStyle.textStyle2b),
                        ],
                      ),
                    ),
                    const SizedBox(),
                    SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.cancel_outlined),
                            Icon(Icons.shopping_bag_outlined),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //   );
                // }
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'Add all To My Cart',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CartScreen();
              },
            ));
          },
        ),
      ),
    );
  }
}
