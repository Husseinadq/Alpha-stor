import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavo;
  ProductsGrid(this.isFavo);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =isFavo?productsData.favoritesItem: productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
             // create: (c) => products[i],
             value: products[i],
              child: ProductItem(),
            ),
        itemCount: products.length);
  }
}
