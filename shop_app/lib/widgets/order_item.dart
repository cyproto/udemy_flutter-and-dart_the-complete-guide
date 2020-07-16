import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderItem extends StatefulWidget {
  final OrdersItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      height: _isExpanded
          ? min(widget.order.products.length * 20.0 + 170, 280)
          : 95,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '\$${widget.order.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline4,
              ),
              subtitle: Text(
                DateFormat('dd-MM-yyyy hh:mm a').format(widget.order.dateTime),
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(
                milliseconds: 300,
              ),
              height: _isExpanded
                  ? min(widget.order.products.length * 20.0 + 70, 180)
                  : 0,
              child: ListView(
                children: widget.order.products
                    .map(
                      (product) => Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        padding: EdgeInsets.all(10),
                        color: Colors.redAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              product.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Text(
                              '${product.quantity} x \$${product.price}',
                              style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
