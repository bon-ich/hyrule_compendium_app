import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/item.dart';

import '../../models/monster.dart';

class MonstersCategoryScreen extends StatefulWidget {
  static const routeName = "/category-monsters";

  @override
  _MonstersCategoryScreenState createState() => _MonstersCategoryScreenState();
}

class _MonstersCategoryScreenState extends State<MonstersCategoryScreen> {
  var _monsters = <Monster>[];

  Future<List<Monster>> fetchMonsters() async {
    var response = await http.get(Uri.https(
        "botw-compendium.herokuapp.com", "/api/v2/category/monsters"));

    var monsters = <Monster>[];

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body)["data"];
      for (var d in dataJson) {
        monsters.add(Monster.fromJson(d));
      }
      return monsters;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMonsters().then((value) => setState(() {
          _monsters.addAll(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Monsters"),
        ),
        body: ListView.builder(
            itemCount: _monsters.length,
            itemBuilder: (ctx, index) {
              return Item(_monsters[index]);
            }));
  }
}
