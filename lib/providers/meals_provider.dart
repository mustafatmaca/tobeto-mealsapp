import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/request_helper.dart';
import 'package:meals_app/models/meal.dart';

final mealsProvider =
    Provider.family<Future<List<Meal>>, String>((ref, category) {
  return RequestHelper().fetchMealsByCategory(category);
});
