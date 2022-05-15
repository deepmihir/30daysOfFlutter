import 'package:flutter/material.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'Widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}



// in the Day 11 branch there is expanation of context tree
// there is three types of tree 1) widget tree 2)element tree 3)render tree
//1) widget tree : in which we write
//2) element tree: context of widget(location)
//3) widget tree : which draws on empty canvas