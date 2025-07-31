import 'package:collection/collection.dart';

import 'database_repository.dart';
import 'entities/tag_entity.dart';
import 'objectbox.g.dart';

class TagsRepository {
  final DatabaseRepository databaseRepository;

  const TagsRepository({required this.databaseRepository});

  Future<List<String>> getAllTags({String search = ''}) async {
    final db = await databaseRepository.database;
    final box = db.box<TagEntity>();
    final builder = box.query(TagEntity_.name.contains(search, caseSensitive: false));
    final query = builder.build();
    final returnValue = await query.findAsync();
    query.close();
    return returnValue
        .groupListsBy((p) => p.name)
        .entries
        .sortedBy((a) => a.value.length)
        .reversed
        .map((e) => e.key)
        .toList();
  }
}
