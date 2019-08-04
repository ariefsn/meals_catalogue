
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/food_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<FoodModel> _favoriteFoods = List<FoodModel>();

  List<FoodModel> get favoriteFoods => _favoriteFoods;

  void addFavourite(FoodModel food) {
    try {
      getFoodDetailById(food.idMeal).then((v) {
        _favoriteFoods.add(FoodModel.fromJson(v.toJson()));
        notifyListeners();
      });
    } on TimeoutException {
      print("Timeout!");
    }
  }

  void removeFavourite(FoodModel food) {
    _favoriteFoods.removeWhere((e) => e.idMeal == food.idMeal);
    notifyListeners();
  }

  List<FoodModel> favoriteFoodsByCategory(String category) {
    return _favoriteFoods.where((e) => e.strCategory.toLowerCase() == category.toLowerCase()).toList();
  }

  bool isFavorite(FoodModel food) {
    List<FoodModel> _temp = List<FoodModel>();
    
    _temp = _favoriteFoods.where((e) => e.idMeal == food.idMeal).toList();

    return _temp.length > 0 ? true : false;
  }
}