import 'package:flutter/material.dart';
import 'package:flutter_catalogue/Widgets/drawer.dart';
import 'package:flutter_catalogue/Widgets/item_widgets.dart';
import 'package:flutter_catalogue/models/catalogue.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

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
