import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/authentication/firestore_service.dart';
import 'package:furniture_shop/cart/cart_notifier.dart';
import 'package:furniture_shop/model/cart.dart';

import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusable_card.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants/colors_consts.dart';
import '../../utils/widgets/text_style.dart';
import 'check_out_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({
    Key? key,
    // required this.cart,
  }) : super(key: key);

  static const route = '/cartScreen';

  // final Cart cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartValue = ref.watch(cartStreamProvider);
    final quantityProvider = ref.watch(counterProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text('My Cart', style: MyTextStyle.textStyle3b),
                    const SizedBox(width: 10)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: cartValue.when(
                  data: (data) {
                    final carts = data.docs;
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: carts.isEmpty ? 0 : data.docs.length,
                      itemBuilder: (context, index) {
                        final cart = carts[index].data();

                        debugPrint('Cart ================= $cart');
                        final money = cart.price! * quantityProvider.quantity;
                        final totalMoney = money * index;
                        debugPrint('Total Price =========== ====== $money');

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
                                    cart.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart.title!,
                                      style: MyTextStyle.textStyle2,
                                    ),
                                    Text(
                                      '\$ ${cart.price}',
                                      style: MyTextStyle.textStyle3,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ConstColors.white2,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              quantityProvider.decrement();
                                              FirestoreService().updateCart(
                                                Cart(
                                                  quantity:
                                                      quantityProvider.quantity,
                                                ),
                                                cart.cartId!,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              color: ConstColors.black3,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            '${cart.quantity}',
                                            style: MyTextStyle.textStyle2,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ConstColors.white2,
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              quantityProvider.increment();
                                              await FirestoreService()
                                                  .updateCart(
                                                Cart(
                                                  quantity:
                                                      quantityProvider.quantity,
                                                ),
                                                cart.cartId!,
                                              );
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
                                          await FirestoreService()
                                              .removeCart(cart.cartId!);
                                        },
                                        child: const Icon(
                                          Icons.cancel_outlined,
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
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5.5,
                child: cartValue.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text(error.toString())),
                  data: (data) {
                    final itemLen = data.docs.isEmpty ? data.docs.length : 0;
                    final carts = data.docs.elementAt(itemLen).data();

                    final totalPrice = carts.quantity! * carts.price!;

                    var totala = 0.0;

                    for (int i = 0; i <= carts.cartId!.length; i++) {
                      totala += totalPrice;
                    }

                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 5.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: ReusableCard(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: const TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Your promo code',
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 6.6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ConstColors.black2),
                                        borderRadius: BorderRadius.circular(8),
                                        color: ConstColors.black3,
                                      ),
                                      width: 20,
                                      child: InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: ConstColors.white,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1,
                            height: 50,
                            child: ReusableCard(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total:',
                                    style: MyTextStyle.textStyle2,
                                  ),
                                  Text(
                                    // '\$ $totalPrice',
                                    '\$ $totala',
                                    style: MyTextStyle.textStyle3b,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
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
          buttonText: 'Check Out',
          onTap: () {
            context.push(CheckOutScreen.route);
          },
        ),
      ),
    );
  }
}
