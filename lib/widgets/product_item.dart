import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(
                Icons.favorite,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          )),
    );
  }
}
