// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_entity.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetPacingEntityCollection on Isar {
  IsarCollection<int, PacingEntity> get pacingModels => this.collection();
}

const PacingEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PacingModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'createdDate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'modifiedDate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'improvisations',
        type: IsarType.objectList,
        target: 'ImprovisationModel',
      ),
      IsarPropertySchema(
        name: 'defaultNumberOfTeams',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'integrationId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'integrationEntityId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'integrationAdditionalData',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'categories',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'themes',
        type: IsarType.stringList,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'name',
        properties: [
          "name",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'createdDate',
        properties: [
          "createdDate",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'modifiedDate',
        properties: [
          "modifiedDate",
        ],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, PacingEntity>(
    serialize: serializePacingEntity,
    deserialize: deserializePacingEntity,
    deserializeProperty: deserializePacingEntityProp,
  ),
  embeddedSchemas: [ImprovisationEntitySchema],
);

@isarProtected
int serializePacingEntity(IsarWriter writer, PacingEntity object) {
  IsarCore.writeString(writer, 1, object.name);
  IsarCore.writeLong(
      writer,
      2,
      object.createdDate?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeLong(
      writer,
      3,
      object.modifiedDate?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  {
    final list = object.improvisations;
    final listWriter = IsarCore.beginList(writer, 4, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeImprovisationEntity(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeLong(writer, 5, object.defaultNumberOfTeams);
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 6, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final value = object.integrationId;
    if (value == null) {
      IsarCore.writeNull(writer, 7);
    } else {
      IsarCore.writeString(writer, 7, value);
    }
  }
  {
    final value = object.integrationEntityId;
    if (value == null) {
      IsarCore.writeNull(writer, 8);
    } else {
      IsarCore.writeString(writer, 8, value);
    }
  }
  {
    final value = object.integrationAdditionalData;
    if (value == null) {
      IsarCore.writeNull(writer, 9);
    } else {
      IsarCore.writeString(writer, 9, value);
    }
  }
  {
    final list = object.categories;
    final listWriter = IsarCore.beginList(writer, 10, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.themes;
    final listWriter = IsarCore.beginList(writer, 11, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
PacingEntity deserializePacingEntity(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _name;
  _name = IsarCore.readString(reader, 1) ?? '';
  final DateTime? _createdDate;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _createdDate = null;
    } else {
      _createdDate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime? _modifiedDate;
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      _modifiedDate = null;
    } else {
      _modifiedDate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final List<ImprovisationEntity> _improvisations;
  {
    final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _improvisations = const <ImprovisationEntity>[];
      } else {
        final list = List<ImprovisationEntity>.filled(
            length,
            ImprovisationEntity(
              id: -9223372036854775808,
              type: ImprovisationType.mixed,
              category: '',
              theme: '',
              durationsInSeconds: const <int>[],
              performers: '',
              notes: '',
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = ImprovisationEntity(
                id: -9223372036854775808,
                type: ImprovisationType.mixed,
                category: '',
                theme: '',
                durationsInSeconds: const <int>[],
                performers: '',
                notes: '',
              );
            } else {
              final embedded = deserializeImprovisationEntity(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _improvisations = list;
      }
    }
  }
  final int _defaultNumberOfTeams;
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      _defaultNumberOfTeams = 2;
    } else {
      _defaultNumberOfTeams = value;
    }
  }
  final List<String> _tags;
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const [];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        _tags = list;
      }
    }
  }
  final String? _integrationId;
  _integrationId = IsarCore.readString(reader, 7);
  final String? _integrationEntityId;
  _integrationEntityId = IsarCore.readString(reader, 8);
  final String? _integrationAdditionalData;
  _integrationAdditionalData = IsarCore.readString(reader, 9);
  final object = PacingEntity(
    id: _id,
    name: _name,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
    improvisations: _improvisations,
    defaultNumberOfTeams: _defaultNumberOfTeams,
    tags: _tags,
    integrationId: _integrationId,
    integrationEntityId: _integrationEntityId,
    integrationAdditionalData: _integrationAdditionalData,
  );
  return object;
}

@isarProtected
dynamic deserializePacingEntityProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 4:
      {
        final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <ImprovisationEntity>[];
          } else {
            final list = List<ImprovisationEntity>.filled(
                length,
                ImprovisationEntity(
                  id: -9223372036854775808,
                  type: ImprovisationType.mixed,
                  category: '',
                  theme: '',
                  durationsInSeconds: const <int>[],
                  performers: '',
                  notes: '',
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = ImprovisationEntity(
                    id: -9223372036854775808,
                    type: ImprovisationType.mixed,
                    category: '',
                    theme: '',
                    durationsInSeconds: const <int>[],
                    performers: '',
                    notes: '',
                  );
                } else {
                  final embedded = deserializeImprovisationEntity(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return 2;
        } else {
          return value;
        }
      }
    case 6:
      {
        final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const [];
          } else {
            final list = List<String>.filled(length, '', growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readString(reader, i) ?? '';
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 7:
      return IsarCore.readString(reader, 7);
    case 8:
      return IsarCore.readString(reader, 8);
    case 9:
      return IsarCore.readString(reader, 9);
    case 10:
      {
        final length = IsarCore.readList(reader, 10, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <String>[];
          } else {
            final list = List<String>.filled(length, '', growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readString(reader, i) ?? '';
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 11:
      {
        final length = IsarCore.readList(reader, 11, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <String>[];
          } else {
            final list = List<String>.filled(length, '', growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readString(reader, i) ?? '';
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _PacingEntityUpdate {
  bool call({
    required int id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    int? defaultNumberOfTeams,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
  });
}

class _PacingEntityUpdateImpl implements _PacingEntityUpdate {
  const _PacingEntityUpdateImpl(this.collection);

  final IsarCollection<int, PacingEntity> collection;

  @override
  bool call({
    required int id,
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? defaultNumberOfTeams = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (name != ignore) 1: name as String?,
          if (createdDate != ignore) 2: createdDate as DateTime?,
          if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
          if (defaultNumberOfTeams != ignore) 5: defaultNumberOfTeams as int?,
          if (integrationId != ignore) 7: integrationId as String?,
          if (integrationEntityId != ignore) 8: integrationEntityId as String?,
          if (integrationAdditionalData != ignore)
            9: integrationAdditionalData as String?,
        }) >
        0;
  }
}

sealed class _PacingEntityUpdateAll {
  int call({
    required List<int> id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    int? defaultNumberOfTeams,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
  });
}

class _PacingEntityUpdateAllImpl implements _PacingEntityUpdateAll {
  const _PacingEntityUpdateAllImpl(this.collection);

  final IsarCollection<int, PacingEntity> collection;

  @override
  int call({
    required List<int> id,
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? defaultNumberOfTeams = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
  }) {
    return collection.updateProperties(id, {
      if (name != ignore) 1: name as String?,
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (defaultNumberOfTeams != ignore) 5: defaultNumberOfTeams as int?,
      if (integrationId != ignore) 7: integrationId as String?,
      if (integrationEntityId != ignore) 8: integrationEntityId as String?,
      if (integrationAdditionalData != ignore)
        9: integrationAdditionalData as String?,
    });
  }
}

extension PacingEntityUpdate on IsarCollection<int, PacingEntity> {
  _PacingEntityUpdate get update => _PacingEntityUpdateImpl(this);

  _PacingEntityUpdateAll get updateAll => _PacingEntityUpdateAllImpl(this);
}

sealed class _PacingEntityQueryUpdate {
  int call({
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    int? defaultNumberOfTeams,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
  });
}

class _PacingEntityQueryUpdateImpl implements _PacingEntityQueryUpdate {
  const _PacingEntityQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<PacingEntity> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? defaultNumberOfTeams = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 1: name as String?,
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (defaultNumberOfTeams != ignore) 5: defaultNumberOfTeams as int?,
      if (integrationId != ignore) 7: integrationId as String?,
      if (integrationEntityId != ignore) 8: integrationEntityId as String?,
      if (integrationAdditionalData != ignore)
        9: integrationAdditionalData as String?,
    });
  }
}

extension PacingEntityQueryUpdate on IsarQuery<PacingEntity> {
  _PacingEntityQueryUpdate get updateFirst =>
      _PacingEntityQueryUpdateImpl(this, limit: 1);

  _PacingEntityQueryUpdate get updateAll => _PacingEntityQueryUpdateImpl(this);
}

class _PacingEntityQueryBuilderUpdateImpl implements _PacingEntityQueryUpdate {
  const _PacingEntityQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<PacingEntity, PacingEntity, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? defaultNumberOfTeams = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 1: name as String?,
        if (createdDate != ignore) 2: createdDate as DateTime?,
        if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
        if (defaultNumberOfTeams != ignore) 5: defaultNumberOfTeams as int?,
        if (integrationId != ignore) 7: integrationId as String?,
        if (integrationEntityId != ignore) 8: integrationEntityId as String?,
        if (integrationAdditionalData != ignore)
          9: integrationAdditionalData as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension PacingEntityQueryBuilderUpdate
    on QueryBuilder<PacingEntity, PacingEntity, QOperations> {
  _PacingEntityQueryUpdate get updateFirst =>
      _PacingEntityQueryBuilderUpdateImpl(this, limit: 1);

  _PacingEntityQueryUpdate get updateAll =>
      _PacingEntityQueryBuilderUpdateImpl(this);
}

extension PacingEntityQueryFilter
    on QueryBuilder<PacingEntity, PacingEntity, QFilterCondition> {
  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      createdDateBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      modifiedDateBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      improvisationsIsEmpty() {
    return not().improvisationsIsNotEmpty();
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      improvisationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 4, value: null),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      defaultNumberOfTeamsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 7,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 8,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationEntityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 9,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 10,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesIsEmpty() {
    return not().categoriesIsNotEmpty();
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 10, value: null),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 11,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesIsEmpty() {
    return not().themesIsNotEmpty();
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterFilterCondition>
      themesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 11, value: null),
      );
    });
  }
}

extension PacingEntityQueryObject
    on QueryBuilder<PacingEntity, PacingEntity, QFilterCondition> {}

extension PacingEntityQuerySortBy
    on QueryBuilder<PacingEntity, PacingEntity, QSortBy> {
  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByDefaultNumberOfTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> sortByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        7,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByIntegrationIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        7,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        8,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        8,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        9,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      sortByIntegrationAdditionalDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        9,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension PacingEntityQuerySortThenBy
    on QueryBuilder<PacingEntity, PacingEntity, QSortThenBy> {
  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByDefaultNumberOfTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy> thenByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByIntegrationIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterSortBy>
      thenByIntegrationAdditionalDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension PacingEntityQueryWhereDistinct
    on QueryBuilder<PacingEntity, PacingEntity, QDistinct> {
  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByIntegrationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct>
      distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }

  QueryBuilder<PacingEntity, PacingEntity, QAfterDistinct> distinctByThemes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }
}

extension PacingEntityQueryProperty1
    on QueryBuilder<PacingEntity, PacingEntity, QProperty> {
  QueryBuilder<PacingEntity, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingEntity, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingEntity, DateTime?, QAfterProperty> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingEntity, DateTime?, QAfterProperty> modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingEntity, List<ImprovisationEntity>, QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingEntity, int, QAfterProperty>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingEntity, List<String>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingEntity, String?, QAfterProperty> integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<PacingEntity, String?, QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<PacingEntity, String?, QAfterProperty>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<PacingEntity, List<String>, QAfterProperty>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<PacingEntity, List<String>, QAfterProperty> themesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }
}

extension PacingEntityQueryProperty2<R>
    on QueryBuilder<PacingEntity, R, QAfterProperty> {
  QueryBuilder<PacingEntity, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingEntity, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingEntity, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingEntity, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingEntity, (R, List<ImprovisationEntity>), QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingEntity, (R, int), QAfterProperty>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingEntity, (R, List<String>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingEntity, (R, String?), QAfterProperty>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<PacingEntity, (R, String?), QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<PacingEntity, (R, String?), QAfterProperty>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<PacingEntity, (R, List<String>), QAfterProperty>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<PacingEntity, (R, List<String>), QAfterProperty>
      themesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }
}

extension PacingEntityQueryProperty3<R1, R2>
    on QueryBuilder<PacingEntity, (R1, R2), QAfterProperty> {
  QueryBuilder<PacingEntity, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, List<ImprovisationEntity>), QOperations>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, int), QOperations>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, List<String>), QOperations>
      tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, String?), QOperations>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, String?), QOperations>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, String?), QOperations>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, List<String>), QOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<PacingEntity, (R1, R2, List<String>), QOperations>
      themesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }
}
