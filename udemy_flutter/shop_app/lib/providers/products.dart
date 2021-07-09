import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/data/sample_products.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  // ignore: always_specify_types
  final List<Product> _items = sampleProduct;

  List<Product> get items {
    // ignore: always_specify_types
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((Product prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((Product prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final Uri url = Uri.https(
      'https://shop-app-b0190-default-rtdb.firebaseio.com',
      '/products.json',
    );

    http
        .post(
      url,
      body: json.encode(
        // ignore: always_specify_types
        {
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        },
      ),
    )
        .then(
      (http.Response response) {
        final Product newProduct = Product(
          id: json.decode(response.body)['name'].toString(),
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        );
        _items.add(newProduct);
        notifyListeners();
      },
    );
  }

  void editProduct(String id, Product newProduct) {
    final int prodIndex = _items.indexWhere((Product prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((Product prod) => prod.id == id);
    notifyListeners();
  }
}
