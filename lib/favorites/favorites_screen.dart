import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/authentication/firestore_service.dart';
import 'package:uuid/uuid.dart';

import '../../utils/constants/colors_consts.dart';
import '../../utils/widgets/resusable_button.dart';
import '../../utils/widgets/text_style.dart';
import '../cart/cart_screen.dart';
import '../model/cart.dart';
import '../model/product.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  static const route = '/fvrtScreen';

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteValue = ref.watch(favoritesStreamProvider);

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
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: ConstColors.black2,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                child: favoriteValue.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text(error.toString())),
                  data: (data) {
                    final favoriteProducts = data.docs;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) {
                        final fvrtProduct = favoriteProducts[index].data();

                        debugPrint('$fvrtProduct - - - - ');

                        return SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    fvrtProduct.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      fvrtProduct.title,
                                      style: MyTextStyle.textStyle2,
                                    ),
                                    Text(
                                      '\$ ${fvrtProduct.price}',
                                      style: MyTextStyle.textStyle2b,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(),
                              SizedBox(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          fvrtProduct.isFavorite =
                                              !fvrtProduct.isFavorite!;

                                          await FirestoreService()
                                              .updatefavorite(
                                            Product(
                                              id: fvrtProduct.id,
                                              title: fvrtProduct.title,
                                              imageUrl: fvrtProduct.imageUrl,
                                              quantity: fvrtProduct.quantity,
                                              price: fvrtProduct.price,
                                              isFavorite:
                                                  fvrtProduct.isFavorite,
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.cancel_outlined,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final cartId = const Uuid().v1();
                                          final newCart = Cart(
                                            cartId: cartId,
                                            productId: fvrtProduct.id,
                                            title: fvrtProduct.title,
                                            imageUrl: fvrtProduct.imageUrl,
                                            quantity: fvrtProduct.quantity,
                                            price: fvrtProduct.price,
                                            total: fvrtProduct.price,
                                          );

                                          await FirestoreService()
                                              .addToCart(newCart, cartId);
                                          Navigator.pushNamed(
                                            context,
                                            CartScreen.route,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.shopping_bag_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
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
            Navigator.pushNamed(context, CartScreen.route);
          },
        ),
      ),
    );
  }
}
