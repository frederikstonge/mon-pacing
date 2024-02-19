// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetPacingModelCollection on Isar {
  IsarCollection<int, PacingModel> get pacingModels => this.collection();
}

const PacingModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PacingModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'createdDate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'modifiedDate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'enablePaddingDuration',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'paddingDuration',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'defaultNumberOfTeams',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'improvisations',
        type: IsarType.objectList,
        target: 'ImprovisationModel',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, PacingModel>(
    serialize: serializePacingModel,
    deserialize: deserializePacingModel,
    deserializeProperty: deserializePacingModelProp,
  ),
  embeddedSchemas: [ImprovisationModelSchema],
);

@isarProtected
int serializePacingModel(IsarWriter writer, PacingModel object) {
  IsarCore.writeLong(
      writer,
      1,
      object.createdDate?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeLong(
      writer,
      2,
      object.modifiedDate?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeString(writer, 3, object.name);
  IsarCore.writeBool(writer, 4, object.enablePaddingDuration);
  IsarCore.writeDouble(writer, 5, object.paddingDuration);
  IsarCore.writeLong(writer, 6, object.defaultNumberOfTeams);
  {
    final list = object.improvisations;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeImprovisationModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
PacingModel deserializePacingModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final DateTime? _createdDate;
  {
    final value = IsarCore.readLong(reader, 1);
    if (value == -9223372036854775808) {
      _createdDate = null;
    } else {
      _createdDate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime? _modifiedDate;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _modifiedDate = null;
    } else {
      _modifiedDate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final String _name;
  _name = IsarCore.readString(reader, 3) ?? '';
  final bool _enablePaddingDuration;
  _enablePaddingDuration = IsarCore.readBool(reader, 4);
  final double _paddingDuration;
  _paddingDuration = IsarCore.readDouble(reader, 5);
  final int _defaultNumberOfTeams;
  _defaultNumberOfTeams = IsarCore.readLong(reader, 6);
  final List<ImprovisationModel> _improvisations;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _improvisations = const <ImprovisationModel>[];
      } else {
        final list = List<ImprovisationModel>.filled(
            length,
            ImprovisationModel(
              id: -9223372036854775808,
              order: -9223372036854775808,
              type: ImprovisationType.mixed,
              category: '',
              theme: '',
              durations: const <double>[],
              performers: null,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = ImprovisationModel(
                id: -9223372036854775808,
                order: -9223372036854775808,
                type: ImprovisationType.mixed,
                category: '',
                theme: '',
                durations: const <double>[],
                performers: null,
              );
            } else {
              final embedded = deserializeImprovisationModel(objectReader);
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
  final object = PacingModel(
    id: _id,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
    name: _name,
    enablePaddingDuration: _enablePaddingDuration,
    paddingDuration: _paddingDuration,
    defaultNumberOfTeams: _defaultNumberOfTeams,
    improvisations: _improvisations,
  );
  return object;
}

@isarProtected
dynamic deserializePacingModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final value = IsarCore.readLong(reader, 1);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
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
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return IsarCore.readBool(reader, 4);
    case 5:
      return IsarCore.readDouble(reader, 5);
    case 6:
      return IsarCore.readLong(reader, 6);
    case 7:
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <ImprovisationModel>[];
          } else {
            final list = List<ImprovisationModel>.filled(
                length,
                ImprovisationModel(
                  id: -9223372036854775808,
                  order: -9223372036854775808,
                  type: ImprovisationType.mixed,
                  category: '',
                  theme: '',
                  durations: const <double>[],
                  performers: null,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = ImprovisationModel(
                    id: -9223372036854775808,
                    order: -9223372036854775808,
                    type: ImprovisationType.mixed,
                    category: '',
                    theme: '',
                    durations: const <double>[],
                    performers: null,
                  );
                } else {
                  final embedded = deserializeImprovisationModel(objectReader);
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
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _PacingModelUpdate {
  bool call({
    required int id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
    bool? enablePaddingDuration,
    double? paddingDuration,
    int? defaultNumberOfTeams,
  });
}

class _PacingModelUpdateImpl implements _PacingModelUpdate {
  const _PacingModelUpdateImpl(this.collection);

  final IsarCollection<int, PacingModel> collection;

  @override
  bool call({
    required int id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
    Object? enablePaddingDuration = ignore,
    Object? paddingDuration = ignore,
    Object? defaultNumberOfTeams = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (createdDate != ignore) 1: createdDate as DateTime?,
          if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
          if (name != ignore) 3: name as String?,
          if (enablePaddingDuration != ignore)
            4: enablePaddingDuration as bool?,
          if (paddingDuration != ignore) 5: paddingDuration as double?,
          if (defaultNumberOfTeams != ignore) 6: defaultNumberOfTeams as int?,
        }) >
        0;
  }
}

sealed class _PacingModelUpdateAll {
  int call({
    required List<int> id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
    bool? enablePaddingDuration,
    double? paddingDuration,
    int? defaultNumberOfTeams,
  });
}

class _PacingModelUpdateAllImpl implements _PacingModelUpdateAll {
  const _PacingModelUpdateAllImpl(this.collection);

  final IsarCollection<int, PacingModel> collection;

  @override
  int call({
    required List<int> id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
    Object? enablePaddingDuration = ignore,
    Object? paddingDuration = ignore,
    Object? defaultNumberOfTeams = ignore,
  }) {
    return collection.updateProperties(id, {
      if (createdDate != ignore) 1: createdDate as DateTime?,
      if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
      if (name != ignore) 3: name as String?,
      if (enablePaddingDuration != ignore) 4: enablePaddingDuration as bool?,
      if (paddingDuration != ignore) 5: paddingDuration as double?,
      if (defaultNumberOfTeams != ignore) 6: defaultNumberOfTeams as int?,
    });
  }
}

extension PacingModelUpdate on IsarCollection<int, PacingModel> {
  _PacingModelUpdate get update => _PacingModelUpdateImpl(this);

  _PacingModelUpdateAll get updateAll => _PacingModelUpdateAllImpl(this);
}

sealed class _PacingModelQueryUpdate {
  int call({
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
    bool? enablePaddingDuration,
    double? paddingDuration,
    int? defaultNumberOfTeams,
  });
}

class _PacingModelQueryUpdateImpl implements _PacingModelQueryUpdate {
  const _PacingModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<PacingModel> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
    Object? enablePaddingDuration = ignore,
    Object? paddingDuration = ignore,
    Object? defaultNumberOfTeams = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (createdDate != ignore) 1: createdDate as DateTime?,
      if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
      if (name != ignore) 3: name as String?,
      if (enablePaddingDuration != ignore) 4: enablePaddingDuration as bool?,
      if (paddingDuration != ignore) 5: paddingDuration as double?,
      if (defaultNumberOfTeams != ignore) 6: defaultNumberOfTeams as int?,
    });
  }
}

extension PacingModelQueryUpdate on IsarQuery<PacingModel> {
  _PacingModelQueryUpdate get updateFirst =>
      _PacingModelQueryUpdateImpl(this, limit: 1);

  _PacingModelQueryUpdate get updateAll => _PacingModelQueryUpdateImpl(this);
}

class _PacingModelQueryBuilderUpdateImpl implements _PacingModelQueryUpdate {
  const _PacingModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<PacingModel, PacingModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
    Object? enablePaddingDuration = ignore,
    Object? paddingDuration = ignore,
    Object? defaultNumberOfTeams = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (createdDate != ignore) 1: createdDate as DateTime?,
        if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
        if (name != ignore) 3: name as String?,
        if (enablePaddingDuration != ignore) 4: enablePaddingDuration as bool?,
        if (paddingDuration != ignore) 5: paddingDuration as double?,
        if (defaultNumberOfTeams != ignore) 6: defaultNumberOfTeams as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension PacingModelQueryBuilderUpdate
    on QueryBuilder<PacingModel, PacingModel, QOperations> {
  _PacingModelQueryUpdate get updateFirst =>
      _PacingModelQueryBuilderUpdateImpl(this, limit: 1);

  _PacingModelQueryUpdate get updateAll =>
      _PacingModelQueryBuilderUpdateImpl(this);
}

extension PacingModelQueryFilter
    on QueryBuilder<PacingModel, PacingModel, QFilterCondition> {
  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      createdDateBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateEqualTo(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateGreaterThan(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateGreaterThanOrEqualTo(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateLessThan(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateLessThanOrEqualTo(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      modifiedDateBetween(
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

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      enablePaddingDurationEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      paddingDurationBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      defaultNumberOfTeamsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      improvisationsIsEmpty() {
    return not().improvisationsIsNotEmpty();
  }

  QueryBuilder<PacingModel, PacingModel, QAfterFilterCondition>
      improvisationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }
}

extension PacingModelQueryObject
    on QueryBuilder<PacingModel, PacingModel, QFilterCondition> {}

extension PacingModelQuerySortBy
    on QueryBuilder<PacingModel, PacingModel, QSortBy> {
  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByEnablePaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByEnablePaddingDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> sortByPaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByPaddingDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      sortByDefaultNumberOfTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension PacingModelQuerySortThenBy
    on QueryBuilder<PacingModel, PacingModel, QSortThenBy> {
  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByEnablePaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByEnablePaddingDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy> thenByPaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByPaddingDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterSortBy>
      thenByDefaultNumberOfTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension PacingModelQueryWhereDistinct
    on QueryBuilder<PacingModel, PacingModel, QDistinct> {
  QueryBuilder<PacingModel, PacingModel, QAfterDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterDistinct>
      distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterDistinct>
      distinctByEnablePaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterDistinct>
      distinctByPaddingDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<PacingModel, PacingModel, QAfterDistinct>
      distinctByDefaultNumberOfTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension PacingModelQueryProperty1
    on QueryBuilder<PacingModel, PacingModel, QProperty> {
  QueryBuilder<PacingModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingModel, DateTime?, QAfterProperty> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingModel, DateTime?, QAfterProperty> modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingModel, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingModel, bool, QAfterProperty>
      enablePaddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingModel, double, QAfterProperty> paddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingModel, int, QAfterProperty>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingModel, List<ImprovisationModel>, QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension PacingModelQueryProperty2<R>
    on QueryBuilder<PacingModel, R, QAfterProperty> {
  QueryBuilder<PacingModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingModel, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingModel, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingModel, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingModel, (R, bool), QAfterProperty>
      enablePaddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingModel, (R, double), QAfterProperty>
      paddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingModel, (R, int), QAfterProperty>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingModel, (R, List<ImprovisationModel>), QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension PacingModelQueryProperty3<R1, R2>
    on QueryBuilder<PacingModel, (R1, R2), QAfterProperty> {
  QueryBuilder<PacingModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, bool), QOperations>
      enablePaddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, double), QOperations>
      paddingDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, int), QOperations>
      defaultNumberOfTeamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<PacingModel, (R1, R2, List<ImprovisationModel>), QOperations>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PacingModelImpl _$$PacingModelImplFromJson(Map<String, dynamic> json) =>
    _$PacingModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      enablePaddingDuration: json['enablePaddingDuration'] as bool,
      paddingDuration: (json['paddingDuration'] as num).toDouble(),
      defaultNumberOfTeams: json['defaultNumberOfTeams'] as int,
      improvisations: (json['improvisations'] as List<dynamic>)
          .map((e) => ImprovisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PacingModelImplToJson(_$PacingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'enablePaddingDuration': instance.enablePaddingDuration,
      'paddingDuration': instance.paddingDuration,
      'defaultNumberOfTeams': instance.defaultNumberOfTeams,
      'improvisations': instance.improvisations,
    };
