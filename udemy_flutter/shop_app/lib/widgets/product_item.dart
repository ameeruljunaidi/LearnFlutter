import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            // ignore: always_specify_types
            leading: Consumer<Product>(
              // ignore: always_specify_types
              builder: (BuildContext ctx, product, Widget child) => IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).accentColor,
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(
                  product.id,
                  product.price,
                  product.title,
                );
              },
              color: Theme.of(context).accentColor,
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
