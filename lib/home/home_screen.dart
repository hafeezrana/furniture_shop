import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/home/category_item_list.dart';
import 'package:furniture_shop/model/product.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../../../utils/widgets/home_widgets.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Product>> watchProduct() {
    return _firestore
        .collection('products')
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .snapshots();
  }

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
                child: StreamBuilder<QuerySnapshot<Product>>(
                  stream: watchProduct(),
                  builder: (context, snapshot) {
                    final products = snapshot.data?.docs;
                    print('$products -------');

                    if (!snapshot.hasData || products == null) {
                      return const Text('no data');
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 5 / 6,
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
                                );
                              },
                              child: ReusableProduct(
                                productName: product.title,
                                price: product.price,
                                imageUrl: product.imageUrl,

                                // price: '\$${product?.price}',
                              ),
                            ),
                          );
                        },
                      );
                    }
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
