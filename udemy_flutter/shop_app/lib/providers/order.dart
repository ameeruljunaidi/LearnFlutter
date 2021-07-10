import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:http/http.dart' as http;

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

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/products.json',
    );

    final DateTime timeStamp = DateTime.now();

    // ignore: always_specify_types
    final http.Response response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        // ignore: always_specify_types
        'products': cartProducts
            .map((CartItem cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );

    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'].toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
