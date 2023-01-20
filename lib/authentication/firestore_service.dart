import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/model/cart.dart';

import '../model/product.dart';
import '../model/user.dart';
import 'auth_service.dart';

final firestoreProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final productStreamProvider = StreamProvider<QuerySnapshot<Product>>((ref) {
  return ref.watch(firestoreProvider).watchProduct();
});

final cartStreamProvider = StreamProvider<QuerySnapshot<Cart>>((ref) {
  return ref.watch(firestoreProvider).watchcart();
});

final favoritesStreamProvider = StreamProvider<QuerySnapshot<Product>>((ref) {
  return ref.watch(firestoreProvider).watchFavorites();
});

class FirestoreService {
  static const String usersCollection = 'users';
  static const String cartCollection = 'cart';
  static const String productsCollection = 'products';
  static const String favoritesCollection = 'favorites';

  final _firestore = FirebaseFirestore.instance;
  final authService = AuthService();

  Stream<QuerySnapshot<Product>> watchProduct() {
    return _firestore
        .collection(productsCollection)
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Cart>> watchcart() {
    return _firestore
        .collection(usersCollection)
        .doc(authService.userId)
        .collection(cartCollection)
        .withConverter<Cart>(
          fromFirestore: (snapshot, _) => Cart.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Product>> watchFavorites() {
    return _firestore
        // .collection(usersCollection)
        // .doc(authService.userId)
        .collection(productsCollection)
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .where('isFavorite', isEqualTo: true)
        .snapshots();
  }

  Future<void> updatefavorite(Product product) {
    return _firestore
        .collection(productsCollection)
        .doc(product.id)
        .update(product.toMap());
  }

  Future<void> addUser(User user) async {
    return await _firestore
        .collection(usersCollection)
        .doc(authService.userId)
        .set(user.toMap());
  }

  Future<void> addToCart(Cart cart, String cartId) async {
    return await _firestore
        .collection(usersCollection)
        .doc(authService.userId)
        .collection(cartCollection)
        .doc(cartId)
        .set(cart.toMap());
  }

  Future<void> updateCart(Cart cart, String cartId) async {
    return await _firestore
        .collection(usersCollection)
        .doc(authService.userId)
        .collection(cartCollection)
        .doc(cartId)
        .update(cart.toMap());
  }

  Future<void> removeCart(String cartId) async {
    return await _firestore
        .collection(usersCollection)
        .doc(authService.userId)
        .collection(cartCollection)
        .doc(cartId)
        .delete();
  }
}
