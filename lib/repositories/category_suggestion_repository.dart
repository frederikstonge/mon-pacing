import 'package:isar/isar.dart';

import '../models/category_suggestion_model.dart';
import 'database_repository.dart';

class CategorySuggestionRepository {
  final DatabaseRepository databaseRepository;

  const CategorySuggestionRepository({
    required this.databaseRepository,
  });

  Future<void> add(String category) async {
    final db = await databaseRepository.database;
    final shouldAdd = category.isNotEmpty && db.categorySuggestionModels.where().nameEqualTo(category).isEmpty();
    if (shouldAdd) {
      final id = db.categorySuggestionModels.autoIncrement();
      final now = DateTime.now();
      final model = CategorySuggestionModel(id: id, name: category, createdDate: now, modifiedDate: now);
      await db.writeAsync((isar) {
        isar.categorySuggestionModels.put(model);
      });
    }
  }

  Future<List<CategorySuggestionModel>> search(String search, int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.categorySuggestionModels.where().nameContains(search, caseSensitive: false).findAllAsync(offset: skip, limit: take);
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.categorySuggestionModels.delete(id));
  }
}
