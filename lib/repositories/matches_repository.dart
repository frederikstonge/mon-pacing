import 'dart:convert';

import '../models/match_model.dart';
import 'database_repository.dart';

class MatchesRepository {
  final DatabaseRepository databaseRepository;

  const MatchesRepository({
    required this.databaseRepository,
  });

  Future<MatchModel> add(MatchModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    final now = DateTime.now();
    final model = entity.copyWith(createdDate: now, modifiedDate: now);
    final db = await databaseRepository.database;
    final serializedEntity = _toDatabase(model);
    final id = await db.insert(DatabaseRepository.matchesTable, serializedEntity);

    return model.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.delete(
      DatabaseRepository.matchesTable,
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [id],
    );
  }

  Future<void> edit(MatchModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.update(
      DatabaseRepository.matchesTable,
      _toDatabase(model),
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [entity.id!],
    );
  }

  Future<MatchModel?> get(int id) async {
    final db = await databaseRepository.database;
    final items = await db.query(
      DatabaseRepository.matchesTable,
      where: "${DatabaseRepository.idField} = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return _fromDatabase(items.first);
  }

  Future<List<MatchModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final items = await db.query(
      DatabaseRepository.matchesTable,
      offset: skip,
      limit: take,
      orderBy: "${DatabaseRepository.modifiedDateField} DESC",
    );

    return items.map(((e) => _fromDatabase(e))).toList();
  }

  MatchModel _fromDatabase(Map<String, dynamic> json) {
    final newValues = Map<String, dynamic>.from(json);
    newValues.update(DatabaseRepository.improvisationsField, (value) => jsonDecode(value));
    newValues.update(DatabaseRepository.teamsField, (value) => jsonDecode(value));
    newValues.update(DatabaseRepository.penaltiesField, (value) => jsonDecode(value));
    newValues.update(DatabaseRepository.pointsField, (value) => jsonDecode(value));

    return MatchModel.fromJson(newValues);
  }

  Map<String, dynamic> _toDatabase(MatchModel model) {
    final items = model.toJson();
    items[DatabaseRepository.improvisationsField] = jsonEncode(items[DatabaseRepository.improvisationsField]);
    items[DatabaseRepository.teamsField] = jsonEncode(items[DatabaseRepository.teamsField]);
    items[DatabaseRepository.penaltiesField] = jsonEncode(items[DatabaseRepository.penaltiesField]);
    items[DatabaseRepository.pointsField] = jsonEncode(items[DatabaseRepository.pointsField]);

    return items;
  }
}
