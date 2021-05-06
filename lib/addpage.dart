import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memo_app/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';


class AddPage extends StatefulWidget {
  AddPage({Key key}) :super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  String _text = '';
  var _textController = TextEditingController();


  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          title:Text("Add"),
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("メモを入力してください"),
              SizedBox(
                width:130,
                height:50,
                child:TextField(
                  enabled:true,
                  maxLength:20,
                  maxLengthEnforced:false,
                  style:TextStyle(color:Colors.red),
                  obscureText:false,
                  maxLines:1,
                  onChanged:_handleText,
                  controller: _textController,
                ),
              ),
              ElevatedButton(
                child:Text('登録'),
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlue),
                  foregroundColor:MaterialStateProperty.all<Color>(Colors.white)
                ),
                  onPressed:() {
                    Answer answer = Answer(naiyo: _textController.text);
                    print("Log:line61");
                    MyDatabase().insertanswer(answer);
                    print("Log:line63");
                  },
              ),
            ],
          ),
        )
    );

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}