import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/page/home/pdf.dart';
import 'package:flutter_app/page/common/common.dart';
class Detail extends StatefulWidget {
  Detail({Key key, this.id}) : super(key: key);
  final id;
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  String name;
  String pic;
  String descrip;
  String env;
  String property;
  String pdf;
  @override
  void initState() {
    super.initState();
    posthttp();
  }

  @override
  Widget build(BuildContext context) {
    if(name!=null){
      return Container(
      color: Colors.white,
      
      child: ListView(children: <Widget>[
        Card(
          child: Center(
          child: 
            Column(
              children: <Widget>[
                Image.network(
                  pic,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Text(name,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight:FontWeight.normal
                    )
                ),
            ),
            ],
            )
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Text(
                    "产品描述",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  descrip,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 15.0),
                child: Text(
                  "应用环境",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                child: Text(
                  env,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
                margin: EdgeInsets.all(15.0),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 15.0),
                child: Text(
                  "产品特性",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  property,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      ]),
    );
    }else{
      return load();
    }
  }

  @override
  void posthttp() async {
    List item = new List();
    Response response;
    response = await Dio()
        .post("https://www.achaonihao.com/SafeTraining/item.php", data: {
      "id": widget.id,
    });
    item.add(json.decode(response.data));
    setState(() {
      name = item[0]['name'];
      pic = item[0]['pic'];
      descrip = item[0]['descrip'];
      env = item[0]['environment'];
      property = item[0]['property'];
      pdf = item[0]['pdf'];
    });
  }
}
