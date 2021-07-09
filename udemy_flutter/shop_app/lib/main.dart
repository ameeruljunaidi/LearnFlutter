import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: always_specify_types
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        // ignore: always_specify_types
        ChangeNotifierProvider(create: (BuildContext ctx) => Products()),
        // ignore: always_specify_types
        ChangeNotifierProvider(create: (BuildContext ctx) => Cart()),
        // ignore: always_specify_types
        ChangeNotifierProvider(create: (BuildContext ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        // ignore: always_specify_types
        routes: {
          ProductDetailScreen.routeName: (BuildContext ctx) =>
              ProductDetailScreen(),
          CartScreen.routeName: (BuildContext ctx) => CartScreen(),
          OrdersScreen.routeName: (BuildContext ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
