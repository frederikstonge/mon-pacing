import 'package:drift/drift.dart';

import '../extensions/iterable_extensions.dart';
import '../models/improvisation_model.dart';
import '../models/pacing_model.dart';
import 'app_database.dart';
import 'entities/improvisation_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/pacing_tag_entity.dart';
import 'entities/tag_entity.dart';

part 'pacings_repository.g.dart';

@DriftAccessor(
  tables: [
    PacingEntity,
    ImprovisationEntity,
    PacingTagEntity,
    TagEntity,
  ],
)
class PacingsRepository extends DatabaseAccessor<AppDatabase> with _$PacingsRepositoryMixin {
  PacingsRepository(
    super.attachedDatabase,
  );

  Future<int> add(PacingModel model) async {
    final entity = model.toCompanion();
    final pacing = await pacingEntity.insertReturning(entity);

    final improvisations = model.improvisations.map((i) => i.toCompanion(pacingId: pacing.id));
    await improvisationEntity.insertAll(improvisations);
    return pacing.id;
  }

  Future<void> edit(PacingModel model) async {
    final entity = model.toCompanion();
    await pacingEntity.update().replace(entity);
  }

  Future<void> remove(int id) async {
    await improvisationEntity.deleteWhere((i) => i.pacing.equals(id));
    await pacingEntity.deleteWhere((p) => p.id.equals(id));
  }

  Future<ImprovisationModel> addImprovisation(ImprovisationModel model) async {
    final entity = model.toCompanion();
    final improvisation = await improvisationEntity.insert().insertReturning(entity);
    return ImprovisationModel.fromEntity(improvisation);
  }

  Future<void> editImprovisation(ImprovisationModel model) async {
    final entity = model.toCompanion();
    await improvisationEntity.update().replace(entity);
  }

  Future<void> removeImprovisation(int id) async {
    await improvisationEntity.deleteWhere((i) => i.id.equals(id));
  }

  Future<void> reorderImprovisations(List<ImprovisationModel> improvisations) {
    return batch((b) {
      for (final improvisation in improvisations) {
        final entity = improvisation.toCompanion();
        b.update(improvisationEntity, entity, where: (i) => i.id.equals(entity.id.value));
      }
    });
  }

  Future<PacingModel?> get(int id) async {
    final response = await attachedDatabase.managers.pacingEntity
        .withReferences((p) => p(improvisationEntityRefs: true))
        .filter((p) => p.id.equals(id))
        .getSingleOrNull();

    if (response == null) {
      return null;
    }

    return await _getPacingModel(response);
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    final List<PacingModel> pacings = [];
    final response = await attachedDatabase.managers.pacingEntity
        .withReferences((p) => p(improvisationEntityRefs: true))
        .orderBy((p) => p.createdDate.desc())
        .get(offset: skip, limit: take);

    for (final pacingResponse in response) {
      pacings.add(await _getPacingModel(pacingResponse));
    }

    return pacings;
  }

  Future<List<PacingModel>> search(String search, List<String> selectedTags) async {
    final List<PacingModel> pacings = [];
    var pacingsQuery = attachedDatabase.managers.pacingEntity.withReferences((p) => p(improvisationEntityRefs: true));

    if (selectedTags.isNotEmpty) {
      pacingsQuery = pacingsQuery.filter((p) => p.pacingTagEntityRefs((f) => f.tag.name.isIn(selectedTags)));
    }

    if (search.isNotEmpty) {
      pacingsQuery = pacingsQuery.filter(
        (p) =>
            p.name.contains(search, caseInsensitive: true) |
            p.improvisationEntityRefs(
              (i) => i.category.contains(search, caseInsensitive: true) | i.theme.contains(search, caseInsensitive: true),
            ),
      );
    }

    final response = await pacingsQuery.orderBy((p) => p.createdDate.desc()).get();
    for (final pacingResponse in response) {
      pacings.add(await _getPacingModel(pacingResponse));
    }

    return pacings;
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    var pacingTagsQuery = attachedDatabase.managers.pacingTagEntity.withReferences((p) => p(tag: true));
    if (query.isNotEmpty) {
      pacingTagsQuery = pacingTagsQuery.filter((t) => t.tag.name.contains(query, caseInsensitive: true));
    }

    final tags = await pacingTagsQuery.get();
    return tags.selectMany((t) => t.$2.tag.prefetchedData!).map((t) => t.name).toSet().toList();
  }

  Future<List<String>> getAllCategories({String query = ''}) async {
    var improvisationsQuery = attachedDatabase.managers.improvisationEntity.withReferences();
    if (query.isNotEmpty) {
      improvisationsQuery = improvisationsQuery.filter((i) => i.category.contains(query, caseInsensitive: true));
    }

    final improvisations = await improvisationsQuery.get();
    return improvisations.map((t) => t.$1.category).toSet().toList();
  }

  Future<PacingModel> _getPacingModel((PacingEntityData, $$PacingEntityTableReferences) pacingResponse) async {
    final pacing = pacingResponse.$1;
    final improvisations = pacingResponse.$2.improvisationEntityRefs.prefetchedData ?? [];

    final pacingTags = await pacingResponse.$2.pacingTagEntityRefs.withReferences((p) => p(tag: true)).get();
    final tags = pacingTags.selectMany((t) => t.$2.tag.prefetchedData!);

    final improvisationModels = improvisations.map((i) => ImprovisationModel.fromEntity(i)).toList();
    final tagsModel = tags.map((t) => t.name).toList();

    return PacingModel.fromEntity(
      pacing,
      improvisationModels,
      tagsModel,
    );
  }
}
