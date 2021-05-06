import 'dart:io';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';//generated when execute "flutter packages pub run build_runner watch" in terminal

class Answers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get naiyo => text().withLength(min: 0, max: 99)();
}

@UseMoor(tables: [Answers])//add Table name
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',
      logStatements: true));

  @override
  int get schemaVersion => 1;

  Future <List<Answer>> getAllanswers()=> select(answers).get();
  Stream <List<Answer>> watchAllanswers()=> select(answers).watch();
  Future insertanswer(Answer answer)=> into(answers).insert(answer);
  Future updateanswer(Answer answer)=> update(answers).replace(answer);
  Future deleteanswer(Answer answer)=> delete(answers).delete(answer);

}