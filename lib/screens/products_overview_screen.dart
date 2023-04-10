import 'package:alpha_stor/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final List<Product> loadedProduct = [];
  bool _showFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fechAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Shope'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.favorites) {
                    _showFavorites = true;
                  } else {
                    _showFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.all,
                    )
                  ]),
          Consumer<Cart>(
            builder: ((context, cart, child) => Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: (() {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  }),
                ),
                value: cart.itemCount.toString(),
                color: Theme.of(context).accentColor)),
          )
        ],
      ),
      drawer: AppDrawer(),
      body:_isLoading?Center(child: CircularProgressIndicator(),): ProductsGrid(_showFavorites),
    );
  }
}
