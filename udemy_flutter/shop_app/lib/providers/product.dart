import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Future<void> toggleFavoriteStatus() async {
    final bool oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/products/$id.json',
    );

    try {
      final http.Response response = await http.patch(
        url,
        body: json.encode(
          <String, bool>{
            'isFavorite': isFavorite,
          },
        ),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
