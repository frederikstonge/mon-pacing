// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetMatchModelCollection on Isar {
  IsarCollection<int, MatchModel> get matchModels => this.collection();
}

const MatchModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'MatchModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'teamNames',
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
        name: 'teams',
        type: IsarType.objectList,
        target: 'MatchTeamModel',
      ),
      IsarPropertySchema(
        name: 'improvisations',
        type: IsarType.objectList,
        target: 'ImprovisationModel',
      ),
      IsarPropertySchema(
        name: 'penalties',
        type: IsarType.objectList,
        target: 'PenaltyModel',
      ),
      IsarPropertySchema(
        name: 'points',
        type: IsarType.objectList,
        target: 'PointModel',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'stars',
        type: IsarType.objectList,
        target: 'StarModel',
      ),
      IsarPropertySchema(
        name: 'enableStatistics',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'enablePenaltiesImpactPoints',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'penaltiesImpactType',
        type: IsarType.byte,
        enumMap: {"addPoints": 0, "substractPoints": 1},
      ),
      IsarPropertySchema(
        name: 'penaltiesRequiredToImpactPoints',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'enableMatchExpulsion',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'penaltiesRequiredToExpel',
        type: IsarType.long,
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
      IsarIndexSchema(
        name: 'name',
        properties: [
          "name",
        ],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, MatchModel>(
    serialize: serializeMatchModel,
    deserialize: deserializeMatchModel,
    deserializeProperty: deserializeMatchModelProp,
  ),
  embeddedSchemas: [
    MatchTeamModelSchema,
    PerformerModelSchema,
    ImprovisationModelSchema,
    PenaltyModelSchema,
    PointModelSchema,
    StarModelSchema
  ],
);

@isarProtected
int serializeMatchModel(IsarWriter writer, MatchModel object) {
  {
    final list = object.teamNames;
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
  {
    final list = object.teams;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeMatchTeamModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.improvisations;
    final listWriter = IsarCore.beginList(writer, 8, list.length);
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
  {
    final list = object.penalties;
    final listWriter = IsarCore.beginList(writer, 9, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializePenaltyModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.points;
    final listWriter = IsarCore.beginList(writer, 10, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializePointModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 11, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.stars;
    final listWriter = IsarCore.beginList(writer, 12, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeStarModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeBool(writer, 13, object.enableStatistics);
  IsarCore.writeBool(writer, 14, object.enablePenaltiesImpactPoints);
  IsarCore.writeByte(writer, 15, object.penaltiesImpactType.index);
  IsarCore.writeLong(writer, 16, object.penaltiesRequiredToImpactPoints);
  IsarCore.writeBool(writer, 17, object.enableMatchExpulsion);
  IsarCore.writeLong(writer, 18, object.penaltiesRequiredToExpel);
  return object.id;
}

@isarProtected
MatchModel deserializeMatchModel(IsarReader reader) {
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
  final List<MatchTeamModel> _teams;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _teams = const <MatchTeamModel>[];
      } else {
        final list = List<MatchTeamModel>.filled(
            length,
            MatchTeamModel(
              id: -9223372036854775808,
              name: '',
              color: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = MatchTeamModel(
                id: -9223372036854775808,
                name: '',
                color: -9223372036854775808,
              );
            } else {
              final embedded = deserializeMatchTeamModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _teams = list;
      }
    }
  }
  final List<ImprovisationModel> _improvisations;
  {
    final length = IsarCore.readList(reader, 8, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _improvisations = const <ImprovisationModel>[];
      } else {
        final list = List<ImprovisationModel>.filled(
            length,
            ImprovisationModel(
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
              list[i] = ImprovisationModel(
                id: -9223372036854775808,
                type: ImprovisationType.mixed,
                category: '',
                theme: '',
                durationsInSeconds: const <int>[],
                performers: '',
                notes: '',
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
  final List<PenaltyModel> _penalties;
  {
    final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _penalties = const <PenaltyModel>[];
      } else {
        final list = List<PenaltyModel>.filled(
            length,
            PenaltyModel(
              id: -9223372036854775808,
              major: false,
              type: '',
              performerId: null,
              teamId: -9223372036854775808,
              improvisationId: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = PenaltyModel(
                id: -9223372036854775808,
                major: false,
                type: '',
                performerId: null,
                teamId: -9223372036854775808,
                improvisationId: -9223372036854775808,
              );
            } else {
              final embedded = deserializePenaltyModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _penalties = list;
      }
    }
  }
  final List<PointModel> _points;
  {
    final length = IsarCore.readList(reader, 10, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _points = const <PointModel>[];
      } else {
        final list = List<PointModel>.filled(
            length,
            PointModel(
              id: -9223372036854775808,
              teamId: -9223372036854775808,
              improvisationId: -9223372036854775808,
              value: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = PointModel(
                id: -9223372036854775808,
                teamId: -9223372036854775808,
                improvisationId: -9223372036854775808,
                value: -9223372036854775808,
              );
            } else {
              final embedded = deserializePointModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _points = list;
      }
    }
  }
  final List<String> _tags;
  {
    final length = IsarCore.readList(reader, 11, IsarCore.readerPtrPtr);
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
  final List<StarModel> _stars;
  {
    final length = IsarCore.readList(reader, 12, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _stars = const <StarModel>[];
      } else {
        final list = List<StarModel>.filled(
            length,
            StarModel(
              id: -9223372036854775808,
              performerId: -9223372036854775808,
              teamId: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = StarModel(
                id: -9223372036854775808,
                performerId: -9223372036854775808,
                teamId: -9223372036854775808,
              );
            } else {
              final embedded = deserializeStarModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _stars = list;
      }
    }
  }
  final bool _enableStatistics;
  _enableStatistics = IsarCore.readBool(reader, 13);
  final bool _enablePenaltiesImpactPoints;
  _enablePenaltiesImpactPoints = IsarCore.readBool(reader, 14);
  final PenaltiesImpactType _penaltiesImpactType;
  {
    if (IsarCore.readNull(reader, 15)) {
      _penaltiesImpactType = PenaltiesImpactType.addPoints;
    } else {
      _penaltiesImpactType =
          _matchModelPenaltiesImpactType[IsarCore.readByte(reader, 15)] ??
              PenaltiesImpactType.addPoints;
    }
  }
  final int _penaltiesRequiredToImpactPoints;
  _penaltiesRequiredToImpactPoints = IsarCore.readLong(reader, 16);
  final bool _enableMatchExpulsion;
  _enableMatchExpulsion = IsarCore.readBool(reader, 17);
  final int _penaltiesRequiredToExpel;
  _penaltiesRequiredToExpel = IsarCore.readLong(reader, 18);
  final object = MatchModel(
    id: _id,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
    integrationId: _integrationId,
    integrationEntityId: _integrationEntityId,
    name: _name,
    teams: _teams,
    improvisations: _improvisations,
    penalties: _penalties,
    points: _points,
    tags: _tags,
    stars: _stars,
    enableStatistics: _enableStatistics,
    enablePenaltiesImpactPoints: _enablePenaltiesImpactPoints,
    penaltiesImpactType: _penaltiesImpactType,
    penaltiesRequiredToImpactPoints: _penaltiesRequiredToImpactPoints,
    enableMatchExpulsion: _enableMatchExpulsion,
    penaltiesRequiredToExpel: _penaltiesRequiredToExpel,
  );
  return object;
}

@isarProtected
dynamic deserializeMatchModelProp(IsarReader reader, int property) {
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
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <MatchTeamModel>[];
          } else {
            final list = List<MatchTeamModel>.filled(
                length,
                MatchTeamModel(
                  id: -9223372036854775808,
                  name: '',
                  color: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = MatchTeamModel(
                    id: -9223372036854775808,
                    name: '',
                    color: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeMatchTeamModel(objectReader);
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
    case 8:
      {
        final length = IsarCore.readList(reader, 8, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <ImprovisationModel>[];
          } else {
            final list = List<ImprovisationModel>.filled(
                length,
                ImprovisationModel(
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
                  list[i] = ImprovisationModel(
                    id: -9223372036854775808,
                    type: ImprovisationType.mixed,
                    category: '',
                    theme: '',
                    durationsInSeconds: const <int>[],
                    performers: '',
                    notes: '',
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
    case 9:
      {
        final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <PenaltyModel>[];
          } else {
            final list = List<PenaltyModel>.filled(
                length,
                PenaltyModel(
                  id: -9223372036854775808,
                  major: false,
                  type: '',
                  performerId: null,
                  teamId: -9223372036854775808,
                  improvisationId: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = PenaltyModel(
                    id: -9223372036854775808,
                    major: false,
                    type: '',
                    performerId: null,
                    teamId: -9223372036854775808,
                    improvisationId: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializePenaltyModel(objectReader);
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
    case 10:
      {
        final length = IsarCore.readList(reader, 10, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <PointModel>[];
          } else {
            final list = List<PointModel>.filled(
                length,
                PointModel(
                  id: -9223372036854775808,
                  teamId: -9223372036854775808,
                  improvisationId: -9223372036854775808,
                  value: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = PointModel(
                    id: -9223372036854775808,
                    teamId: -9223372036854775808,
                    improvisationId: -9223372036854775808,
                    value: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializePointModel(objectReader);
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
    case 12:
      {
        final length = IsarCore.readList(reader, 12, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <StarModel>[];
          } else {
            final list = List<StarModel>.filled(
                length,
                StarModel(
                  id: -9223372036854775808,
                  performerId: -9223372036854775808,
                  teamId: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = StarModel(
                    id: -9223372036854775808,
                    performerId: -9223372036854775808,
                    teamId: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeStarModel(objectReader);
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
    case 13:
      return IsarCore.readBool(reader, 13);
    case 14:
      return IsarCore.readBool(reader, 14);
    case 15:
      {
        if (IsarCore.readNull(reader, 15)) {
          return PenaltiesImpactType.addPoints;
        } else {
          return _matchModelPenaltiesImpactType[
                  IsarCore.readByte(reader, 15)] ??
              PenaltiesImpactType.addPoints;
        }
      }
    case 16:
      return IsarCore.readLong(reader, 16);
    case 17:
      return IsarCore.readBool(reader, 17);
    case 18:
      return IsarCore.readLong(reader, 18);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _MatchModelUpdate {
  bool call({
    required int id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
  });
}

class _MatchModelUpdateImpl implements _MatchModelUpdate {
  const _MatchModelUpdateImpl(this.collection);

  final IsarCollection<int, MatchModel> collection;

  @override
  bool call({
    required int id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (createdDate != ignore) 2: createdDate as DateTime?,
          if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
          if (integrationId != ignore) 4: integrationId as String?,
          if (integrationEntityId != ignore) 5: integrationEntityId as String?,
          if (name != ignore) 6: name as String?,
          if (enableStatistics != ignore) 13: enableStatistics as bool?,
          if (enablePenaltiesImpactPoints != ignore)
            14: enablePenaltiesImpactPoints as bool?,
          if (penaltiesImpactType != ignore)
            15: penaltiesImpactType as PenaltiesImpactType?,
          if (penaltiesRequiredToImpactPoints != ignore)
            16: penaltiesRequiredToImpactPoints as int?,
          if (enableMatchExpulsion != ignore) 17: enableMatchExpulsion as bool?,
          if (penaltiesRequiredToExpel != ignore)
            18: penaltiesRequiredToExpel as int?,
        }) >
        0;
  }
}

sealed class _MatchModelUpdateAll {
  int call({
    required List<int> id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
  });
}

class _MatchModelUpdateAllImpl implements _MatchModelUpdateAll {
  const _MatchModelUpdateAllImpl(this.collection);

  final IsarCollection<int, MatchModel> collection;

  @override
  int call({
    required List<int> id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
  }) {
    return collection.updateProperties(id, {
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (integrationId != ignore) 4: integrationId as String?,
      if (integrationEntityId != ignore) 5: integrationEntityId as String?,
      if (name != ignore) 6: name as String?,
      if (enableStatistics != ignore) 13: enableStatistics as bool?,
      if (enablePenaltiesImpactPoints != ignore)
        14: enablePenaltiesImpactPoints as bool?,
      if (penaltiesImpactType != ignore)
        15: penaltiesImpactType as PenaltiesImpactType?,
      if (penaltiesRequiredToImpactPoints != ignore)
        16: penaltiesRequiredToImpactPoints as int?,
      if (enableMatchExpulsion != ignore) 17: enableMatchExpulsion as bool?,
      if (penaltiesRequiredToExpel != ignore)
        18: penaltiesRequiredToExpel as int?,
    });
  }
}

extension MatchModelUpdate on IsarCollection<int, MatchModel> {
  _MatchModelUpdate get update => _MatchModelUpdateImpl(this);

  _MatchModelUpdateAll get updateAll => _MatchModelUpdateAllImpl(this);
}

sealed class _MatchModelQueryUpdate {
  int call({
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? integrationId,
    String? integrationEntityId,
    String? name,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
  });
}

class _MatchModelQueryUpdateImpl implements _MatchModelQueryUpdate {
  const _MatchModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<MatchModel> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (integrationId != ignore) 4: integrationId as String?,
      if (integrationEntityId != ignore) 5: integrationEntityId as String?,
      if (name != ignore) 6: name as String?,
      if (enableStatistics != ignore) 13: enableStatistics as bool?,
      if (enablePenaltiesImpactPoints != ignore)
        14: enablePenaltiesImpactPoints as bool?,
      if (penaltiesImpactType != ignore)
        15: penaltiesImpactType as PenaltiesImpactType?,
      if (penaltiesRequiredToImpactPoints != ignore)
        16: penaltiesRequiredToImpactPoints as int?,
      if (enableMatchExpulsion != ignore) 17: enableMatchExpulsion as bool?,
      if (penaltiesRequiredToExpel != ignore)
        18: penaltiesRequiredToExpel as int?,
    });
  }
}

extension MatchModelQueryUpdate on IsarQuery<MatchModel> {
  _MatchModelQueryUpdate get updateFirst =>
      _MatchModelQueryUpdateImpl(this, limit: 1);

  _MatchModelQueryUpdate get updateAll => _MatchModelQueryUpdateImpl(this);
}

class _MatchModelQueryBuilderUpdateImpl implements _MatchModelQueryUpdate {
  const _MatchModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<MatchModel, MatchModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? name = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (createdDate != ignore) 2: createdDate as DateTime?,
        if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
        if (integrationId != ignore) 4: integrationId as String?,
        if (integrationEntityId != ignore) 5: integrationEntityId as String?,
        if (name != ignore) 6: name as String?,
        if (enableStatistics != ignore) 13: enableStatistics as bool?,
        if (enablePenaltiesImpactPoints != ignore)
          14: enablePenaltiesImpactPoints as bool?,
        if (penaltiesImpactType != ignore)
          15: penaltiesImpactType as PenaltiesImpactType?,
        if (penaltiesRequiredToImpactPoints != ignore)
          16: penaltiesRequiredToImpactPoints as int?,
        if (enableMatchExpulsion != ignore) 17: enableMatchExpulsion as bool?,
        if (penaltiesRequiredToExpel != ignore)
          18: penaltiesRequiredToExpel as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension MatchModelQueryBuilderUpdate
    on QueryBuilder<MatchModel, MatchModel, QOperations> {
  _MatchModelQueryUpdate get updateFirst =>
      _MatchModelQueryBuilderUpdateImpl(this, limit: 1);

  _MatchModelQueryUpdate get updateAll =>
      _MatchModelQueryBuilderUpdateImpl(this);
}

const _matchModelPenaltiesImpactType = {
  0: PenaltiesImpactType.addPoints,
  1: PenaltiesImpactType.substractPoints,
};

extension MatchModelQueryFilter
    on QueryBuilder<MatchModel, MatchModel, QFilterCondition> {
  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementGreaterThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementGreaterThanOrEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementLessThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementLessThanOrEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementBetween(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementStartsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementEndsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesIsEmpty() {
    return not().teamNamesIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      integrationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      integrationIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> teamsIsEmpty() {
    return not().teamsIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      teamsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      improvisationsIsEmpty() {
    return not().improvisationsIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      improvisationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 8, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesIsEmpty() {
    return not().penaltiesIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 9, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> pointsIsEmpty() {
    return not().pointsIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      pointsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 10, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementGreaterThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementGreaterThanOrEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementLessThan(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementLessThanOrEqualTo(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementBetween(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementStartsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementEndsWith(
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 11, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition> starsIsEmpty() {
    return not().starsIsNotEmpty();
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      starsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 12, value: null),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      enableStatisticsEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      enablePenaltiesImpactPointsEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 14,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 15,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeGreaterThan(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 15,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeGreaterThanOrEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 15,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeLessThan(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 15,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeLessThanOrEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 15,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesImpactTypeBetween(
    PenaltiesImpactType lower,
    PenaltiesImpactType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 15,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 16,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 16,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      enableMatchExpulsionEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 17,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 18,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 18,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 18,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 18,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 18,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterFilterCondition>
      penaltiesRequiredToExpelBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 18,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension MatchModelQueryObject
    on QueryBuilder<MatchModel, MatchModel, QFilterCondition> {}

extension MatchModelQuerySortBy
    on QueryBuilder<MatchModel, MatchModel, QSortBy> {
  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByIntegrationEntityId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> sortByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByEnableStatisticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByEnablePenaltiesImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesImpactTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesRequiredToImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByEnableMatchExpulsionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      sortByPenaltiesRequiredToExpelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18, sort: Sort.desc);
    });
  }
}

extension MatchModelQuerySortThenBy
    on QueryBuilder<MatchModel, MatchModel, QSortThenBy> {
  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByIntegrationEntityId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy> thenByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByEnableStatisticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByEnablePenaltiesImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesImpactTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesRequiredToImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByEnableMatchExpulsionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterSortBy>
      thenByPenaltiesRequiredToExpelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18, sort: Sort.desc);
    });
  }
}

extension MatchModelQueryWhereDistinct
    on QueryBuilder<MatchModel, MatchModel, QDistinct> {
  QueryBuilder<MatchModel, MatchModel, QAfterDistinct> distinctByTeamNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct> distinctByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(13);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(14);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(15);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(16);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(17);
    });
  }

  QueryBuilder<MatchModel, MatchModel, QAfterDistinct>
      distinctByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(18);
    });
  }
}

extension MatchModelQueryProperty1
    on QueryBuilder<MatchModel, MatchModel, QProperty> {
  QueryBuilder<MatchModel, List<String>, QAfterProperty> teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchModel, DateTime?, QAfterProperty> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchModel, DateTime?, QAfterProperty> modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchModel, String?, QAfterProperty> integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchModel, String?, QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchModel, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchModel, List<MatchTeamModel>, QAfterProperty>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchModel, List<ImprovisationModel>, QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchModel, List<PenaltyModel>, QAfterProperty>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchModel, List<PointModel>, QAfterProperty> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchModel, List<String>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchModel, List<StarModel>, QAfterProperty> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchModel, bool, QAfterProperty> enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchModel, bool, QAfterProperty>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchModel, PenaltiesImpactType, QAfterProperty>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchModel, int, QAfterProperty>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchModel, bool, QAfterProperty>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchModel, int, QAfterProperty>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }
}

extension MatchModelQueryProperty2<R>
    on QueryBuilder<MatchModel, R, QAfterProperty> {
  QueryBuilder<MatchModel, (R, List<String>), QAfterProperty>
      teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchModel, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchModel, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchModel, (R, String?), QAfterProperty>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchModel, (R, String?), QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchModel, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchModel, (R, List<MatchTeamModel>), QAfterProperty>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchModel, (R, List<ImprovisationModel>), QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchModel, (R, List<PenaltyModel>), QAfterProperty>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchModel, (R, List<PointModel>), QAfterProperty>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchModel, (R, List<String>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchModel, (R, List<StarModel>), QAfterProperty>
      starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchModel, (R, bool), QAfterProperty>
      enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchModel, (R, bool), QAfterProperty>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchModel, (R, PenaltiesImpactType), QAfterProperty>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchModel, (R, int), QAfterProperty>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchModel, (R, bool), QAfterProperty>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchModel, (R, int), QAfterProperty>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }
}

extension MatchModelQueryProperty3<R1, R2>
    on QueryBuilder<MatchModel, (R1, R2), QAfterProperty> {
  QueryBuilder<MatchModel, (R1, R2, List<String>), QOperations>
      teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, String?), QOperations>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, String?), QOperations>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<MatchTeamModel>), QOperations>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<ImprovisationModel>), QOperations>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<PenaltyModel>), QOperations>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<PointModel>), QOperations>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<String>), QOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, List<StarModel>), QOperations>
      starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, bool), QOperations>
      enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, bool), QOperations>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, PenaltiesImpactType), QOperations>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, int), QOperations>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, bool), QOperations>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchModel, (R1, R2, int), QOperations>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => MatchTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      improvisations: (json['improvisations'] as List<dynamic>)
          .map((e) => ImprovisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      penalties: (json['penalties'] as List<dynamic>)
          .map((e) => PenaltyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      points: (json['points'] as List<dynamic>)
          .map((e) => PointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      stars: (json['stars'] as List<dynamic>?)
              ?.map((e) => StarModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      enableStatistics: json['enableStatistics'] as bool? ?? true,
      enablePenaltiesImpactPoints:
          json['enablePenaltiesImpactPoints'] as bool? ?? true,
      penaltiesImpactType: $enumDecodeNullable(
              _$PenaltiesImpactTypeEnumMap, json['penaltiesImpactType']) ??
          PenaltiesImpactType.addPoints,
      penaltiesRequiredToImpactPoints:
          (json['penaltiesRequiredToImpactPoints'] as num?)?.toInt() ?? 3,
      enableMatchExpulsion: json['enableMatchExpulsion'] as bool? ?? true,
      penaltiesRequiredToExpel:
          (json['penaltiesRequiredToExpel'] as num?)?.toInt() ?? 3,
      integrationId: json['integrationId'] as String?,
      integrationEntityId: json['integrationEntityId'] as String?,
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'teams': instance.teams,
      'improvisations': instance.improvisations,
      'penalties': instance.penalties,
      'points': instance.points,
      'tags': instance.tags,
      'stars': instance.stars,
      'enableStatistics': instance.enableStatistics,
      'enablePenaltiesImpactPoints': instance.enablePenaltiesImpactPoints,
      'penaltiesImpactType':
          _$PenaltiesImpactTypeEnumMap[instance.penaltiesImpactType]!,
      'penaltiesRequiredToImpactPoints':
          instance.penaltiesRequiredToImpactPoints,
      'enableMatchExpulsion': instance.enableMatchExpulsion,
      'penaltiesRequiredToExpel': instance.penaltiesRequiredToExpel,
      'integrationId': instance.integrationId,
      'integrationEntityId': instance.integrationEntityId,
    };

const _$PenaltiesImpactTypeEnumMap = {
  PenaltiesImpactType.addPoints: 'addPoints',
  PenaltiesImpactType.substractPoints: 'substractPoints',
};
