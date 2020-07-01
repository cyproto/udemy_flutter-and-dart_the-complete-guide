import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox(
              child: Text(
                '\$${price}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).accentColor,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(
            '\$${price * quantity}',
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: Text(
            '$quantity x',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
