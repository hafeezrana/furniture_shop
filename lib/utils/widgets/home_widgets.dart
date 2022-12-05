import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';

import '../constants/colors_consts.dart';
import 'text_style.dart';

class ReusableProduct extends StatelessWidget {
  ReusableProduct({
    Key? key,
    this.imageUrl,
    this.productName,
    this.price,
  }) : super(key: key);

  String? imageUrl;
  String? productName;
  String? price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height / 6,
            // height: 160,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height / 5,

                  // width: MediaQuery.of(context).size.width / 3.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: ConstColors.white2,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Hero(
                      tag: 'hero',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              productName!,
              style: MyTextStyle.textStyle2,
            ),
          ),
          Text(
            price!,
            style: MyTextStyle.textStyle2b,
          ),
        ],
      ),
    );
  }
}
