import 'package:flutter/material.dart';
import 'package:shop_app/data/sample_products.dart';
import 'package:shop_app/models/product.dart';

class Products with ChangeNotifier {
  // ignore: always_specify_types
  final List<Product> _items = sampleProduct;

  List<Product> get items {
    // ignore: always_specify_types
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
