import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:meals_catalogue/models/makananModel.dart';

Future<Map<String, dynamic>> readDataMakanan () async {
  String jsonString = await loadAsset();
  Map<String, dynamic> result = jsonDecode(jsonString);

  return result;
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('lib/assets/dataMakanan.json');
}

Future<List<MakananModel>> getMakanan () async {
  List<MakananModel> result = [];
  
  var res = await readDataMakanan();

  res["makanan"].forEach((f){
    MakananModel m = MakananModel.fromJson(f);
    result.add(m);
  });

  return result;
}