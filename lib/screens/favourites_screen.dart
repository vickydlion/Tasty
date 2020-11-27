import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  void _refreshScreen() {
    // doing this for avoiding showing cached data while returning back from meal detail screen
    // which will be updated after learning state management in Flutter
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              imageUrl: widget.favouriteMeals[index].imageUrl,
              affordability: widget.favouriteMeals[index].affordability,
              complexity: widget.favouriteMeals[index].complexity,
              duration: widget.favouriteMeals[index].duration,
              refreshFavouriteScreen: _refreshScreen);
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
