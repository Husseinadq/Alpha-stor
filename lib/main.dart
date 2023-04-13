import 'package:alpha_stor/providers/auth.dart';
import 'package:alpha_stor/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Auth())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
          UserProductScreen.routeName:(context) => UserProductScreen(),
          EditPoductScreen.routeName:(context) => EditPoductScreen(),
        },
      ),
    );
  }
}
