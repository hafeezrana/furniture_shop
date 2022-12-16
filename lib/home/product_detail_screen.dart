import 'package:flutter/material.dart';
import 'package:furniture_shop/authentication/firestore_service.dart';
import 'package:furniture_shop/model/cart.dart';
import 'package:furniture_shop/reviews/reviews_rating_screen.dart';

import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../../../utils/constants/colors_consts.dart';
import '../cart/cart_screen.dart';
import '../model/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({required this.product, super.key});

  static const route = '/productScreen';
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false;

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
                            bottomLeft: Radius.circular(40),
                          ),
                          child: Hero(
                            tag: 'hero',
                            child: Image.network(
                              widget.product.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
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
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: ConstColors.black2,
                                size: 22,
                              ),
                            ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.product.title,
                  style: MyTextStyle.textStyle3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${widget.product.price}',
                      style: MyTextStyle.textStyle4,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ConstColors.white2,
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.remove,
                              color: ConstColors.black3,
                              size: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '${widget.product.quantity}',
                            style: MyTextStyle.textStyle2,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ConstColors.white2,
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              color: ConstColors.black3,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: ConstColors.green),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('4.5', style: MyTextStyle.textStyle2)),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ReviewsAndRatingScreen.route);
                      },
                      child: const Text('(20 Reviews)',
                          style: MyTextStyle.textStyle2)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.product.description ??
                      'Description will be added soon',
                  maxLines: 10,
                  style: MyTextStyle.textStyle1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ConstColors.white2,
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.copyWith(isFavorite: !isFavorite);
                        });
                      },
                      icon: Icon(
                        widget.product.isFavorite!
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: ConstColors.black2,
                        size: 34,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ResuableButton(
                    buttonText: 'Add To Cart',
                    onTap: () async {
                      final newCart = Cart(
                        product: Product(
                          title: widget.product.title,
                          imageUrl: widget.product.imageUrl,
                          quantity: widget.product.quantity,
                          price: widget.product.price,
                        ),
                      );
                      await FirestoreService().addToCart(newCart);

                      Navigator.pushNamed(
                        context,
                        arguments: newCart,
                        CartScreen.route,
                      );
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
