import 'package:flutter/material.dart';
import 'package:flutter_catalogue/Widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days of flutter $name!"),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
