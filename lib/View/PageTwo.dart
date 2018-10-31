import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

var globalPicUrl;

class PageTwo extends StatelessWidget {
  final String movieName;
  final String picUrl;
  PageTwo(this.movieName, this.picUrl) {
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
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    print('start');
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return setUpBodyContainer();
  }

  //设置body
  Widget setUpBodyContainer() {
    return new Scaffold(
      body: new Center(
        child: Column(
          children: <Widget>[
            Text('手机当前电量${_batteryLevel}'),
            RichText(
              text: TextSpan(
                  text: '这是一段富文本',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: '粗',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '富'),
                  ]),
            ),
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
            new RaisedButton(
              onPressed: () {
                _getBatteryLevel();
              },
              child: Text('获取手机电量', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
