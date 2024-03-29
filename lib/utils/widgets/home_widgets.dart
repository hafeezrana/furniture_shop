import 'package:flutter/material.dart';

import '../constants/colors_consts.dart';
import 'text_style.dart';

class ReusableProduct extends StatelessWidget {
  const ReusableProduct({
    Key? key,
    this.imageUrl,
    this.productName,
    this.price,
    this.hero,
    this.onBagTap,
  }) : super(key: key);

  final String? imageUrl;
  final String? productName;
  final double? price;
  final dynamic hero;
  final VoidCallback? onBagTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: ConstColors.white2,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Hero(
                      tag: hero,
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                      ),
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
                        color: ConstColors.white),
                    child: InkWell(
                      onTap: onBagTap,
                      child: const Icon(
                        Icons.shopping_bag,
                        color: ConstColors.black2,
                        size: 34,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(productName!, style: MyTextStyle.textStyle2),
          ),
          Text(price.toString(), style: MyTextStyle.textStyle2b),
        ],
      ),
    );
  }
}
