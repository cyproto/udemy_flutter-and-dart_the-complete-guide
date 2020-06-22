import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text(mealId),
      ),
    );
  }
}
