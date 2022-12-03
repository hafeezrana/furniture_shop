import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../../../utils/widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search, size: 30, color: ConstColors.black2),
                  Column(
                    children: [
                      const Text('Make Home', style: MyTextStyle.textStyle2),
                      Text('BEAUTIFUL',
                          style: MyTextStyle.textStyle3.copyWith(fontSize: 20)),
                    ],
                  ),
                  const Icon(Icons.shopping_cart_outlined,
                      size: 30, color: ConstColors.black2),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ReusableContainer1(
                      Icons.star,
                      'Popular',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.chair_alt_rounded,
                      'Chair',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.table_bar_outlined,
                      'Table',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.chair,
                      'Arm-chair',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.bed_outlined,
                      'Bed',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.door_back_door_outlined,
                      'Door',
                      () {},
                    ),
                    ReusableContainer1(
                      Icons.window_rounded,
                      'Window',
                      () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  children: [
                    ReusableProduct(productName: 'Wooden Chair', price: '\$30'),
                    ReusableProduct(productName: 'Lamp', price: '\$30'),
                    ReusableProduct(productName: 'table', price: '\$30'),
                    ReusableProduct(productName: 'Wooden Chair', price: '\$30'),
                    ReusableProduct(productName: 'Wooden Chair', price: '\$30'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReusableContainer1(IconData? icon, String? title, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConstColors.white2,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: ConstColors.black2,
                size: 34,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
