import 'package:flutter/material.dart';

import '../../constants.dart';

class ItemTypeText extends StatelessWidget {
  final item;
  ItemTypeText(this.item);
  @override
  Widget build(BuildContext context) {
    return Text(
      item.category == ItemCategory.EQUIPMENT
          ? item.isWeapon
              ? "Weapon"
              : "Armor"
          : item.category == ItemCategory.CREATURES
              ? item.isFood
                  ? "Food"
                  : "Not food"
              : "",
      style: TextStyle(color: kItemTypeTextColor),
    );
  }
}
