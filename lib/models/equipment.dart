import '../constants.dart';

class Equipment {
  final ItemCategory category;
  final int id;
  final String name;
  final String imageUrl;
  final int attack;
  final int defence;
  final String description;
  final List<dynamic> commonLocations;

  Equipment({
    this.category = ItemCategory.EQUIPMENT,
    this.id,
    this.name,
    this.imageUrl,
    this.attack,
    this.defence,
    this.description,
    this.commonLocations,
  });

  bool get isWeapon {
    return attack != 0 && defence == 0 ? true : false;
  }

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image"],
        attack: json["attack"],
        defence: json["defense"],
        description: json["description"],
        commonLocations: json["common_locations"]);
  }
}
