import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
    );
  }
}
