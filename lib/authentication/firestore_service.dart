import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/model/cart.dart';

import '../model/product.dart';
import '../model/user.dart';
import 'auth_service.dart';

final firestoreProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final cartStreamProvider = StreamProvider<QuerySnapshot<Cart>>((ref) {
  return ref.watch(firestoreProvider).watchcart();
});

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final authService = AuthService();

  Stream<QuerySnapshot<Product>> watchProduct() {
    return _firestore
        .collection('products')
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Cart>> watchcart() {
    return _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .withConverter<Cart>(
          fromFirestore: (snapshot, _) => Cart.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .snapshots();
  }

  Future<void> addUser(User user) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .set(user.toMap());
  }

  Future<void> addToCart(Cart cart) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .doc()
        .set(cart.toMap());
  }

  Future<void> removeCart(String id) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .doc(id)
        .delete();
  }

  Future<void> updateCart(Cart cart, String id) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .doc(id)
        .update(
          cart.toMap(),
        );
  }
}
