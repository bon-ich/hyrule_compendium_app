import '../constants.dart';

class Creature {
  final ItemCategory category;
  final int id;
  final String name;
  final String imageUrl;
  final heartsRecovered;
  final String description;
  final List<dynamic> commonLocations;
  final String cookingEffect;
  bool isFood;

  Creature({
    this.category = ItemCategory.CREATURES,
    this.id,
    this.name,
    this.imageUrl,
    this.heartsRecovered,
    this.description,
    this.commonLocations,
    this.cookingEffect,
    this.isFood,
  });

  factory Creature.fromJson(Map<String, dynamic> json) {
    return Creature(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image"],
        heartsRecovered: json["hearts_recovered"],
        description: json["description"],
        commonLocations: json["common_locations"],
        cookingEffect: json["cooking_effect"]);
  }
}
