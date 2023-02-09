import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/cart/cart_notifier.dart';

import 'package:furniture_shop/reviews/reviews_rating_screen.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/constants/colors_consts.dart';
import '../authentication/firestore_service.dart';
import '../cart/cart_screen.dart';
import '../model/cart.dart';
import '../model/product.dart';
import '../utils/widgets/resusable_button.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
//
  static const route = '/productScreen';

  final Product product;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(counterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final quantityProvider = ref.watch(counterProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                            ),
                            child: Hero(
                              tag: widget.product,
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
                                color: ConstColors.white,
                              ),
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
                                  color: ConstColors.white2,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.circle_sharp,
                                      color: ConstColors.green,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.circle_rounded,
                                      color: ConstColors.red,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.circle_sharp,
                                      color: ConstColors.orange,
                                      size: 25,
                                    ),
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
                              onTap: () {
                                quantityProvider.decrement();
                              },
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
                              // '${widget.product.quantity}',
                              '${quantityProvider.quantity}',
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
                              onTap: () {
                                // ref
                                //     .watch(cartNotifierProvider.notifier)
                                //     .increment();

                                quantityProvider.increment();
                              },
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
                      child: Text(
                        '4.5',
                        style: MyTextStyle.textStyle2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push(ReviewsAndRatingScreen.route);
                      },
                      child: const Text(
                        '(20 Reviews)',
                        style: MyTextStyle.textStyle2,
                      ),
                    ),
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
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
              onPressed: () async {
                setState(() {
                  widget.product.isFavorite = !widget.product.isFavorite!;
                });
                await FirestoreService().updatefavorite(
                  Product(
                    id: widget.product.id,
                    title: widget.product.title,
                    imageUrl: widget.product.imageUrl,
                    quantity: widget.product.quantity,
                    price: widget.product.price,
                    isFavorite: widget.product.isFavorite,
                  ),
                );
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
              final cartId = const Uuid().v1();
              final newCart = Cart(
                cartId: cartId,
                productId: widget.product.id,
                title: widget.product.title,
                imageUrl: widget.product.imageUrl,
                quantity: quantityProvider.quantity,
                price: widget.product.price,
              );

              await FirestoreService().addToCart(newCart, cartId);

              context.push(CartScreen.route);
            },
          )
        ],
      ),
    );
  }
}
