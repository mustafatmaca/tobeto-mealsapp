import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_card.dart';

class MealList extends ConsumerWidget {
  final List<Meal> meals;
  const MealList({required this.meals, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsFromState = ref.watch(mealsProvider);

    Widget widget = ListView.builder(
      itemCount: mealsFromState.length,
      itemBuilder: (context, index) => MealCard(meal: mealsFromState[index]),
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
