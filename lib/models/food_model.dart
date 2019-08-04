class FoodModelLocal {
  final int id;
  final String name, image, category, howto;
  final List<dynamic> ingredient, seasoning;

  FoodModelLocal({this.id, this.ingredient, this.seasoning, this.image, this.name, this.category, this.howto});

  FoodModelLocal.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      image = json["image"],
      category = json["category"],
      ingredient = json["ingredient"],
      seasoning = json["seasoning"],
      howto = json["howto"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "category": category,
    "ingredient": ingredient,
    "seasoning": seasoning,
    "howto": howto
  };
}

class FoodModel {
  final String idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20, strSource;
  final DateTime dateModified;

  FoodModel({this.idMeal, this.strMeal, this.strDrinkAlternate, this.strCategory, this.strArea, this.strInstructions, this.strMealThumb, this.strTags, this.strYoutube, this.strIngredient1, this.strIngredient2, this.strIngredient3, this.strIngredient4, this.strIngredient5, this.strIngredient6, this.strIngredient7, this.strIngredient8, this.strIngredient9, this.strIngredient10, this.strIngredient11, this.strIngredient12, this.strIngredient13, this.strIngredient14, this.strIngredient15, this.strIngredient16, this.strIngredient17, this.strIngredient18, this.strIngredient19, this.strIngredient20, this.strMeasure1, this.strMeasure2, this.strMeasure3, this.strMeasure4, this.strMeasure5, this.strMeasure6, this.strMeasure7, this.strMeasure8, this.strMeasure9, this.strMeasure10, this.strMeasure11, this.strMeasure12, this.strMeasure13, this.strMeasure14, this.strMeasure15, this.strMeasure16, this.strMeasure17, this.strMeasure18, this.strMeasure19, this.strMeasure20, this.strSource, this.dateModified});

  List<String> get ingredients => _generateIMC()["ingredients"];
  List<String> get measures => _generateIMC()["measures"];
  List<String> get combine => _generateIMC()["combine"];

  FoodModel.fromJson(Map<String, dynamic> json) :
    idMeal = json["idMeal"],
    strMeal = json["strMeal"],
    strDrinkAlternate = json["strDrinkAlternate"],
    strCategory = json["strCategory"],
    strArea = json["strArea"],
    strInstructions = json["strInstructions"],
    strMealThumb = json["strMealThumb"],
    strTags = json["strTags"],
    strYoutube = json["strYoutube"],
    strIngredient1 = json["strIngredient1"],
    strIngredient2 = json["strIngredient2"],
    strIngredient3 = json["strIngredient3"],
    strIngredient4 = json["strIngredient4"],
    strIngredient5 = json["strIngredient5"],
    strIngredient6 = json["strIngredient6"],
    strIngredient7 = json["strIngredient7"],
    strIngredient8 = json["strIngredient8"],
    strIngredient9 = json["strIngredient9"],
    strIngredient10 = json["strIngredient10"],
    strIngredient11 = json["strIngredient11"],
    strIngredient12 = json["strIngredient12"],
    strIngredient13 = json["strIngredient13"],
    strIngredient14 = json["strIngredient14"],
    strIngredient15 = json["strIngredient15"],
    strIngredient16 = json["strIngredient16"],
    strIngredient17 = json["strIngredient17"],
    strIngredient18 = json["strIngredient18"],
    strIngredient19 = json["strIngredient19"],
    strIngredient20 = json["strIngredient20"],
    strMeasure1 = json["strMeasure1"],
    strMeasure2 = json["strMeasure2"],
    strMeasure3 = json["strMeasure3"],
    strMeasure4 = json["strMeasure4"],
    strMeasure5 = json["strMeasure5"],
    strMeasure6 = json["strMeasure6"],
    strMeasure7 = json["strMeasure7"],
    strMeasure8 = json["strMeasure8"],
    strMeasure9 = json["strMeasure9"],
    strMeasure10 = json["strMeasure10"],
    strMeasure11 = json["strMeasure11"],
    strMeasure12 = json["strMeasure12"],
    strMeasure13 = json["strMeasure13"],
    strMeasure14 = json["strMeasure14"],
    strMeasure15 = json["strMeasure15"],
    strMeasure16 = json["strMeasure16"],
    strMeasure17 = json["strMeasure17"],
    strMeasure18 = json["strMeasure18"],
    strMeasure19 = json["strMeasure19"],
    strMeasure20 = json["strMeasure20"],
    strSource = json["strSource"],
    dateModified = json["dateModified"];

  Map<String, dynamic> toJson() => {
      "idMeal" : idMeal,
      "strMeal" : strMeal,
      "strDrinkAlternate" : strDrinkAlternate,
      "strCategory" : strCategory,
      "strArea" : strArea,
      "strInstructions" : strInstructions,
      "strMealThumb" : strMealThumb,
      "strTags" : strTags,
      "strYoutube" : strYoutube,
      "strIngredient1" : strIngredient1,
      "strIngredient2" : strIngredient2,
      "strIngredient3" : strIngredient3,
      "strIngredient4" : strIngredient4,
      "strIngredient5" : strIngredient5,
      "strIngredient6" : strIngredient6,
      "strIngredient7" : strIngredient7,
      "strIngredient8" : strIngredient8,
      "strIngredient9" : strIngredient9,
      "strIngredient10" : strIngredient10,
      "strIngredient11" : strIngredient11,
      "strIngredient12" : strIngredient12,
      "strIngredient13" : strIngredient13,
      "strIngredient14" : strIngredient14,
      "strIngredient15" : strIngredient15,
      "strIngredient16" : strIngredient16,
      "strIngredient17" : strIngredient17,
      "strIngredient18" : strIngredient18,
      "strIngredient19" : strIngredient19,
      "strIngredient20" : strIngredient20,
      "strMeasure1" : strMeasure1,
      "strMeasure2" : strMeasure2,
      "strMeasure3" : strMeasure3,
      "strMeasure4" : strMeasure4,
      "strMeasure5" : strMeasure5,
      "strMeasure6" : strMeasure6,
      "strMeasure7" : strMeasure7,
      "strMeasure8" : strMeasure8,
      "strMeasure9" : strMeasure9,
      "strMeasure10" : strMeasure10,
      "strMeasure11" : strMeasure11,
      "strMeasure12" : strMeasure12,
      "strMeasure13" : strMeasure13,
      "strMeasure14" : strMeasure14,
      "strMeasure15" : strMeasure15,
      "strMeasure16" : strMeasure16,
      "strMeasure17" : strMeasure17,
      "strMeasure18" : strMeasure18,
      "strMeasure19" : strMeasure19,
      "strMeasure20" : strMeasure20,
      "strSource" : strSource,
      "dateModified" : dateModified,
  };

  Map<String, List<String>> _generateIMC() {
    List<String> tempIngredients = List<String>();
    List<String> tempMeasures = List<String>();
    List<String> tempCombine = List<String>();

    Map<String, dynamic> json = toJson();

    for (var i = 0; i < 20; i++) {
      String idxIngredient = "strIngredient" + (i + 1).toString();
      if (json[idxIngredient].toString().trim() != null && json[idxIngredient].toString().trim() != "" && json[idxIngredient].toString().trim() != "null") { tempIngredients.add(json[idxIngredient]); }
      String idxMeasure = "strMeasure" + (i + 1).toString();
      if (json[idxMeasure].toString().trim() != null && json[idxMeasure].toString().trim() != "" && json[idxMeasure].toString().trim() != "null") { tempMeasures.add(json[idxMeasure]); }
      if (json[idxIngredient].toString().trim() != null && json[idxIngredient].toString().trim() != "" && json[idxIngredient].toString().trim() != "null") {
        if (json[idxMeasure].toString().trim() != null && json[idxMeasure].toString().trim() != "" && json[idxMeasure].toString().trim() != "null") {
          tempCombine.add(json[idxIngredient].toString().trim() + " " + json[idxMeasure].toString().trim());
        }
      }
    }

    return {
      "ingredients": tempIngredients,
      "measures": tempMeasures,
      "combine": tempCombine
    };
  }
}
