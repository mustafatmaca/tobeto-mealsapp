import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class RequestHelper {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
        // URL is not hidden because API is free and don't need register or API Key. Thanks to TheMealDB.
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response
          .body); // jsonRespone => Map<String,List>. It returns just one value.
      List listOfMap = jsonResponse[
          "categories"]; // listOfMap => List<Map>. It has Map datas of categories.
      return listOfMap
          .map((e) => Category.fromJson(e))
          .toList(); // This alter the Map<String, dynamic> datas to Category and add to list.
    } else {
      throw Exception('Failed to load Categories.');
    }
  }

  Future<List<Meal>> fetchMealsByCategory(String category) async {
    final response = await http.get(
        // URL is not hidden because API is free and don't need register or API Key. Thanks to TheMealDB.
        Uri.parse(
            'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response
          .body); // jsonRespone => Map<String,List>. It returns just one value.
      List listOfMap = jsonResponse[
          "meals"]; // listOfMap => List<Map>. It has Map datas of categories.
      return listOfMap
          .map((e) => Meal.fromJson(e))
          .toList(); // This alter the Map<String, dynamic> datas to Category and add to list.
    } else {
      throw Exception('Failed to load Categories.');
    }
  }
}
