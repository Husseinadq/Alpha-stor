import 'package:flutter/material.dart';


class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId= ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
    );
  }
}
