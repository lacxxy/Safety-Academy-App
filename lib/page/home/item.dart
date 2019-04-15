import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/page/exam.dart';
import 'package:flutter_app/page/home/detail.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class Item extends StatelessWidget {
  Item({Key key, this.id, this.all}) : super(key: key);
  final int id;
  final List all;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //getpdf();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(id: all[0][id]['id'])));
        },
        child: new Card(
          elevation: 4.0,
            child: new Column(
          children: <Widget>[
            Expanded(
              child: new Image.network(
                all[0][id]['pic'],
                fit: BoxFit.cover,
              ),
            ),
            new Text(
              all[0][id]['name'],
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        )));
  }

  void getpdf() async {
    Response response = await Dio().post(
        "https://www.achaonihao.com/test/pdf_show.php",
        data: {'item_id': 0});
    List t = new List();
    t.add(json.decode(response.data));
    print(t[0]['pdf']);
  }
}
