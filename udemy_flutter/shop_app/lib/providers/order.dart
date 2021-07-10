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
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    // ignore: always_specify_types
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/orders.json',
    );

    final http.Response response = await http.get(url);
    final List<OrderItem> loadedOrders = <OrderItem>[];
    final Map<String, dynamic> extractedData =
        json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach(
      // ignore: always_specify_types
      (String orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'] as double,
            products: (orderData['products'] as List<dynamic>)
                .map(
                  // ignore: always_specify_types
                  (item) => CartItem(
                    id: item['id'] as String,
                    title: item['title'] as String,
                    quantity: item['quantity'] as int,
                    price: item['price'] as double,
                  ),
                )
                .toList(),
            dateTime: DateTime.parse(orderData['dateTime'].toString()),
          ),
        );
      },
    );
    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/orders.json',
    );

    final DateTime timeStamp = DateTime.now();

    // ignore: always_specify_types
    final http.Response response = await http.post(
      url,
      // ignore: always_specify_types
      body: json.encode({
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        // ignore: always_specify_types
        'products': cartProducts
            // ignore: always_specify_types
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
