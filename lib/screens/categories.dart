import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/categories_provider.dart';
import 'package:meals_app/screens/favorites.dart';
import 'package:meals_app/screens/meal_list.dart';
import 'package:meals_app/widgets/category_card.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealList(
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Favorites(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                "Meals App",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: const Text(
                "Item 1",
                style: TextStyle(color: Colors.amber),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                "Item 2",
                style: TextStyle(color: Colors.amber),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: categories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CategoryCard(
                    category: snapshot.data![index],
                    onSelectCategory: () {
                      _selectCategory(context, snapshot.data![index]);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
