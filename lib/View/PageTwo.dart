import 'package:flutter/material.dart';

var globalPicUrl;

class PageTwo extends StatelessWidget {
  final Color color;
  final String movieName;
  final String picUrl;
  PageTwo(this.color, this.movieName, this.picUrl) {
    globalPicUrl = picUrl;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('${movieName}'),
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
        child: Column(
          children: <Widget>[
            Image.network(
              globalPicUrl,
              width: 100.0,
              height: 150.0,
              fit: BoxFit.fill,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context, 'Movie');
              },
              color: Colors.lightBlueAccent,
              child: Text(
                '回去',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
