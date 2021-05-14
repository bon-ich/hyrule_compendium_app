import 'package:flutter/material.dart';

import '../constants.dart';

import 'components/category_item.dart';

class HomeScreen extends StatelessWidget {
  // AppBar appBar() {
  //   return AppBar(
  //     title: Text("Hyrule Compendium"),
  //     backgroundColor: Theme.of(context).primaryColor,
  //   );
  // }

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
            imgUrl:
                "https://botw-compendium.herokuapp.com/api/v2/entry/water_buffalo/image",
          ),
          CategoryItem(
              title: "Equipment",
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/guardian_sword/image"),
          CategoryItem(
              title: "Materials",
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/rushroom/image"),
          CategoryItem(
              title: "Monsters",
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/moblin/image"),
          CategoryItem(
              title: "Treasures",
              imgUrl:
                  "https://botw-compendium.herokuapp.com/api/v2/entry/ore_deposit/image")
        ],
      ),
    );
  }
}
