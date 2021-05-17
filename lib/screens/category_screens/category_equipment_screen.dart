import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hyrule_compendium_app/models/equipment.dart';
import 'package:hyrule_compendium_app/screens/components/item.dart';

class EquipmentCategoryScreen extends StatefulWidget {
  static const routeName = "/category-equipment";

  @override
  _EquipmentCategoryScreenState createState() =>
      _EquipmentCategoryScreenState();
}

class _EquipmentCategoryScreenState extends State<EquipmentCategoryScreen> {
  var _equipment = <Equipment>[];

  Future<List<Equipment>> fetchEquipment() async {
    var response = await http.get(Uri.https(
        "botw-compendium.herokuapp.com", "/api/v2/category/equipment"));
    var equipment = <Equipment>[];

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body)["data"];
      for (var d in dataJson) {
        equipment.add(Equipment.fromJson(d));
      }
    }
    return equipment;
  }

  @override
  void initState() {
    super.initState();
    fetchEquipment().then((value) {
      setState(() {
        print(_equipment.length);
        _equipment.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipment"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Item(_equipment[index]);
        },
        itemCount: _equipment.length,
      ),
    );
  }
}
