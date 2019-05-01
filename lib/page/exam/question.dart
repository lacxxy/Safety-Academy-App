import 'package:flutter/material.dart';
import 'dart:convert';
class Question extends StatefulWidget {
  Question({Key key, this.exam}) : super(key: key);
  final List exam;
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int sort=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:50.0,bottom: 50.0,left: 40.0,right: 40.0),
      child:Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
          child: Column(
            children: <Widget>[
              Choose(choose: "",char: widget.exam[sort]['exam'],),
              
              Choose(choose: "A.",char: widget.exam[sort]['A'],),
              Choose(choose: "B.",char: widget.exam[sort]['B'],),
              Choose(choose: "C.",char: widget.exam[sort]['C'],),
              Choose(choose: "D.",char: widget.exam[sort]['D'],),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top:80.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Icon(Icons.navigate_before,size: 50.0,),
              ),
              Expanded(
                child:Icon(Icons.navigate_next,size: 50.0,),
              )
            ],
          ), 
        ) 
      ],
      )
    );
  }
}
class Choose extends StatelessWidget{
  Choose({Key key, this.choose,this.char}) : super(key: key);
  final String choose;
  final String char;
  Widget build(BuildContext context) {
    var flag=(char=="")?true:false;
    return Container(
      margin: const EdgeInsets.all(15.0),
      child:Offstage(
        offstage: flag,
        child:Text(choose+char,style: TextStyle(fontSize: 25.0),),
      )
    );
  }
}
