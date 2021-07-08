import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });

  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
}

class Orders with ChangeNotifier {
  // ignore: always_specify_types
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    // ignore: always_specify_types
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
