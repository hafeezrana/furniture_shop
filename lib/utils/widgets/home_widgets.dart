import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';

import '../../ui/home/view/product_detail_screen.dart';
import '../constants/colors_consts.dart';
import 'text_style.dart';

class ReusableProduct extends StatelessWidget {
  ReusableProduct({
    Key? key,
    this.imageUrl,
    this.productName,
    this.price,
    this.onTap,
  }) : super(key: key);

  String? imageUrl;
  String? productName;
  String? price;

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InkWell(
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
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: ConstColors.white2,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(ConstsImages.randomImage,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ConstColors.white,
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: ConstColors.black2,
                        size: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text('Black LAMP'),
          Text(
            '\$23',
            style: MyTextStyle.textStyle1.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
