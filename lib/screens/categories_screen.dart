import 'package:flutter/material.dart';

import '../constants.dart';
import 'components/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hyrule Compendium"),
      ),
      body: ListView(
        children: [
          CategoryItem(
            title: "Creatures",
            category: ItemCategory.CREATURES,
            imgUrl:
                "https://botw-compendium.herokuapp.com/api/v2/entry/water_buffalo/image",
          ),
          CategoryItem(
              title: "Equipment",
              category: ItemCategory.EQUIPMENT,
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/guardian_sword/image"),
          CategoryItem(
              title: "Materials",
              category: ItemCategory.MATERIALS,
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/rushroom/image"),
          CategoryItem(
              title: "Monsters",
              category: ItemCategory.MONSTERS,
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/moblin/image"),
          CategoryItem(
              title: "Treasures",
              category: ItemCategory.TREASURES,
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/treasure_chest/image")
        ],
      ),
    );
  }
}
