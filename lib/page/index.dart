import 'package:flutter/material.dart';
import 'package:flutter_app/page/exam/exam.dart';
import 'package:flutter_app/page/home/home.dart';
import 'package:flutter_qrscaner/flutter_qrscaner.dart';
import 'package:flutter_app/page/home/detail.dart';
class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Index();
}
class _Index extends State<Index>{
  
  int _currentindex=0;
  List<Widget> _pageList=[
    new Home(),
    new Exam(),
  ];
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home:Scaffold(
        appBar: new AppBar(
          title: new Text("安防通"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            new IconButton(icon:new Icon(Icons.search,color: Colors.white,),),
            new IconButton(icon:new Icon(Icons.scatter_plot,color: Colors.white,),onPressed:(){qrscan();},),
          ],
        ),
        body: _pageList[_currentindex],
        bottomNavigationBar:new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,          
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.ac_unit,),
              title: new Text("主页",style: TextStyle(color: Colors.black),),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.satellite,),
              title: new Text("题目",style:TextStyle(color:Colors.black)),
            ),
            new BottomNavigationBarItem(
              icon:new Icon(Icons.screen_share,),
              title: new Text("场景",style: TextStyle(color: Colors.black),)
            ),
            new BottomNavigationBarItem(
              icon:new Icon(Icons.person,),
              title: new Text("我的",style: TextStyle(color: Colors.black),)
            ),
          ],
          onTap: ontap,
          currentIndex: _currentindex
        ),
      )
    );
  }
  @override
  void ontap(int index){
    setState(() {
      _currentindex=index;      
    });
  }
  qrscan(){
    FlutterQrscaner.startScan().then((value) {        
      //print(value);
      if(int.parse(value)>28){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>new Scaffold(
          appBar: new AppBar(
          title: new Text("物品详情"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ) ,
        body: Detail(id:value),
        ))
      );
      }
    
    });
  }
}