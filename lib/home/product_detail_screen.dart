import 'package:flutter/material.dart';

import 'package:furniture_shop/utils/constants/images_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../../../utils/constants/colors_consts.dart';
import '../cart/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const route = '/productScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.values[3],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40)),
                          child: Hero(
                              tag: 'hero',
                              child: Image.network(ConstsImages.randomImage,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0).copyWith(left: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ConstColors.white),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back_ios_new,
                                    color: ConstColors.black2, size: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 36),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: ConstColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.circle_sharp,
                                      color: ConstColors.green, size: 22),
                                  Icon(Icons.circle_rounded,
                                      color: ConstColors.red, size: 22),
                                  Icon(Icons.circle_sharp,
                                      color: ConstColors.orange, size: 22),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Wooden Chair', style: MyTextStyle.textStyle3)),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$ 30', style: MyTextStyle.textStyle4),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
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
                            child: Text('04', style: MyTextStyle.textStyle2)),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ConstColors.white2),
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
              Row(
                children: const [
                  Icon(Icons.star, color: ConstColors.green),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('4.5', style: MyTextStyle.textStyle2)),
                  Text('(20 Reviews)', style: MyTextStyle.textStyle2),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      'Wooden Chair is made up of natural wood. Design is so simle and good.Now a days it is most common used in family.With three different colors where you select with your best choice for home.',
                      maxLines: 10,
                      style: MyTextStyle.textStyle1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ConstColors.white2),
                    alignment: Alignment.center,
                    child: const Icon(Icons.bookmark_border,
                        color: ConstColors.black2, size: 34),
                  ),
                  const SizedBox(width: 10),
                  ResuableButton(
                    buttonText: 'Add To Cart',
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.route);
                    },
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
