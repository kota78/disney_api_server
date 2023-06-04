/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Attraction extends _i1.TableRow {
  Attraction({
    int? id,
    required this.name,
    required this.description,
    required this.openingDate,
  }) : super(id);

  factory Attraction.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Attraction(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      openingDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['openingDate']),
    );
  }

  static final t = AttractionTable();

  String name;

  String description;

  DateTime openingDate;

  @override
  String get tableName => 'attraction';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'openingDate': openingDate,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'openingDate': openingDate,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'openingDate': openingDate,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'description':
        description = value;
        return;
      case 'openingDate':
        openingDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Attraction>> find(
    _i1.Session session, {
    AttractionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Attraction>(
      where: where != null ? where(Attraction.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Attraction?> findSingleRow(
    _i1.Session session, {
    AttractionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Attraction>(
      where: where != null ? where(Attraction.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Attraction?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Attraction>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AttractionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Attraction>(
      where: where(Attraction.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Attraction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Attraction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Attraction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AttractionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Attraction>(
      where: where != null ? where(Attraction.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AttractionExpressionBuilder = _i1.Expression Function(AttractionTable);

class AttractionTable extends _i1.Table {
  AttractionTable() : super(tableName: 'attraction');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final description = _i1.ColumnString('description');

  final openingDate = _i1.ColumnDateTime('openingDate');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        openingDate,
      ];
}

@Deprecated('Use AttractionTable.t instead.')
AttractionTable tAttraction = AttractionTable();
