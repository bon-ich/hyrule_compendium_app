import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../category_screens/category_materials_screen.dart';
import '../category_screens/category_monster_screen.dart';
import '../category_screens/category_equipment_screen.dart';
import '../category_screens/category_creatures_screen.dart';
import '../category_screens/category_treasures_screen.dart';

import '../../constants.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final ItemCategory category;

  CategoryItem(
      {@required this.title, @required this.imgUrl, @required this.category});

  void selectCategory(BuildContext ctx, ItemCategory category) {
    var route;
    switch (category) {
      case ItemCategory.TREASURES:
        route = TreasuresCategoryScreen.routeName;
        break;
      case ItemCategory.CREATURES:
        route = CreaturesCategoryScreen.routeName;
        break;
      case ItemCategory.MATERIALS:
        route = MaterialsCategoryScreen.routeName;
        break;
      case ItemCategory.EQUIPMENT:
        route = EquipmentCategoryScreen.routeName;
        break;
      case ItemCategory.MONSTERS:
        route = MonstersCategoryScreen.routeName;
        break;
    }
    Navigator.of(ctx).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context, category),
      splashColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  imgUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(kDefaultPadding),
                  color: Colors.black38,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
