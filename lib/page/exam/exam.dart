import 'package:flutter/material.dart';
import 'package:flutter_app/page/exam/question.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
class Exam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Exam();
}

class _Exam extends State<Exam> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Select(name: "听力防护",id:"0"),
                ),
                Expanded(
                  child: Select(name: "呼吸防护",id:"1"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Select(name: "眼面防护",id:"2"),
                ),
                Expanded(
                  child: Select(name: "消防救援防护",id:"3"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Select(name: "粉尘作业防护",id:"4"),
                ),
                Expanded(
                  child: Select(name: "火灾爆炸防护",id:"5"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Select(name: "建筑工程防护",id:"6"),
                ),
                Expanded(
                  child: Select(name: "化工安全防护",id:"7"),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class Select extends StatelessWidget {
  Select({Key key, this.name,this.id}) : super(key: key);
  final String name;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap:(){
         getexam(context);
        },
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white,),
          ),
        ),
      ),
      color: Colors.blue,
      height: 70.0,
      margin: const EdgeInsets.all(45.0),
    );
  }
  void getexam(context) async{
    Response response = await Dio().post(
        "https://www.achaonihao.com/SafeTraining/database/examlist.php",
        data: {'sort': id});
   var exam=json.decode(response.data);
   Navigator.push(
     context,
      MaterialPageRoute(
                  builder: (context) => Question(exam: exam,)));
  }
}
