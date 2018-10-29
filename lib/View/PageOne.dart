import 'package:flutter_tab/HttpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tab/Model/Photo.dart';
import 'dart:convert';

class PageOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Page();
  }
}

class Page extends State<PageOne> {
  String dataStr = "";
  String title = '';
  var _items = [];

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    HttpController.get('https://api.douban.com/v2/movie/in_theaters', (data) {
      var result = json.decode(data);
      setState(() {
        title = result['title'];
        print('title : ${title}');
        _items = result['subjects'];
      });
    });
  }

  Widget layout(BuildContext context) {
    return new Scaffold(body: loadListViewBody());
  }

  Widget loadListViewBody() {
    if (_items.length != 0) {
      return ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(_items[position], position);
          });
    } else {
      return new Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }

  Widget getItem(var subject, int index) {
    //设置分割线
    if (index.isOdd) return new Divider(height: 1.0);
    // 演员列表
    var avatars = List.generate(
      subject['casts'].length,
      (int index) => Container(
            margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
            child: CircleAvatar(
                backgroundColor: Colors.white10,
                backgroundImage:
                    NetworkImage(subject['casts'][index]['avatars']['small'])),
          ),
    );
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              subject['images']['large'],
              width: 100.0,
              height: 150.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //     电影名称
                Text(
                  subject['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  maxLines: 1,
                ),
                //     豆瓣评分
                Text(
                  '豆瓣评分：${subject['rating']['average']}',
                  style: TextStyle(fontSize: 16.0),
                ),
                //     类型
                Text("类型：${subject['genres'].join("、")}"),
                //     导演
                Text('导演：${subject['directors'][0]['name']}'),
                //     演员
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('主演：'),
                      Row(
                        children: avatars,
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
    return Card(
      child: row,
    );
  }
}
