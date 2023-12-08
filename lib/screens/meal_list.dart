import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_card.dart';

class MealList extends ConsumerWidget {
  final Category category;
  const MealList({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsFromState = ref.watch(mealsProvider(category.strCategory));

    Widget widget = FutureBuilder(
      future: mealsFromState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) =>
                MealCard(meal: snapshot.data![index]),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
      ),
      body: widget,
    );
  }
}
