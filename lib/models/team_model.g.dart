// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTeamModelCollection on Isar {
  IsarCollection<int, TeamModel> get teamModels => this.collection();
}

const TeamModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'TeamModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'performerNames',
        type: IsarType.stringList,
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
        name: 'integrationId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'integrationEntityId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'color',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'performers',
        type: IsarType.objectList,
        target: 'PerformerModel',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.stringList,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'createdDate',
        properties: [
          "createdDate",
        ],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, TeamModel>(
    serialize: serializeTeamModel,
    deserialize: deserializeTeamModel,
    deserializeProperty: deserializeTeamModelProp,
  ),
  embeddedSchemas: [PerformerModelSchema],
);

@isarProtected
int serializeTeamModel(IsarWriter writer, TeamModel object) {
  {
    final list = object.performerNames;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
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
    final value = object.integrationId;
    if (value == null) {
      IsarCore.writeNull(writer, 4);
    } else {
      IsarCore.writeString(writer, 4, value);
    }
  }
  {
    final value = object.integrationEntityId;
    if (value == null) {
      IsarCore.writeNull(writer, 5);
    } else {
      IsarCore.writeString(writer, 5, value);
    }
  }
  IsarCore.writeString(writer, 6, object.name);
  IsarCore.writeLong(writer, 7, object.color);
  {
    final list = object.performers;
    final listWriter = IsarCore.beginList(writer, 8, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializePerformerModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 9, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
TeamModel deserializeTeamModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
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
  final String? _integrationId;
  _integrationId = IsarCore.readString(reader, 4);
  final String? _integrationEntityId;
  _integrationEntityId = IsarCore.readString(reader, 5);
  final String _name;
  _name = IsarCore.readString(reader, 6) ?? '';
  final int _color;
  _color = IsarCore.readLong(reader, 7);
  final List<PerformerModel> _performers;
  {
    final length = IsarCore.readList(reader, 8, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _performers = const <PerformerModel>[];
      } else {
        final list = List<PerformerModel>.filled(
            length,
            PerformerModel(
              id: -9223372036854775808,
              name: '',
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = PerformerModel(
                id: -9223372036854775808,
                name: '',
              );
            } else {
              final embedded = deserializePerformerModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _performers = list;
      }
    }
  }
  final List<String> _tags;
  {
    final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const <String>[];
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
  final object = TeamModel(
    id: _id,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
    integrationId: _integrationId,
    integrationEntityId: _integrationEntityId,
    name: _name,
    color: _color,
    performers: _performers,
    tags: _tags,
  );
  return object;
}

@isarProtected
dynamic deserializeTeamModelProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      {
        final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
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
    case 0:
      return IsarCore.readId(reader);
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
      return IsarCore.readString(reader, 4);
    case 5:
      return IsarCore.readString(reader, 5);
    case 6:
      return IsarCore.readString(reader, 6) ?? '';
    case 7:
      return IsarCore.readLong(reader, 7);
    case 8:
      {
        final length = IsarCore.readList(reader, 8, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <PerformerModel>[];
          } else {
            final list = List<PerformerModel>.filled(
                length,
                PerformerModel(
                  id: -9223372036854775808,
                  name: '',
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = PerformerModel(
                    id: -9223372036854775808,
                    name: '',
                  );
                } else {
                  final embedded = deserializePerformerModel(objectReader);
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
    case 9:
      {
        final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
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

sealed class _TeamModelUpdate {
  bool call({
    required int id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    int? color,
  });
}

class _TeamModelUpdateImpl implements _TeamModelUpdate {
  const _TeamModelUpdateImpl(this.collection);

  final IsarCollection<int, TeamModel> collection;

  @override
  bool call({
    required int id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? color = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (createdDate != ignore) 2: createdDate as DateTime?,
          if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
          if (integrationId != ignore) 4: integrationId as String?,
          if (integrationEntityId != ignore) 5: integrationEntityId as String?,
          if (name != ignore) 6: name as String?,
          if (color != ignore) 7: color as int?,
        }) >
        0;
  }
}

sealed class _TeamModelUpdateAll {
  int call({
    required List<int> id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    int? color,
  });
}

class _TeamModelUpdateAllImpl implements _TeamModelUpdateAll {
  const _TeamModelUpdateAllImpl(this.collection);

  final IsarCollection<int, TeamModel> collection;

  @override
  int call({
    required List<int> id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? color = ignore,
  }) {
    return collection.updateProperties(id, {
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (integrationId != ignore) 4: integrationId as String?,
      if (integrationEntityId != ignore) 5: integrationEntityId as String?,
      if (name != ignore) 6: name as String?,
      if (color != ignore) 7: color as int?,
    });
  }
}

extension TeamModelUpdate on IsarCollection<int, TeamModel> {
  _TeamModelUpdate get update => _TeamModelUpdateImpl(this);

  _TeamModelUpdateAll get updateAll => _TeamModelUpdateAllImpl(this);
}

sealed class _TeamModelQueryUpdate {
  int call({
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    int? color,
  });
}

class _TeamModelQueryUpdateImpl implements _TeamModelQueryUpdate {
  const _TeamModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<TeamModel> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? color = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (integrationId != ignore) 4: integrationId as String?,
      if (integrationEntityId != ignore) 5: integrationEntityId as String?,
      if (name != ignore) 6: name as String?,
      if (color != ignore) 7: color as int?,
    });
  }
}

extension TeamModelQueryUpdate on IsarQuery<TeamModel> {
  _TeamModelQueryUpdate get updateFirst =>
      _TeamModelQueryUpdateImpl(this, limit: 1);

  _TeamModelQueryUpdate get updateAll => _TeamModelQueryUpdateImpl(this);
}

class _TeamModelQueryBuilderUpdateImpl implements _TeamModelQueryUpdate {
  const _TeamModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<TeamModel, TeamModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? color = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (createdDate != ignore) 2: createdDate as DateTime?,
        if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
        if (integrationId != ignore) 4: integrationId as String?,
        if (integrationEntityId != ignore) 5: integrationEntityId as String?,
        if (name != ignore) 6: name as String?,
        if (color != ignore) 7: color as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension TeamModelQueryBuilderUpdate
    on QueryBuilder<TeamModel, TeamModel, QOperations> {
  _TeamModelQueryUpdate get updateFirst =>
      _TeamModelQueryBuilderUpdateImpl(this, limit: 1);

  _TeamModelQueryUpdate get updateAll => _TeamModelQueryBuilderUpdateImpl(this);
}

extension TeamModelQueryFilter
    on QueryBuilder<TeamModel, TeamModel, QFilterCondition> {
  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementGreaterThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementGreaterThanOrEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementLessThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementLessThanOrEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementBetween(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementStartsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementEndsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementMatches(String pattern,
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesIsEmpty() {
    return not().performerNamesIsNotEmpty();
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performerNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> createdDateEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> createdDateLessThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> createdDateBetween(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> modifiedDateEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> modifiedDateBetween(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      integrationEntityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      nameLessThanOrEqualTo(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> colorEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> colorGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      colorGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> colorLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      colorLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> colorBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performersIsEmpty() {
    return not().performersIsNotEmpty();
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      performersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 8, value: null),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementGreaterThanOrEqualTo(
    String value, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementLessThan(
    String value, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementLessThanOrEqualTo(
    String value, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementStartsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementEndsWith(
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementContains(
      String value,
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsElementMatches(
      String pattern,
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

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<TeamModel, TeamModel, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 9, value: null),
      );
    });
  }
}

extension TeamModelQueryObject
    on QueryBuilder<TeamModel, TeamModel, QFilterCondition> {}

extension TeamModelQuerySortBy on QueryBuilder<TeamModel, TeamModel, QSortBy> {
  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByIntegrationEntityId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy>
      sortByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension TeamModelQuerySortThenBy
    on QueryBuilder<TeamModel, TeamModel, QSortThenBy> {
  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByIntegrationEntityId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy>
      thenByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension TeamModelQueryWhereDistinct
    on QueryBuilder<TeamModel, TeamModel, QDistinct> {
  QueryBuilder<TeamModel, TeamModel, QAfterDistinct>
      distinctByPerformerNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct>
      distinctByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<TeamModel, TeamModel, QAfterDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }
}

extension TeamModelQueryProperty1
    on QueryBuilder<TeamModel, TeamModel, QProperty> {
  QueryBuilder<TeamModel, List<String>, QAfterProperty>
      performerNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TeamModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TeamModel, DateTime?, QAfterProperty> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TeamModel, DateTime?, QAfterProperty> modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TeamModel, String?, QAfterProperty> integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TeamModel, String?, QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TeamModel, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TeamModel, int, QAfterProperty> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TeamModel, List<PerformerModel>, QAfterProperty>
      performersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<TeamModel, List<String>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

extension TeamModelQueryProperty2<R>
    on QueryBuilder<TeamModel, R, QAfterProperty> {
  QueryBuilder<TeamModel, (R, List<String>), QAfterProperty>
      performerNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TeamModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TeamModel, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TeamModel, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TeamModel, (R, String?), QAfterProperty>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TeamModel, (R, String?), QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TeamModel, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TeamModel, (R, int), QAfterProperty> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TeamModel, (R, List<PerformerModel>), QAfterProperty>
      performersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<TeamModel, (R, List<String>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

extension TeamModelQueryProperty3<R1, R2>
    on QueryBuilder<TeamModel, (R1, R2), QAfterProperty> {
  QueryBuilder<TeamModel, (R1, R2, List<String>), QOperations>
      performerNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, String?), QOperations>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, String?), QOperations>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, int), QOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, List<PerformerModel>), QOperations>
      performersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<TeamModel, (R1, R2, List<String>), QOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamModelImpl _$$TeamModelImplFromJson(Map<String, dynamic> json) =>
    _$TeamModelImpl(
      id: (json['id'] as num).toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      name: json['name'] as String,
      color: (json['color'] as num).toInt(),
      performers: (json['performers'] as List<dynamic>?)
              ?.map((e) => PerformerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      integrationId: json['integrationId'] as String?,
      integrationEntityId: json['integrationEntityId'] as String?,
    );

Map<String, dynamic> _$$TeamModelImplToJson(_$TeamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'name': instance.name,
      'color': instance.color,
      'performers': instance.performers,
      'tags': instance.tags,
      'integrationId': instance.integrationId,
      'integrationEntityId': instance.integrationEntityId,
    };
