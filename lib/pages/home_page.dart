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
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items != null && CatalogueModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogueModel.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemWidget(
                    item: CatalogueModel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: Mydrawer(),
    );
  }
}
