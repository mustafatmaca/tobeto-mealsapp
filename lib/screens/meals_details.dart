import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealsDetails extends ConsumerStatefulWidget {
  final Meal meal;
  const MealsDetails({required this.meal, Key? key}) : super(key: key);

  @override
  _MealsDetailsState createState() => _MealsDetailsState();
}

class _MealsDetailsState extends ConsumerState<MealsDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.strMeal),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavorite(widget.meal);
            },
            icon: Icon(favoriteMeals.contains(widget.meal)
                ? Icons.favorite
                : Icons.favorite_border),
          ),
        ],
      ),
      body: Center(
        child: Text(widget.meal.strMeal),
      ),
    );
  }
}
