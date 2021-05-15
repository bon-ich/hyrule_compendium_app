import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/item.dart';

import '../../models/treasure.dart';

class TreasuresCategoryScreen extends StatefulWidget {
  static const routeName = "/category-treasures";

  @override
  _TreasuresCategoryScreenState createState() =>
      _TreasuresCategoryScreenState();
}

class _TreasuresCategoryScreenState extends State<TreasuresCategoryScreen> {
  var _treasures = <Treasure>[];

  Future<List<Treasure>> fetchTreasures() async {
    var response = await http.get(Uri.https(
        "botw-compendium.herokuapp.com", "/api/v2/category/treasure"));

    var treasures = <Treasure>[];

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body)["data"];
      for (var d in dataJson) {
        treasures.add(Treasure.fromJson(d));
      }
    }
    return treasures;
  }

  @override
  void initState() {
    super.initState();
    fetchTreasures().then((value) {
      setState(() {
        print(_treasures.length);
        _treasures.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treasures"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Item(_treasures[index]);
        },
        itemCount: _treasures.length,
      ),
    );
  }
}
