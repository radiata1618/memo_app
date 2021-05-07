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
  //Future<String> _out = '';
  String outputtext ='';
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context){

    //loadAsset().then((t) => {_out=t});
    //outputtext = loadAsset();
    loadAsset();
    print('text読み込み前'+this.outputtext);



    return Scaffold(
      appBar:AppBar(
        title:Text('問題'),
      ),
      body:Center(child:Text("${outputtext}"))
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

  void loadAsset() async {
    //UTF8
    String value=await rootBundle.loadString('assets/text/test4.txt');
    if( value==this.outputtext){
    }else {
      setState(() { //再帰呼び出しになっている。
        print('text読み込み処理' + this.outputtext);
        this.outputtext = value;
      });
    }
  }
}
