import 'package:flutter/material.dart';
import 'package:flutter_tab/Controller/HomeController.dart';
import 'package:flutter_tab/View/PageOne.dart';
import 'package:flutter_tab/View/PageTwo.dart';
import 'package:flutter_tab/View/PageThree.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeController(),
      routes: <String, WidgetBuilder>{
        'tab1': (_) => PageOne(),
        'tab2': (_) => PageTwo('b', 'c'),
        'tab3': (_) => PageThree(),
      },
    );
  }
}
