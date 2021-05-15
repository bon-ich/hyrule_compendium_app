import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hyrule_compendium_app/models/creatures.dart';
import 'package:hyrule_compendium_app/screens/components/item.dart';

class CreaturesCategoryScreen extends StatefulWidget {
  static const routeName = "/category-creatures";

  @override
  _CreaturesCategoryScreenState createState() =>
      _CreaturesCategoryScreenState();
}

class _CreaturesCategoryScreenState extends State<CreaturesCategoryScreen> {
  var _creatures = <Creature>[];
  var data;

  Future<List<Creature>> fetchCreatures() async {
    var response = await http.get(Uri.https(
        "botw-compendium.herokuapp.com", "/api/v2/category/creatures"));
    var creatures = <Creature>[];
    // var dataJson;

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body)["data"];
      print(dataJson);
      for (var f in dataJson["food"]) {
        Creature cr = Creature.fromJson(f);
        cr.isFood = true;
        creatures.add(cr);
      }
      for (var n in dataJson["non_food"]) {
        Creature cr = Creature.fromJson(n);
        cr.isFood = false;
        creatures.add(cr);
      }
    }
    return creatures;
  }

  @override
  void initState() {
    super.initState();
    fetchCreatures().then((value) {
      setState(() {
        _creatures.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creatures"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Item(_creatures[index]);
        },
        itemCount: _creatures.length,
      ),
    );
  }
}
