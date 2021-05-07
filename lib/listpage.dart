import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Dart:async';
import 'showtext.dart';

import 'db.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListPage List"),
        ),
        body: SingleChildScrollView(child: NewListPage()),
      ),
    );
  }
}

class NewListPage extends StatefulWidget {
  @override
  _NewListPagetate createState() => _NewListPagetate();
}

class _NewListPagetate extends State<NewListPage> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  bool isloading = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 700,
          width: double.infinity,
          child: StreamBuilder(
            stream: MyDatabase().watchAllanswers(),
            builder: (context, AsyncSnapshot<List<Answer>> snapshot) {
              return snapshot == null
                  ? Container()
                  : ListView.builder(
                itemBuilder: (_, index) {
                  return Card(
                    color: Colors.orangeAccent,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        radius: 20,
                      ),
                      title: Text(snapshot.data[index].naiyo),
                      subtitle: Text("Rs. ${snapshot.data[index].naiyo}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () {
                          setState(() {
                            MyDatabase().deleteanswer(snapshot.data[index]);
                          });
                        },
                        color: Colors.red,
                        ),
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:(context)=> ShowText(
                                  filePath:'a',
                                )
                            )
                        );
                      }
                    ),
                  );
                },
                itemCount: snapshot.data?.length ?? 0,//null対応済

              );
            },
          ),
        )
      ],
    );
  }
}
