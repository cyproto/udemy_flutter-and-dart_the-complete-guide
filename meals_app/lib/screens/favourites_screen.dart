import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'No favourite meals found.',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              imageUrl: widget.favouriteMeals[index].imageUrl,
              duration: widget.favouriteMeals[index].duration,
              complexity: widget.favouriteMeals[index].complexity,
              affordability: widget.favouriteMeals[index].affordability,
            );
          },
          itemCount: widget.favouriteMeals.length);
    }
  }
}
