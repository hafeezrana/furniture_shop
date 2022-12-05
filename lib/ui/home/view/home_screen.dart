import 'package:flutter/material.dart';
import 'package:furniture_shop/ui/home/view/product_detail_screen.dart';
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
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search, size: 30, color: ConstColors.black2),
                  Column(
                    children: const [
                      Text('Make Home', style: MyTextStyle.textStyle2),
                      Text('BEAUTIFUL', style: MyTextStyle.textStyle3b),
                    ],
                  ),
                  const Icon(Icons.shopping_cart_outlined,
                      size: 30, color: ConstColors.black2),
                ],
              ),
            ),
            const SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8 / 14,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProductDetailScreen();
                              },
                            ),
                          );
                        },
                        child: ReusableProduct(
                            productName: 'Wooden Chair', price: '\$30'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
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
