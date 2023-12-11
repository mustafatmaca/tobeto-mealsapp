import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';

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
    final mealDetails = ref.watch(mealDetailProvider(widget.meal.idMeal));
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.network(
              widget.meal.strMealThumb,
            ),
          ),
          FutureBuilder(
              future: mealDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView(
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        Text(snapshot.data!.strCategory),
                        const Text(
                          "Area",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        Text(snapshot.data!.strArea),
                        const Text(
                          "Instructions",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                        Text(snapshot.data!.strInstructions),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Oops! Somethings goes wrong."),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
