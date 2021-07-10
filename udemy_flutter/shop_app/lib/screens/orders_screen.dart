import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      // ignore: always_specify_types
      body: FutureBuilder(
        // ignore: always_specify_types
        builder: (BuildContext context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('Some error occured'),
              );
            } else {
              return Consumer<Orders>(
                  builder: (BuildContext ctx, Orders orderData, Widget child) {
                return ListView.builder(
                  itemBuilder: (BuildContext ctx, int i) =>
                      OrderItem(orderData.orders[i]),
                  itemCount: orderData.orders.length,
                );
              });
            }
          }
        },
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
      ),
      drawer: AppDrawer(),
    );
  }
}
