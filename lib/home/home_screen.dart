import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/home/category_item_list.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/widgets/home_widgets.dart';
import '../authentication/firestore_service.dart';
import '../cart/cart_screen.dart';
import '../model/cart.dart';
import 'product_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productStreamProvider);

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
                      Text('BEAUTIFUL', style: MyTextStyle.textStyle3b)
                    ],
                  ),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: ConstColors.black2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: CategoryItemList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1,
                child: productValue.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text(error.toString())),
                  data: (data) {
                    final products = data.docs;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5 / 7,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index].data();

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailScreen.route,
                                arguments: product,
                              );
                            },
                            child: ReusableProduct(
                              hero: product,
                              productName: product.title,
                              price: product.price,
                              imageUrl: product.imageUrl,
                              onBagTap: () async {
                                final cartId = const Uuid().v1();
                                final newCart = Cart(
                                  cartId: cartId,
                                  productId: product.id,
                                  title: product.title,
                                  imageUrl: product.imageUrl,
                                  quantity: product.quantity,
                                  price: product.price,
                                  total: product.price,
                                );
                                // if (product.id == product.id) {
                                //   await FirestoreService()
                                //       .updateCart(newCart, cartId);
                                // } else {

                                await FirestoreService()
                                    .addToCart(newCart, cartId);
                                Navigator.pushNamed(context, CartScreen.route);
                                // }
                              },
                            ),
                          ),
                        );
                      },
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
}
