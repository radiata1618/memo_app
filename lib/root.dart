import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'top.dart';
import 'listpage.dart';
import 'addpage.dart';

class Root extends StatefulWidget {
  Root({Key key}) :super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root>{
  String currentScreenId = 'top';
  String currentScreenSubId1 = '';
  String currentScreenSubId2 = '';


  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    if(currentScreenId=='top') {
      return Scaffold(body: Top());
    }else if(currentScreenId=='listPage'){
      return Scaffold(body: ListPage());
    }else{
      return Scaffold(body: AddPage());
    }
  }
}