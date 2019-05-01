import 'package:flutter/material.dart';
class load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("正在加载",style: TextStyle(fontSize: 20.0,decoration: TextDecoration.none,color: Colors.black,fontWeight:FontWeight.normal),),
          ],
        )),
    );
  }
}