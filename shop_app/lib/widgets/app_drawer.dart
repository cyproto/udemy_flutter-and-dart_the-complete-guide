import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.bottomRight,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Hey, User',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text(
              'Orders',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.route);
            },
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Manage Products',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.route);
            },
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
