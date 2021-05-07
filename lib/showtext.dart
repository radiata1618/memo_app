import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ShowText extends StatefulWidget{
  String filePath;

  @override
  _ShowTextState createState()=>_ShowTextState();


  ShowText({String filePath}){
    this.filePath=filePath;
  }

}


class _ShowTextState extends State<ShowText>{
  String _out = '';

  @override
  Widget build(BuildContext context){

    loadAsset().then((t) => {_out=t});

    print(_out);

    return Scaffold(
      appBar:AppBar(
        title:Text('問題'),
      ),
      body:Center(child:Text(_out))
    );


  }

  /*
  //ファイルの読み込みと変数への格納処理
  Future<String> loadButton() async {
    setState(() {
      load().then((String value) {
        setState(() {
          print(value);
          _out = value;
        });
      });
    });
    return _out;
  }

  Future<String> load() async {
    final file = await getFilePath();
    return file.readAsString();
  }

  //テキストファイルを保存するパスを取得する
  Future<File> getFilePath() async {
    return File('assets/text/test.txt');
  }
  */


  Future<String> loadAsset() async {
    //UTF8
    return rootBundle.loadString('assets/text/test4.txt');
  }
}