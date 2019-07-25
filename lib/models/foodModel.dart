class FoodModel {
  final int id;
  final String name, image, category, howto;
  final List<dynamic> ingredient, seasoning;

  FoodModel({this.id, this.ingredient, this.seasoning, this.image, this.name, this.category, this.howto});

  FoodModel.fromJson(Map<String, dynamic> json)
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
