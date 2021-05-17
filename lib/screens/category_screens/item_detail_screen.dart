import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyrule_compendium_app/constants.dart';
import 'package:hyrule_compendium_app/functions.dart';
import 'package:hyrule_compendium_app/models/creatures.dart';
import 'package:hyrule_compendium_app/screens/components/item_common_locations.dart';

class ItemDetailScreen extends StatelessWidget {
  static const routeName = "/item-detail";

  final item;

  ItemDetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getCapitalizedString(item.name)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding, horizontal: kDefaultPadding),
          child: Container(
            child: SingleChildScrollView(
              child: item.category == ItemCategory.CREATURES
                  ? CreatureDetails(item)
                  : Text(""),
            ),
          ),
        ));
  }
}

class CreatureDetails extends StatelessWidget {
  final Creature item;
  CreatureDetails(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: Container(
                width: 200,
                padding: EdgeInsets.all(kDefaultPadding),
                color: Color.fromRGBO(255, 0, 0, .4),
                child: Text(
                  item.isFood ? "Food" : "Not Food",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding * 2),
        Text(
          item.description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        item.commonLocations != null && item.commonLocations.length > 0
            ? ItemCommonLocations(item.commonLocations)
            : Container()
      ],
    );
  }
}
