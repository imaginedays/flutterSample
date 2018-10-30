import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final Color color;
  PageTwo(this.color);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('PageTwo'),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.lightBlueAccent,
            child: new Text('回去', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
