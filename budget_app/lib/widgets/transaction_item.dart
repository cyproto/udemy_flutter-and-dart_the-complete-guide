import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transactionItem,
    @required this.deleteTranx,
  }) : super(key: key);

  final Transaction transactionItem;
  final Function deleteTranx;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                '\$${transactionItem.amount}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transactionItem.title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(transactionItem.date),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Colors.redAccent,
                label: const Text('Delete'),
                onPressed: () => deleteTranx(transactionItem.id))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.redAccent,
                onPressed: () => deleteTranx(transactionItem.id),
              ),
      ),
    );
  }
}
