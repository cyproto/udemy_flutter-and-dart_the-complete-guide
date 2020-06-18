import 'package:flutter/material.dart';

import '../models/transactions.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTranx;

  TransactionList(this.transaction, this.deleteTranx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'No Expenses',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transactionItem: transaction[index], deleteTranx: deleteTranx);
              },
              itemCount: transaction.length,
            ),
    );
  }
}

