import '../constants.dart';

class Monster {
  final ItemCategory category;
  final int id;
  final String name;
  final String description;
  final List<dynamic> commonLocations;
  final List<dynamic> drops;
  final String imageUrl;

  Monster({
    this.category = ItemCategory.MONSTERS,
    this.id,
    this.name,
    this.description,
    this.commonLocations,
    this.drops,
    this.imageUrl,
  });

  factory Monster.fromJson(Map<String, dynamic> json) {
    return Monster(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        commonLocations: json["common_locations"],
        drops: json["drops"],
        imageUrl: json["image"]);
  }
}
