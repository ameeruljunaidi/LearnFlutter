import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  // ignore: always_specify_types
  // final List<Product> _items = sampleProduct;
  List<Product> _items = <Product>[];

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

  Future<void> fetchAndSetProduct() async {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/products.json',
    );

    try {
      final http.Response response = await http.get(url);
      final Map<String, dynamic> extractedData =
          json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = <Product>[];
      extractedData.forEach(
        (String prodId, dynamic prodData) {
          loadedProducts.add(
            Product(
              id: prodId,
              title: prodData['title'].toString(),
              description: prodData['description'].toString(),
              price: double.parse(prodData['price'].toString()),
              imageUrl: prodData['imageUrl'].toString(),
            ),
          );
        },
      );
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/products.json',
    );

    try {
      final http.Response response = await http.post(
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
      );
      final Product newProduct = Product(
        id: json.decode(response.body)['name'].toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> editProduct(String id, Product newProduct) async {
    final int prodIndex = _items.indexWhere((Product prod) => prod.id == id);
    if (prodIndex >= 0) {
      final Uri url = Uri.https(
        'shop-app-b0190-default-rtdb.firebaseio.com',
        '/products/$id.json',
      );

      http.patch(url,
          // ignore: always_specify_types
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));

      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final Uri url = Uri.https(
      'shop-app-b0190-default-rtdb.firebaseio.com',
      '/products/$id.json',
    );

  http.delete(url)

    _items.removeWhere((Product prod) => prod.id == id);
    notifyListeners();
  }
}
