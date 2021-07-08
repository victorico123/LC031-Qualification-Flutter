import 'package:flutter/material.dart';
import 'package:qualification/utils/global.dart' as gb;
import 'package:qualification/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: gb.darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
        home: LoginPage());
  }
}
