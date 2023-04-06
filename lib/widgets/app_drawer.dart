import 'package:alpha_stor/screens/orders_screen.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _item(String title, Icon icon, String route ,BuildContext ctx) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: (() {
        Navigator.of(ctx).pushReplacementNamed(route);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title:const Text('Alpha Stor'),
          automaticallyImplyLeading: false,
        ),
       const Divider(),
        _item('Shop',const Icon(Icons.shop), '/', context),        
        _item('Orders',const Icon(Icons.payment), OrdersScreen.routeName, context),        
      ]),
    );
  }
}
