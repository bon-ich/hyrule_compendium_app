import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyrule_compendium_app/screens/components/item.dart';

import '../../models/material.dart';

class MaterialsCategoryScreen extends StatefulWidget {
  static const routeName = "/category-materials";

  @override
  _MaterialsCategoryScreenState createState() =>
      _MaterialsCategoryScreenState();
}

class _MaterialsCategoryScreenState extends State<MaterialsCategoryScreen> {
  var _materials = <Materiall>[];

  Future<List<Materiall>> fetchMaterials() async {
    var response = await http.get(Uri.https(
        "botw-compendium.herokuapp.com", "/api/v2/category/materials"));
    var materials = <Materiall>[];

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body)["data"];
      for (var d in dataJson) {
        materials.add(Materiall.fromJson(d));
      }
    }
    return materials;
  }

  @override
  void initState() {
    super.initState();
    fetchMaterials().then((value) {
      setState(() {
        print(_materials.length);
        _materials.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materials"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Item(_materials[index]);
        },
        itemCount: _materials.length,
      ),
    );
  }
}
