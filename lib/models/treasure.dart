import '../constants.dart';

class Treasure {
  final ItemCategory category;
  final int id;
  final String name;
  final String imageUrl;
  final List<dynamic> drops;
  final String description;
  final List<dynamic> commonLocations;

  Treasure({
    this.category = ItemCategory.TREASURES,
    this.id,
    this.name,
    this.imageUrl,
    this.drops,
    this.description,
    this.commonLocations,
  });

  factory Treasure.fromJson(Map<String, dynamic> json) {
    return Treasure(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image"],
        drops: json["drops"],
        description: json["description"],
        commonLocations: json["common_locations"]);
  }
}
