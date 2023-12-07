import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_details.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({required this.meal, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealsDetails(meal: meal),
            ),
          );
        },
        child: Row(
          children: [
            Text(meal.name),
          ],
        ),
      ),
    );
  }
}
