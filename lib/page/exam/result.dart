import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_app/page/exam/question.dart';
import 'package:flutter_app/page/common/common.dart';
class Result extends StatefulWidget {
  Result({Key key,this.result,this.exam_id}):super(key:key);
  final result;
  final exam_id;
  @override
  _Result createState() => _Result();
}

class _Result extends State<Result> {
  List myexam=[];
  @override
  void initState(){
    super.initState();
    setState(() {
      get_result(widget.exam_id[0]);
    });
  }
  Widget build(BuildContext context) {
    //print(myexam[0]['exam'].isEmpty);
    if(myexam.isEmpty)return load();
    else{
      return Column(   
        children: <Widget>[
          Card(
            child: GridView.count(
              primary: false,
              crossAxisCount: 5,
              padding: const EdgeInsets.all(15.0),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: show_result(),
              shrinkWrap: true
           ), 
          ),  
          Expanded(
            child: Card(   
              child: ListView(
                padding: EdgeInsets.all(20.0),          
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Center(                   
                    child: Text("${myexam[0]['exam']}",style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                  Choose(choose: "A.",char: myexam[0]['A'],),
                  Choose(choose: "B.",char: myexam[0]['B'],),
                  Choose(choose: "C.",char: myexam[0]['C'],),
                  Choose(choose: "D.",char: myexam[0]['D'],),
                  Container(
                    margin: EdgeInsets.all(15.0),                
                    child: Text("正确答案:${myexam[0]['answer']}",style:TextStyle(fontSize: 20.0)),
                  ),
                ],
            ),
            ) ,
          )       
        ],
    );
    }
  }
  List<Widget> show_result(){
    List<Widget> result=[];
    for(var i=0;i<10;i++){
      var mycolor=widget.result[i]?Colors.green[100]:Colors.red[100];
      var bordercolor=widget.result[i]?Colors.green[300]:Colors.red[300];
      var one=GestureDetector(
        onTap:(){
          get_result(widget.exam_id[i]);
        },
        child:Container(
        decoration: BoxDecoration(
          shape:BoxShape.circle,
          border: Border.all(color:bordercolor,width: 1.0),
          color:mycolor,
        ),
        child: Center(
          child: Text("${i+1}",style: TextStyle(decoration: TextDecoration.none,color: bordercolor),),
        )
        ) ,
      );
      result.add(one);
    }
    return result;
  }
  get_result(i) async{
    Response response=await Dio().post("https://www.achaonihao.com/SafeTraining/database/getexam.php",data: {
      'id':i,
    });
    setState(() {
      myexam=[jsonDecode(response.data)];
    });
  }
}
