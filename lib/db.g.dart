// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Answer extends DataClass implements Insertable<Answer> {
  final int id;
  final String naiyo;
  Answer({@required this.id, @required this.naiyo});
  factory Answer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Answer(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      naiyo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}naiyo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || naiyo != null) {
      map['naiyo'] = Variable<String>(naiyo);
    }
    return map;
  }

  AnswersCompanion toCompanion(bool nullToAbsent) {
    return AnswersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      naiyo:
          naiyo == null && nullToAbsent ? const Value.absent() : Value(naiyo),
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Answer(
      id: serializer.fromJson<int>(json['id']),
      naiyo: serializer.fromJson<String>(json['naiyo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'naiyo': serializer.toJson<String>(naiyo),
    };
  }

  Answer copyWith({int id, String naiyo}) => Answer(
        id: id ?? this.id,
        naiyo: naiyo ?? this.naiyo,
      );
  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('id: $id, ')
          ..write('naiyo: $naiyo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, naiyo.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Answer && other.id == this.id && other.naiyo == this.naiyo);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<int> id;
  final Value<String> naiyo;
  const AnswersCompanion({
    this.id = const Value.absent(),
    this.naiyo = const Value.absent(),
  });
  AnswersCompanion.insert({
    this.id = const Value.absent(),
    @required String naiyo,
  }) : naiyo = Value(naiyo);
  static Insertable<Answer> custom({
    Expression<int> id,
    Expression<String> naiyo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (naiyo != null) 'naiyo': naiyo,
    });
  }

  AnswersCompanion copyWith({Value<int> id, Value<String> naiyo}) {
    return AnswersCompanion(
      id: id ?? this.id,
      naiyo: naiyo ?? this.naiyo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (naiyo.present) {
      map['naiyo'] = Variable<String>(naiyo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswersCompanion(')
          ..write('id: $id, ')
          ..write('naiyo: $naiyo')
          ..write(')'))
        .toString();
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  final GeneratedDatabase _db;
  final String _alias;
  $AnswersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _naiyoMeta = const VerificationMeta('naiyo');
  GeneratedTextColumn _naiyo;
  @override
  GeneratedTextColumn get naiyo => _naiyo ??= _constructNaiyo();
  GeneratedTextColumn _constructNaiyo() {
    return GeneratedTextColumn('naiyo', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  @override
  List<GeneratedColumn> get $columns => [id, naiyo];
  @override
  $AnswersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'answers';
  @override
  final String actualTableName = 'answers';
  @override
  VerificationContext validateIntegrity(Insertable<Answer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('naiyo')) {
      context.handle(
          _naiyoMeta, naiyo.isAcceptableOrUnknown(data['naiyo'], _naiyoMeta));
    } else if (isInserting) {
      context.missing(_naiyoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Answer map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Answer.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AnswersTable _answers;
  $AnswersTable get answers => _answers ??= $AnswersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [answers];
}
