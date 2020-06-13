import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 20,
          child: Text(
            '\$${spendingAmount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 10
            ),
          ),
      ),
      SizedBox(height: 5),
      Container(
        height: 100,
        width: 20,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                    decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                )))
          ],
        ),
      ),
      SizedBox(height: 5),
      Text(label)
    ]);
  }
}
