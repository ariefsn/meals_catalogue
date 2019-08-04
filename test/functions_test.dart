
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:meals_catalogue/models/food_model.dart';
import 'package:mockito/mockito.dart';
import 'package:meals_catalogue/core/functions.dart';

String id = "52959";
String urlLookup = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
String category = "Seafood";
String urlFilterCategory = "https://www.themealdb.com/api/json/v1/1/filter.php?c=";

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchFoodByID', () {
    test("successFetch", () async {
      final MockClient client = MockClient();

      when(client.get(urlLookup + id))
        .thenAnswer((_) async => http.Response(getFoodDetailById(id).toString(), 200));

      expect(await getFoodDetailById(urlLookup + id), isInstanceOf<FoodModel>());
    });

    test("matchID", () async {
      final MockClient client = MockClient();

      when(client.get(urlLookup + id))
        .thenAnswer((_) async => http.Response(getFoodDetailById(urlLookup + id).toString(), 200));

      FoodModel res = await getFoodDetailById(urlLookup + id);

      expect(res.idMeal, id);
    });

  });

  group('filterFoodByCategory', () {
    test("successFilter", () async {
      final MockClient client = MockClient();

      when(client.get(urlFilterCategory + category))
        .thenAnswer((_) async => http.Response(getFoodFromApiByCategory(urlFilterCategory + category).toString(), 200));

      expect(await getFoodFromApiByCategory(urlFilterCategory + category), isInstanceOf<List<FoodModel>>());
    });

    test("matchByName after filter", () async {
      final MockClient client = MockClient();

      when(client.get(urlFilterCategory + category))
        .thenAnswer((_) async => http.Response(getFoodFromApiByCategory(urlFilterCategory + category).toString(), 200));

      List<FoodModel> res = await getFoodFromApiByCategory(urlFilterCategory + category);

      expect(res.where((e) => e.idMeal == id).toList()[0].strMeal, "Baked salmon with fennel & tomatoes");
    });

  });
}