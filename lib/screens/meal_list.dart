import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealList extends StatelessWidget {
  final List<Meal> meals;
  const MealList({required this.meals, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Text(meals[index].name),
    );

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("There is no meals."),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Listesi"),
      ),
      body: widget,
    );
  }
}
