import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/page/home/item.dart';
import 'package:flutter_app/page/common/common.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Home();
}

class _Home extends State<Home> {
  List myitem;
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Widget build(BuildContext context) {
    if(myitem==null){
      return load();
    }
    return new MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          child: new GridView.count(
              primary: false,
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              padding: const EdgeInsets.all(8.0),
              children: getall()),
        ),
      ),
    ));
  }


  void getHttp() async {
    List item = new List();
    Response response;
    response = await Dio().get("https://www.achaonihao.com/SafeTraining/itemlist.php");
    item.add(json.decode(response.data));
    print(item);
    setState(() {
      myitem = item;
    });
  }

  List<Widget> getall() {
    List<Widget> widgetList = new List();
    for (int i = 0; i < myitem[0].length; i++) {
      widgetList.add(Item(id: i, all: myitem));
    }
    return widgetList;
  }
}
