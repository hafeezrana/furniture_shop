import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../authentication/firestore_service.dart';
import '../model/cart.dart';
import '../model/product.dart';

// final cartNotifierProvider = StateNotifierProvider<CartNotifier, Cart>((ref) {
//   return CartNotifier(const Cart());
// });

// class CartNotifier extends StateNotifier<Cart> {
//   CartNotifier(super.state);

//   final _firestoreService = FirestoreService();

//   void increment() => state.copyWith(quantity: state.quantity! + 1);
//   void decrement() => state.copyWith(quantity: state.quantity! - 1);

//   Future<void> addToCart(Product product) async {
//     final cartId = const Uuid().v1();
//     final newCart = Cart(
//       cartId: cartId,
//       productId: product.id,
//       title: product.title,
//       imageUrl: product.imageUrl,
//       quantity: product.quantity,
//       price: product.price,
//       total: product.price,
//     );
//     state = newCart;
//     await _firestoreService.addToCart(newCart, cartId);
//   }
// }

final counterProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  final _firestoreService = FirestoreService();

  Future<void> totalPrice(Product product) async {
    final cartId = const Uuid().v1();

    final totalprice = product.quantity * product.price;

    final newCart = Cart(
      quantity: product.quantity,
      price: product.price,
      total: totalprice,
    );

    _firestoreService.watchcart();
  }

  int quantity = 1;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity >= 2) {
      quantity--;
    }
    notifyListeners();
  }
}
