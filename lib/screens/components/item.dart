import 'package:flutter/material.dart';

import '../../constants.dart';

class Item extends StatelessWidget {
  final item;

  Item(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              title: Text(getCapitalizedString(item.name)),
              subtitle: Text(item.description),
            ),
          ),
        ),
      ),
    );
  }

  String getCapitalizedString(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }
}
