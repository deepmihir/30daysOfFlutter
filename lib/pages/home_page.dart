import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalogue/Widgets/drawer.dart';
import 'package:flutter_catalogue/Widgets/item_widgets.dart';
import 'package:flutter_catalogue/models/catalogue.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogueModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
