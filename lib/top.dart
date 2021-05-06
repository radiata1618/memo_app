import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'listpage.dart';
import 'addpage.dart';

class Top extends StatelessWidget{
  Top({Key key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          title:Text("Top"),
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("item1"),
              SizedBox(
                width:130,
                height:50,
                child:ElevatedButton.icon(
                  style:ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlue),
                      foregroundColor:MaterialStateProperty.all<Color>(Colors.white)
                  ),
                    label:Text('リストへ'),
                    icon:Icon(Icons.view_headline_outlined),
                  // <- 追加：メッセージの設定
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:(context)=> ListPage(
                            )
                        )
                    )
                  },),
              ),
              Text("item2"),
              SizedBox(
                width:130,
                height:50,
                child:ElevatedButton.icon(
                    style:ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlue),
                        foregroundColor:MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    label:Text('登録'),
                    icon:Icon(Icons.add_box_outlined),
                  // <- 追加：メッセージの設定
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:(context)=> AddPage(
                            )
                        )
                    )
                  },),
              ),
            ],
          ),
        )
    );

  }

}