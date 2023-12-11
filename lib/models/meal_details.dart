// To parse this JSON data, do
//
//     final mealDetails = mealDetailsFromJson(jsonString);

import 'dart:convert';

MealDetails mealDetailsFromJson(String str) =>
    MealDetails.fromJson(json.decode(str));

String mealDetailsToJson(MealDetails data) => json.encode(data.toJson());

class MealDetails {
  String idMeal;
  String strMeal;
  dynamic strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;

  MealDetails({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) => MealDetails(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strInstructions: json["strInstructions"],
      );

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strDrinkAlternate": strDrinkAlternate,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
      };
}
