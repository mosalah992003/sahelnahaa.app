import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/carts/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
}
