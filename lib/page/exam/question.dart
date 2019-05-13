import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_app/page/exam/result.dart';
class Question extends StatefulWidget {
  Question({Key key, this.exam}) : super(key: key);
  final List exam;
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int sort=0;
  List <List>check=[
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top:50.0,bottom: 50.0,left: 40.0,right: 40.0),
      child:Container(
        color: Colors.white,
        alignment: Alignment.center,
        child:ListView(  
        children: <Widget>[
         Column(
            children: <Widget>[
              Choose(choose: "",char: widget.exam[sort]['exam'],),             
              Choose(choose: "A.",char: widget.exam[sort]['A'],),
              Choose(choose: "B.",char: widget.exam[sort]['B'],),
              Choose(choose: "C.",char: widget.exam[sort]['C'],),
              Choose(choose: "D.",char: widget.exam[sort]['D'],),    
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Cb(check:check[sort],id:0),
                    Cb(check:check[sort],id:1),
                    Cb(check:check[sort],id:2),
                    Cb(check:check[sort],id:3),
                  ],
                ),
                     
            ],
          ),
     
        Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Icon(Icons.navigate_before,size: 50.0,),
                  onTap: (){
                    if(sort==0)return;
                    setState(() {
                      sort--;    
                    });
                  },
                ),
              ),
              Expanded(
                  child: Offstage(
                    offstage: (sort!=9),
                    child: MaterialButton(
                      child: Text("提交",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      minWidth: 100.0,
                      color: Colors.red,
                      onPressed: subexam,
                    ),
                  )
              ),
              Expanded(               
                child:GestureDetector(
                  child: Icon(Icons.navigate_next,size: 50.0,),
                  onTap:(){
                    if(sort==9){return;}
                    setState(() {
                      sort++;                
                    });
                  }
                )
              )
            ],
          ), 
        ) ,
      ],
      )
      )
    );
  }
  //提交答案
  subexam() async{
    List idlist=[];
    for(var i=0;i<10;i++){
      idlist.add(widget.exam[i]['id']);
    }
    Response response = await Dio().post(
        "https://www.achaonihao.com/SafeTraining/database/checkexam.php",
        data: {'exam_id':idlist,'check':check});
     print(response.data);
     Navigator.pop(context);
     Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => Result(result: jsonDecode(response.data)[0],exam_id: jsonDecode(response.data)[1]))
     );
  }
}
class Choose extends StatelessWidget{
  Choose({Key key, this.choose,this.char}) : super(key: key);
  final String choose;
  final String char;
  Widget build(BuildContext context) {
    var flag=(char=="")?true:false;
    return Offstage(
      offstage: flag,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7.0))
        ),
        width: double.infinity,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        child: Text(choose+char,style: TextStyle(fontSize: 20.0,color: Colors.white,decoration: TextDecoration.none),),
      ),
    );
  }
}
class Cb extends StatefulWidget {
  Cb({Key key, this.check,this.id}) : super(key: key);
  List check;
  int id;
  @override
  _CbState createState() => _CbState();
}

class _CbState extends State<Cb> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.check[widget.id],
      onChanged: (bool){
        setState((){
          widget.check[widget.id]=bool;
        });
      },
    );
  }
}

