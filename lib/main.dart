import 'package:flutter/material.dart';
import 'package:flutter_tab/Controller/HomeController.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeController(),
    );
  }
}
