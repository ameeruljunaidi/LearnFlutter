import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const String routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final Products productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //...
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int i) => Column(
            children: <Widget>[
              UserProductItem(
                title: productsData.items[i].title,
                imageUrl: productsData.items[i].imageUrl,
              ),
              const Divider(),
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
