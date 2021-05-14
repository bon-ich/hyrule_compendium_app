import 'package:flutter/material.dart';
import 'package:hyrule_compendium_app/constants.dart';
import 'package:hyrule_compendium_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hyrule Compendium",
      theme: ThemeData(
          fontFamily: "Quicksand",
          primaryColor: kPrimaryColor,
          canvasColor: kBackgroundColor),
      // appBarTheme: AppBarTheme(color: kPrimaryColor)),
      home: HomeScreen(),
    );
  }
}
