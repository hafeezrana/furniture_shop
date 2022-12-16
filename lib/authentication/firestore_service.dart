import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_shop/model/cart.dart';

import '../model/user.dart';
import 'auth_service.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final authService = AuthService();

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

  Future<void> removeCart(Cart cart) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .doc()
        .delete();
  }

  Future<void> updateCart(Cart cart) async {
    return await _firestore
        .collection('users')
        .doc(authService.userId)
        .collection('cart')
        .doc()
        .update(
          cart.toMap(),
        );
  }
}
