import 'package:flutter/material.dart';
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
    final Product newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    notifyListeners();
  }
}
