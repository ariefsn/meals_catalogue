import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:meals_catalogue/models/foodModel.dart';

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