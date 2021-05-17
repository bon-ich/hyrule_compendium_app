import 'package:flutter/material.dart';

import '../../constants.dart';

class ItemCommonLocations extends StatelessWidget {
  final _locations = [];

  ItemCommonLocations(locations) {
    _locations.addAll(locations);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Common Locations",
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 18),
              ),
              for (var l in _locations)
                Text(
                  "- $l",
                  style: TextStyle(fontSize: 16),
                )
            ],
          )),
    );
  }
}
