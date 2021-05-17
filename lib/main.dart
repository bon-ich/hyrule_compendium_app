import 'package:flutter/material.dart';
import 'package:hyrule_compendium_app/screens/category_screens/item_detail_screen.dart';

import './screens/category_screens/category_equipment_screen.dart';
import './screens/category_screens/category_materials_screen.dart';
import './screens/category_screens/category_monster_screen.dart';
import './screens/category_screens/category_creatures_screen.dart';
import './screens/category_screens/category_treasures_screen.dart';

import './screens/categories_screen.dart';
import './screens/test_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hyrule Compendium",
      theme: ThemeData(
          fontFamily: "Quicksand",
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          canvasColor: kBackgroundColor),
      routes: {
        "/": (ctx) => CategoriesScreen(),
        "/test": (ctx) => TestScreen(),
        TreasuresCategoryScreen.routeName: (ctx) => TreasuresCategoryScreen(),
        CreaturesCategoryScreen.routeName: (ctx) => CreaturesCategoryScreen(),
        EquipmentCategoryScreen.routeName: (ctx) => EquipmentCategoryScreen(),
        MaterialsCategoryScreen.routeName: (ctx) => MaterialsCategoryScreen(),
        MonstersCategoryScreen.routeName: (ctx) => MonstersCategoryScreen(),
        // ItemDetailScreen.routeName: (ctx) => ItemDetailScreen()
      },
      onGenerateRoute: (settings) {
        if (settings.name == ItemDetailScreen.routeName) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ItemDetailScreen(args);
          });
        }
      },
    );
  }
}
