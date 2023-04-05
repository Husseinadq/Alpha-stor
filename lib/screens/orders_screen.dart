import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: ListView.builder(
        itemBuilder: ((context, index) =>
            OrderItem(order: ordersData.orders[index])),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
