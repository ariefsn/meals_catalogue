import 'package:flutter/services.dart' show rootBundle;
import 'package:meals_catalogue/core/ajax.dart';
import 'dart:async';
import 'dart:convert';
import 'package:meals_catalogue/models/food_model.dart';

Future<Map<String, dynamic>> readConfig () async {
  String jsonString = await loadAssetConfig();
  Map<String, dynamic> result = jsonDecode(jsonString);

  return result;
}

Future<String> loadAssetConfig() async {
  return await rootBundle.loadString('lib/config/app.config.json');
}

Future<Map<String, dynamic>> readDataFood () async {
  String jsonString = await loadAsset();
  Map<String, dynamic> result = jsonDecode(jsonString);

  return result;
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('lib/assets/foodsData.json');
}

Future<List<FoodModel>> getFood () async {
  List<FoodModel> result = [];
  
  var res = await readDataFood();

  res["foods"].forEach((f){
    FoodModel m = FoodModel.fromJson(f);
    result.add(m);
  });

  return result;
}

Future<List<FoodModel>> getFoodFromApiByCategory (String category) async {
  List<FoodModel> result = [];
  
  Ajax ajax = Ajax();
  var url = "";
  if (category.contains("http")) {
    url = category;
  } else {
    url = "filter.php?c=" + category;
  }

  var res = await ajax.get(AjaxParams(
    url: url
  ));
  if (res["data"]["meals"] != null) {
    for (var item in res["data"]["meals"]) {
      // var detail = await getFoodDetailById(item["idMeal"]);
      FoodModel m = FoodModel.fromJson(item);
      result.add(m);
    }
  }

  return result;
}

Future<FoodModel> getFoodDetailById (String id) async {
  FoodModel result = FoodModel();
  
  Ajax ajax = Ajax();
  var url = "";
  if (id.contains("http")) {
    url = id;
  } else {
    url = "lookup.php?i=" + id;
  }

  var res = await ajax.get(AjaxParams(
    url: url
  ));
  if (res["data"]["meals"] != null && res["data"]["meals"].length > 0) {
    FoodModel m = FoodModel.fromJson(res["data"]["meals"][0]);
    result = m;
  }

  return result;
}
