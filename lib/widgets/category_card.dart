import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function() onSelectCategory;

  const CategoryCard(
      {required this.category, required this.onSelectCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: [Colors.amber.withOpacity(0.5), Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(
          category.strCategory,
        ),
      ),
    );
  }
}
