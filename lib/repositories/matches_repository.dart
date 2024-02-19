import 'package:isar/isar.dart';
import '../models/match_model.dart';
import 'database_repository.dart';

class MatchesRepository {
  final DatabaseRepository databaseRepository;

  const MatchesRepository({
    required this.databaseRepository,
  });

  Future<MatchModel> add(MatchModel entity) async {
    final db = await databaseRepository.database;
    final id = db.matchModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    db.matchModels.put(model);
    return model;
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    db.matchModels.delete(id);
  }

  Future<void> edit(MatchModel entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    db.matchModels.put(model);
  }

  Future<MatchModel?> get(int id) async {
    final db = await databaseRepository.database;
    return db.matchModels.get(id);
  }

  Future<List<MatchModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return db.matchModels.where().findAll(offset: skip, limit: take);
  }
}
