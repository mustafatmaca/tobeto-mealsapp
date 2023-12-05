import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

const categories = [
  Category(id: "1", name: "Soups", color: Colors.green),
  Category(id: "2", name: "Main Course", color: Colors.orange),
  Category(id: "3", name: "Salads", color: Colors.red),
  Category(id: "4", name: "Desserts", color: Colors.purple),
];

const meals = [
  Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Soup",
      imageUrl: "imageUrl",
      ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"])
];
