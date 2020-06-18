import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(children: <Widget>[
        Container(
          height: constraints.maxHeight * 0.15,
          child: Text(
            '\$${spendingAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 10),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
          height: constraints.maxHeight * 0.6,
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
        SizedBox(height: constraints.maxHeight * 0.05),
        Container( height: constraints.maxHeight * 0.15,child: FittedBox(child: Text(label)))
      ]);
    });
  }
}
