import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/page/index.dart';
void main() => runApp(new MyApp()); 
class MyApp extends StatelessWidget { 
   @override Widget build(BuildContext context) { 
     return new MaterialApp( 
       title: 'Flutter Demo', 
       home: new Index(), // 指定去加载 Index页面。
    ); 
  } 
}
