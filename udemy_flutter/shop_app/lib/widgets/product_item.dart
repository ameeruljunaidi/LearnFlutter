import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
