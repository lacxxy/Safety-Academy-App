import 'package:flutter/material.dart';

class Exam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Exam();
}
class _Exam extends State<Exam>{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home:Scaffold(
        body: Center(
          child: Container(
            child: new Text(
              "exam"
            ),
          ),
        ),
      )
    );
  }
}