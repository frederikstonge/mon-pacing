import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import '../models/pacing_model.dart';
import 'app_database.dart';
import 'legacy_database_repository.dart';

class PacingsRepository {
  final LegacyDatabaseRepository databaseRepository;
  final AppDatabase appDatabase;

  const PacingsRepository({
    required this.databaseRepository,
    required this.appDatabase,
  });

  Future<PacingModel> add(PacingModel entity) async {
    final db = await databaseRepository.database;
    final id = db.pacingModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.pacingModels.put(model));
    return model;
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.pacingModels.delete(id));
  }

  Future<void> edit(PacingModel entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.pacingModels.put(model));
  }

  Future<PacingModel?> get(int id) async {
    final response = await appDatabase.managers.pacingEntity
        .withReferences((p) => p(improvisationEntityRefs: true))
        .filter((p) => p.id.equals(id))
        .getSingleOrNull();

    final pacing = response?.$1;
    final improvisations = response?.$2.improvisationEntityRefs.prefetchedData;

    final pacingTags = await response?.$2.pacingTagEntityRefs.withReferences((p) => p(tag: true)).get();
    final tags = pacingTags?.map((t) => t.$2.tag.prefetchedData).selectMany<TagEntityData>((t) => t ?? []);

    if (pacing == null || improvisations == null || tags == null) return null;
    return PacingModel.fromEntity(pacing, improvisations, tags.toList());
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    final List<PacingModel> pacings = [];
    final response = await appDatabase.managers.pacingEntity
        .withReferences((p) => p(improvisationEntityRefs: true))
        .orderBy((p) => p.createdDate.desc())
        .get(offset: skip, limit: take);

    for (final pacingResponse in response) {
      final pacing = pacingResponse.$1;
      final improvisations = pacingResponse.$2.improvisationEntityRefs.prefetchedData ?? [];

      final pacingTags = await pacingResponse.$2.pacingTagEntityRefs.withReferences((p) => p(tag: true)).get();
      final tags = pacingTags.map((t) => t.$2.tag.prefetchedData).selectMany<TagEntityData>((t) => t ?? []);

      pacings.add(PacingModel.fromEntity(pacing, improvisations, tags.toList()));
    }

    return pacings;
  }

  Future<List<PacingModel>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;

    return await db.pacingModels
        .where()
        .optional(selectedTags.isNotEmpty, (q) => q.anyOf(selectedTags, (sq, t) => sq.tagsElementEqualTo(t)))
        .and()
        .optional(
          search.isNotEmpty,
          (q) => q.group(
            (g) => g
                .nameContains(search, caseSensitive: false)
                .or()
                .categoriesElementContains(search, caseSensitive: false)
                .or()
                .themesElementContains(search, caseSensitive: false),
          ),
        )
        .sortByCreatedDateDesc()
        .findAllAsync();
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final tags = await db.pacingModels.where().optional(query.isNotEmpty, (q) => q.tagsElementContains(query)).tagsProperty().findAllAsync();
    return tags.selectMany((t) => t).toSet().toList();
  }

  Future<List<String>> getAllCategories({String query = ''}) async {
    final db = await databaseRepository.database;
    final categories =
        await db.pacingModels.where().optional(query.isNotEmpty, (q) => q.categoriesElementContains(query)).categoriesProperty().findAllAsync();
    return categories.selectMany((t) => t).toSet().toList();
  }
}
