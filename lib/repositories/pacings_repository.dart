import 'dart:convert';

import '../models/pacing_model.dart';
import 'database_repository.dart';

class PacingsRepository {
  final DatabaseRepository databaseRepository;

  const PacingsRepository({
    required this.databaseRepository,
  });

  Future<PacingModel> add(PacingModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    final now = DateTime.now();
    final model = entity.copyWith(createdDate: now, modifiedDate: now);
    final db = await databaseRepository.database;
    final serializedEntity = _toDatabase(model);
    final id = await db.insert(DatabaseRepository.pacingsTable, serializedEntity);

    return model.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.delete(
      DatabaseRepository.pacingsTable,
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [id],
    );
  }

  Future<void> edit(PacingModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.update(
      DatabaseRepository.pacingsTable,
      _toDatabase(model),
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [entity.id!],
    );
  }

  Future<PacingModel?> get(int id) async {
    final db = await databaseRepository.database;
    final items = await db.query(
      DatabaseRepository.pacingsTable,
      where: "${DatabaseRepository.idField} = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return _fromDatabase(items.first);
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final items = await db.query(
      DatabaseRepository.pacingsTable,
      offset: skip,
      limit: take,
      orderBy: "${DatabaseRepository.modifiedDateField} DESC",
    );

    return items.map(((e) => _fromDatabase(e))).toList();
  }

  PacingModel _fromDatabase(Map<String, dynamic> json) {
    final newValues = Map<String, dynamic>.from(json);
    newValues.update(DatabaseRepository.improvisationsField, (value) => jsonDecode(value));
    newValues.update(DatabaseRepository.enablePaddingDurationField, (value) => value == 1);
    return PacingModel.fromJson(newValues);
  }

  Map<String, dynamic> _toDatabase(PacingModel model) {
    final items = model.toJson();
    items[DatabaseRepository.improvisationsField] = jsonEncode(items[DatabaseRepository.improvisationsField]);
    items[DatabaseRepository.enablePaddingDurationField] = model.enablePaddingDuration ? 1 : 0;
    return items;
  }
}
