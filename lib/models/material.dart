import 'package:flutter/foundation.dart';
import 'package:hyrule_compendium_app/constants.dart';

class Materiall {
  final ItemCategory category;
  final int id;
  final String name;
  final String description;
  final List<dynamic> commonLocations;
  final heartsRecovered;
  final String imageUrl;

  Materiall({
    this.category = ItemCategory.MATERIALS,
    this.id,
    this.name,
    this.description,
    this.commonLocations,
    this.heartsRecovered,
    this.imageUrl,
  });

  factory Materiall.fromJson(Map<String, dynamic> json) {
    return Materiall(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        commonLocations: json["common_locations"],
        heartsRecovered: json["hearts_recovered"],
        imageUrl: json["image"]);
  }
}
