import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/treasure.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
        title: Text("Test"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Column(
              children: [
                Text(_treasures[index].id.toString()),
                Text(_treasures[index].name),
                Text(_treasures[index].imageUrl),
                Text("drops: " + _treasures[index].drops.length.toString()),
                Text(_treasures[index].description),
                Text("common locations: " +
                    _treasures[index].commonLocations.length.toString()),
              ],
            ),
          );
        },
        itemCount: _treasures.length,
      ),
    );
  }
}
