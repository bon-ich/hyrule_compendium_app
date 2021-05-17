import 'package:flutter/material.dart';
import 'package:hyrule_compendium_app/functions.dart';
import 'package:hyrule_compendium_app/screens/category_screens/item_detail_screen.dart';

import '../../constants.dart';
import 'item_type_text.dart';

class Item extends StatelessWidget {
  final item;

  Item(this.item);

  void _selectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ItemDetailScreen.routeName, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectItem(context),
      splashColor: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: ListTile(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getCapitalizedString(item.name),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    item.category == ItemCategory.EQUIPMENT ||
                            item.category == ItemCategory.CREATURES
                        ? ItemTypeText(item)
                        : Text("")
                  ]),
              subtitle: Text(
                item.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
