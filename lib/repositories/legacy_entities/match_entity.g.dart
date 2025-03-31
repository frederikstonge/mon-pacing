// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_entity.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetMatchEntityCollection on Isar {
  IsarCollection<int, MatchEntity> get matchModels => this.collection();
}

const MatchEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'MatchModel',
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
        name: 'integrationRestrictMaximumPointPerImprovisation',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'integrationMinNumberOfImprovisations',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'integrationMaxNumberOfImprovisations',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'integrationPenaltyTypes',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'teamNames',
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
  converter: IsarObjectConverter<int, MatchEntity>(
    serialize: serializeMatchEntity,
    deserialize: deserializeMatchEntity,
    deserializeProperty: deserializeMatchEntityProp,
  ),
  embeddedSchemas: [
    MatchTeamEntitySchema,
    PerformerEntitySchema,
    ImprovisationEntitySchema,
    PenaltyEntitySchema,
    PointEntitySchema,
    StarEntitySchema
  ],
);

@isarProtected
int serializeMatchEntity(IsarWriter writer, MatchEntity object) {
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
    final list = object.teams;
    final listWriter = IsarCore.beginList(writer, 4, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeMatchTeamEntity(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.improvisations;
    final listWriter = IsarCore.beginList(writer, 5, list.length);
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
  {
    final list = object.penalties;
    final listWriter = IsarCore.beginList(writer, 6, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializePenaltyEntity(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.points;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializePointEntity(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 8, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.stars;
    final listWriter = IsarCore.beginList(writer, 9, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeStarEntity(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeBool(writer, 10, object.enableStatistics);
  IsarCore.writeBool(writer, 11, object.enablePenaltiesImpactPoints);
  IsarCore.writeByte(writer, 12, object.penaltiesImpactType.index);
  IsarCore.writeLong(writer, 13, object.penaltiesRequiredToImpactPoints);
  IsarCore.writeBool(writer, 14, object.enableMatchExpulsion);
  IsarCore.writeLong(writer, 15, object.penaltiesRequiredToExpel);
  {
    final value = object.integrationId;
    if (value == null) {
      IsarCore.writeNull(writer, 16);
    } else {
      IsarCore.writeString(writer, 16, value);
    }
  }
  {
    final value = object.integrationEntityId;
    if (value == null) {
      IsarCore.writeNull(writer, 17);
    } else {
      IsarCore.writeString(writer, 17, value);
    }
  }
  {
    final value = object.integrationAdditionalData;
    if (value == null) {
      IsarCore.writeNull(writer, 18);
    } else {
      IsarCore.writeString(writer, 18, value);
    }
  }
  IsarCore.writeLong(
      writer,
      19,
      object.integrationRestrictMaximumPointPerImprovisation ??
          -9223372036854775808);
  IsarCore.writeLong(writer, 20,
      object.integrationMinNumberOfImprovisations ?? -9223372036854775808);
  IsarCore.writeLong(writer, 21,
      object.integrationMaxNumberOfImprovisations ?? -9223372036854775808);
  {
    final list = object.integrationPenaltyTypes;
    if (list == null) {
      IsarCore.writeNull(writer, 22);
    } else {
      final listWriter = IsarCore.beginList(writer, 22, list.length);
      for (var i = 0; i < list.length; i++) {
        IsarCore.writeString(listWriter, i, list[i]);
      }
      IsarCore.endList(writer, listWriter);
    }
  }
  {
    final list = object.teamNames;
    final listWriter = IsarCore.beginList(writer, 23, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
MatchEntity deserializeMatchEntity(IsarReader reader) {
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
  final List<MatchTeamEntity> _teams;
  {
    final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _teams = const <MatchTeamEntity>[];
      } else {
        final list = List<MatchTeamEntity>.filled(
            length,
            MatchTeamEntity(
              id: -9223372036854775808,
              name: '',
              color: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = MatchTeamEntity(
                id: -9223372036854775808,
                name: '',
                color: -9223372036854775808,
              );
            } else {
              final embedded = deserializeMatchTeamEntity(objectReader);
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
  final List<ImprovisationEntity> _improvisations;
  {
    final length = IsarCore.readList(reader, 5, IsarCore.readerPtrPtr);
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
  final List<PenaltyEntity> _penalties;
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _penalties = const <PenaltyEntity>[];
      } else {
        final list = List<PenaltyEntity>.filled(
            length,
            PenaltyEntity(
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
              list[i] = PenaltyEntity(
                id: -9223372036854775808,
                major: false,
                type: '',
                performerId: null,
                teamId: -9223372036854775808,
                improvisationId: -9223372036854775808,
              );
            } else {
              final embedded = deserializePenaltyEntity(objectReader);
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
  final List<PointEntity> _points;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _points = const <PointEntity>[];
      } else {
        final list = List<PointEntity>.filled(
            length,
            PointEntity(
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
              list[i] = PointEntity(
                id: -9223372036854775808,
                teamId: -9223372036854775808,
                improvisationId: -9223372036854775808,
                value: -9223372036854775808,
              );
            } else {
              final embedded = deserializePointEntity(objectReader);
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
    final length = IsarCore.readList(reader, 8, IsarCore.readerPtrPtr);
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
  final List<StarEntity> _stars;
  {
    final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _stars = const [];
      } else {
        final list = List<StarEntity>.filled(
            length,
            StarEntity(
              id: -9223372036854775808,
              performerId: -9223372036854775808,
              teamId: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = StarEntity(
                id: -9223372036854775808,
                performerId: -9223372036854775808,
                teamId: -9223372036854775808,
              );
            } else {
              final embedded = deserializeStarEntity(objectReader);
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
  {
    if (IsarCore.readNull(reader, 10)) {
      _enableStatistics = true;
    } else {
      _enableStatistics = IsarCore.readBool(reader, 10);
    }
  }
  final bool _enablePenaltiesImpactPoints;
  {
    if (IsarCore.readNull(reader, 11)) {
      _enablePenaltiesImpactPoints = true;
    } else {
      _enablePenaltiesImpactPoints = IsarCore.readBool(reader, 11);
    }
  }
  final PenaltiesImpactType _penaltiesImpactType;
  {
    if (IsarCore.readNull(reader, 12)) {
      _penaltiesImpactType = PenaltiesImpactType.addPoints;
    } else {
      _penaltiesImpactType =
          _matchEntityPenaltiesImpactType[IsarCore.readByte(reader, 12)] ??
              PenaltiesImpactType.addPoints;
    }
  }
  final int _penaltiesRequiredToImpactPoints;
  {
    final value = IsarCore.readLong(reader, 13);
    if (value == -9223372036854775808) {
      _penaltiesRequiredToImpactPoints = 3;
    } else {
      _penaltiesRequiredToImpactPoints = value;
    }
  }
  final bool _enableMatchExpulsion;
  {
    if (IsarCore.readNull(reader, 14)) {
      _enableMatchExpulsion = true;
    } else {
      _enableMatchExpulsion = IsarCore.readBool(reader, 14);
    }
  }
  final int _penaltiesRequiredToExpel;
  {
    final value = IsarCore.readLong(reader, 15);
    if (value == -9223372036854775808) {
      _penaltiesRequiredToExpel = 3;
    } else {
      _penaltiesRequiredToExpel = value;
    }
  }
  final String? _integrationId;
  _integrationId = IsarCore.readString(reader, 16);
  final String? _integrationEntityId;
  _integrationEntityId = IsarCore.readString(reader, 17);
  final String? _integrationAdditionalData;
  _integrationAdditionalData = IsarCore.readString(reader, 18);
  final int? _integrationRestrictMaximumPointPerImprovisation;
  {
    final value = IsarCore.readLong(reader, 19);
    if (value == -9223372036854775808) {
      _integrationRestrictMaximumPointPerImprovisation = null;
    } else {
      _integrationRestrictMaximumPointPerImprovisation = value;
    }
  }
  final int? _integrationMinNumberOfImprovisations;
  {
    final value = IsarCore.readLong(reader, 20);
    if (value == -9223372036854775808) {
      _integrationMinNumberOfImprovisations = null;
    } else {
      _integrationMinNumberOfImprovisations = value;
    }
  }
  final int? _integrationMaxNumberOfImprovisations;
  {
    final value = IsarCore.readLong(reader, 21);
    if (value == -9223372036854775808) {
      _integrationMaxNumberOfImprovisations = null;
    } else {
      _integrationMaxNumberOfImprovisations = value;
    }
  }
  final List<String>? _integrationPenaltyTypes;
  {
    final length = IsarCore.readList(reader, 22, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _integrationPenaltyTypes = null;
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        _integrationPenaltyTypes = list;
      }
    }
  }
  final object = MatchEntity(
    id: _id,
    name: _name,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
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
    integrationId: _integrationId,
    integrationEntityId: _integrationEntityId,
    integrationAdditionalData: _integrationAdditionalData,
    integrationRestrictMaximumPointPerImprovisation:
        _integrationRestrictMaximumPointPerImprovisation,
    integrationMinNumberOfImprovisations: _integrationMinNumberOfImprovisations,
    integrationMaxNumberOfImprovisations: _integrationMaxNumberOfImprovisations,
    integrationPenaltyTypes: _integrationPenaltyTypes,
  );
  return object;
}

@isarProtected
dynamic deserializeMatchEntityProp(IsarReader reader, int property) {
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
            return const <MatchTeamEntity>[];
          } else {
            final list = List<MatchTeamEntity>.filled(
                length,
                MatchTeamEntity(
                  id: -9223372036854775808,
                  name: '',
                  color: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = MatchTeamEntity(
                    id: -9223372036854775808,
                    name: '',
                    color: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeMatchTeamEntity(objectReader);
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
        final length = IsarCore.readList(reader, 5, IsarCore.readerPtrPtr);
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
    case 6:
      {
        final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <PenaltyEntity>[];
          } else {
            final list = List<PenaltyEntity>.filled(
                length,
                PenaltyEntity(
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
                  list[i] = PenaltyEntity(
                    id: -9223372036854775808,
                    major: false,
                    type: '',
                    performerId: null,
                    teamId: -9223372036854775808,
                    improvisationId: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializePenaltyEntity(objectReader);
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
    case 7:
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <PointEntity>[];
          } else {
            final list = List<PointEntity>.filled(
                length,
                PointEntity(
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
                  list[i] = PointEntity(
                    id: -9223372036854775808,
                    teamId: -9223372036854775808,
                    improvisationId: -9223372036854775808,
                    value: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializePointEntity(objectReader);
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
    case 9:
      {
        final length = IsarCore.readList(reader, 9, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const [];
          } else {
            final list = List<StarEntity>.filled(
                length,
                StarEntity(
                  id: -9223372036854775808,
                  performerId: -9223372036854775808,
                  teamId: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = StarEntity(
                    id: -9223372036854775808,
                    performerId: -9223372036854775808,
                    teamId: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeStarEntity(objectReader);
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
        if (IsarCore.readNull(reader, 10)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 10);
        }
      }
    case 11:
      {
        if (IsarCore.readNull(reader, 11)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 11);
        }
      }
    case 12:
      {
        if (IsarCore.readNull(reader, 12)) {
          return PenaltiesImpactType.addPoints;
        } else {
          return _matchEntityPenaltiesImpactType[
                  IsarCore.readByte(reader, 12)] ??
              PenaltiesImpactType.addPoints;
        }
      }
    case 13:
      {
        final value = IsarCore.readLong(reader, 13);
        if (value == -9223372036854775808) {
          return 3;
        } else {
          return value;
        }
      }
    case 14:
      {
        if (IsarCore.readNull(reader, 14)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 14);
        }
      }
    case 15:
      {
        final value = IsarCore.readLong(reader, 15);
        if (value == -9223372036854775808) {
          return 3;
        } else {
          return value;
        }
      }
    case 16:
      return IsarCore.readString(reader, 16);
    case 17:
      return IsarCore.readString(reader, 17);
    case 18:
      return IsarCore.readString(reader, 18);
    case 19:
      {
        final value = IsarCore.readLong(reader, 19);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 20:
      {
        final value = IsarCore.readLong(reader, 20);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 21:
      {
        final value = IsarCore.readLong(reader, 21);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 22:
      {
        final length = IsarCore.readList(reader, 22, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return null;
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
    case 23:
      {
        final length = IsarCore.readList(reader, 23, IsarCore.readerPtrPtr);
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

sealed class _MatchEntityUpdate {
  bool call({
    required int id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
    int? integrationRestrictMaximumPointPerImprovisation,
    int? integrationMinNumberOfImprovisations,
    int? integrationMaxNumberOfImprovisations,
  });
}

class _MatchEntityUpdateImpl implements _MatchEntityUpdate {
  const _MatchEntityUpdateImpl(this.collection);

  final IsarCollection<int, MatchEntity> collection;

  @override
  bool call({
    required int id,
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
    Object? integrationRestrictMaximumPointPerImprovisation = ignore,
    Object? integrationMinNumberOfImprovisations = ignore,
    Object? integrationMaxNumberOfImprovisations = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (name != ignore) 1: name as String?,
          if (createdDate != ignore) 2: createdDate as DateTime?,
          if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
          if (enableStatistics != ignore) 10: enableStatistics as bool?,
          if (enablePenaltiesImpactPoints != ignore)
            11: enablePenaltiesImpactPoints as bool?,
          if (penaltiesImpactType != ignore)
            12: penaltiesImpactType as PenaltiesImpactType?,
          if (penaltiesRequiredToImpactPoints != ignore)
            13: penaltiesRequiredToImpactPoints as int?,
          if (enableMatchExpulsion != ignore) 14: enableMatchExpulsion as bool?,
          if (penaltiesRequiredToExpel != ignore)
            15: penaltiesRequiredToExpel as int?,
          if (integrationId != ignore) 16: integrationId as String?,
          if (integrationEntityId != ignore) 17: integrationEntityId as String?,
          if (integrationAdditionalData != ignore)
            18: integrationAdditionalData as String?,
          if (integrationRestrictMaximumPointPerImprovisation != ignore)
            19: integrationRestrictMaximumPointPerImprovisation as int?,
          if (integrationMinNumberOfImprovisations != ignore)
            20: integrationMinNumberOfImprovisations as int?,
          if (integrationMaxNumberOfImprovisations != ignore)
            21: integrationMaxNumberOfImprovisations as int?,
        }) >
        0;
  }
}

sealed class _MatchEntityUpdateAll {
  int call({
    required List<int> id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
    int? integrationRestrictMaximumPointPerImprovisation,
    int? integrationMinNumberOfImprovisations,
    int? integrationMaxNumberOfImprovisations,
  });
}

class _MatchEntityUpdateAllImpl implements _MatchEntityUpdateAll {
  const _MatchEntityUpdateAllImpl(this.collection);

  final IsarCollection<int, MatchEntity> collection;

  @override
  int call({
    required List<int> id,
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
    Object? integrationRestrictMaximumPointPerImprovisation = ignore,
    Object? integrationMinNumberOfImprovisations = ignore,
    Object? integrationMaxNumberOfImprovisations = ignore,
  }) {
    return collection.updateProperties(id, {
      if (name != ignore) 1: name as String?,
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (enableStatistics != ignore) 10: enableStatistics as bool?,
      if (enablePenaltiesImpactPoints != ignore)
        11: enablePenaltiesImpactPoints as bool?,
      if (penaltiesImpactType != ignore)
        12: penaltiesImpactType as PenaltiesImpactType?,
      if (penaltiesRequiredToImpactPoints != ignore)
        13: penaltiesRequiredToImpactPoints as int?,
      if (enableMatchExpulsion != ignore) 14: enableMatchExpulsion as bool?,
      if (penaltiesRequiredToExpel != ignore)
        15: penaltiesRequiredToExpel as int?,
      if (integrationId != ignore) 16: integrationId as String?,
      if (integrationEntityId != ignore) 17: integrationEntityId as String?,
      if (integrationAdditionalData != ignore)
        18: integrationAdditionalData as String?,
      if (integrationRestrictMaximumPointPerImprovisation != ignore)
        19: integrationRestrictMaximumPointPerImprovisation as int?,
      if (integrationMinNumberOfImprovisations != ignore)
        20: integrationMinNumberOfImprovisations as int?,
      if (integrationMaxNumberOfImprovisations != ignore)
        21: integrationMaxNumberOfImprovisations as int?,
    });
  }
}

extension MatchEntityUpdate on IsarCollection<int, MatchEntity> {
  _MatchEntityUpdate get update => _MatchEntityUpdateImpl(this);

  _MatchEntityUpdateAll get updateAll => _MatchEntityUpdateAllImpl(this);
}

sealed class _MatchEntityQueryUpdate {
  int call({
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    bool? enableStatistics,
    bool? enablePenaltiesImpactPoints,
    PenaltiesImpactType? penaltiesImpactType,
    int? penaltiesRequiredToImpactPoints,
    bool? enableMatchExpulsion,
    int? penaltiesRequiredToExpel,
    String? integrationId,
    String? integrationEntityId,
    String? integrationAdditionalData,
    int? integrationRestrictMaximumPointPerImprovisation,
    int? integrationMinNumberOfImprovisations,
    int? integrationMaxNumberOfImprovisations,
  });
}

class _MatchEntityQueryUpdateImpl implements _MatchEntityQueryUpdate {
  const _MatchEntityQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<MatchEntity> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
    Object? integrationRestrictMaximumPointPerImprovisation = ignore,
    Object? integrationMinNumberOfImprovisations = ignore,
    Object? integrationMaxNumberOfImprovisations = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 1: name as String?,
      if (createdDate != ignore) 2: createdDate as DateTime?,
      if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
      if (enableStatistics != ignore) 10: enableStatistics as bool?,
      if (enablePenaltiesImpactPoints != ignore)
        11: enablePenaltiesImpactPoints as bool?,
      if (penaltiesImpactType != ignore)
        12: penaltiesImpactType as PenaltiesImpactType?,
      if (penaltiesRequiredToImpactPoints != ignore)
        13: penaltiesRequiredToImpactPoints as int?,
      if (enableMatchExpulsion != ignore) 14: enableMatchExpulsion as bool?,
      if (penaltiesRequiredToExpel != ignore)
        15: penaltiesRequiredToExpel as int?,
      if (integrationId != ignore) 16: integrationId as String?,
      if (integrationEntityId != ignore) 17: integrationEntityId as String?,
      if (integrationAdditionalData != ignore)
        18: integrationAdditionalData as String?,
      if (integrationRestrictMaximumPointPerImprovisation != ignore)
        19: integrationRestrictMaximumPointPerImprovisation as int?,
      if (integrationMinNumberOfImprovisations != ignore)
        20: integrationMinNumberOfImprovisations as int?,
      if (integrationMaxNumberOfImprovisations != ignore)
        21: integrationMaxNumberOfImprovisations as int?,
    });
  }
}

extension MatchEntityQueryUpdate on IsarQuery<MatchEntity> {
  _MatchEntityQueryUpdate get updateFirst =>
      _MatchEntityQueryUpdateImpl(this, limit: 1);

  _MatchEntityQueryUpdate get updateAll => _MatchEntityQueryUpdateImpl(this);
}

class _MatchEntityQueryBuilderUpdateImpl implements _MatchEntityQueryUpdate {
  const _MatchEntityQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<MatchEntity, MatchEntity, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? enableStatistics = ignore,
    Object? enablePenaltiesImpactPoints = ignore,
    Object? penaltiesImpactType = ignore,
    Object? penaltiesRequiredToImpactPoints = ignore,
    Object? enableMatchExpulsion = ignore,
    Object? penaltiesRequiredToExpel = ignore,
    Object? integrationId = ignore,
    Object? integrationEntityId = ignore,
    Object? integrationAdditionalData = ignore,
    Object? integrationRestrictMaximumPointPerImprovisation = ignore,
    Object? integrationMinNumberOfImprovisations = ignore,
    Object? integrationMaxNumberOfImprovisations = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 1: name as String?,
        if (createdDate != ignore) 2: createdDate as DateTime?,
        if (modifiedDate != ignore) 3: modifiedDate as DateTime?,
        if (enableStatistics != ignore) 10: enableStatistics as bool?,
        if (enablePenaltiesImpactPoints != ignore)
          11: enablePenaltiesImpactPoints as bool?,
        if (penaltiesImpactType != ignore)
          12: penaltiesImpactType as PenaltiesImpactType?,
        if (penaltiesRequiredToImpactPoints != ignore)
          13: penaltiesRequiredToImpactPoints as int?,
        if (enableMatchExpulsion != ignore) 14: enableMatchExpulsion as bool?,
        if (penaltiesRequiredToExpel != ignore)
          15: penaltiesRequiredToExpel as int?,
        if (integrationId != ignore) 16: integrationId as String?,
        if (integrationEntityId != ignore) 17: integrationEntityId as String?,
        if (integrationAdditionalData != ignore)
          18: integrationAdditionalData as String?,
        if (integrationRestrictMaximumPointPerImprovisation != ignore)
          19: integrationRestrictMaximumPointPerImprovisation as int?,
        if (integrationMinNumberOfImprovisations != ignore)
          20: integrationMinNumberOfImprovisations as int?,
        if (integrationMaxNumberOfImprovisations != ignore)
          21: integrationMaxNumberOfImprovisations as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension MatchEntityQueryBuilderUpdate
    on QueryBuilder<MatchEntity, MatchEntity, QOperations> {
  _MatchEntityQueryUpdate get updateFirst =>
      _MatchEntityQueryBuilderUpdateImpl(this, limit: 1);

  _MatchEntityQueryUpdate get updateAll =>
      _MatchEntityQueryBuilderUpdateImpl(this);
}

const _matchEntityPenaltiesImpactType = {
  0: PenaltiesImpactType.addPoints,
  1: PenaltiesImpactType.substractPoints,
};

extension MatchEntityQueryFilter
    on QueryBuilder<MatchEntity, MatchEntity, QFilterCondition> {
  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> teamsIsEmpty() {
    return not().teamsIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 4, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      improvisationsIsEmpty() {
    return not().improvisationsIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      improvisationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 5, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesIsEmpty() {
    return not().penaltiesIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      pointsIsEmpty() {
    return not().pointsIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      pointsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementGreaterThanOrEqualTo(
    String value, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementLessThanOrEqualTo(
    String value, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementStartsWith(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementEndsWith(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 8, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition> starsIsEmpty() {
    return not().starsIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      starsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 9, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      enableStatisticsEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      enablePenaltiesImpactPointsEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 12,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeGreaterThan(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 12,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeGreaterThanOrEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 12,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeLessThan(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 12,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeLessThanOrEqualTo(
    PenaltiesImpactType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 12,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesImpactTypeBetween(
    PenaltiesImpactType lower,
    PenaltiesImpactType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 12,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsEqualTo(
    int value,
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 13,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToImpactPointsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 13,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      enableMatchExpulsionEqualTo(
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

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 15,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      penaltiesRequiredToExpelBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 15,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 16));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 16));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 16,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 16,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 16,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 16,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 16,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 17));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 17));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 17,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 17,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 17,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 17,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationEntityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 17,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 18));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 18));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 18,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 18,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 18,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 18,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationAdditionalDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 18,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 19));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 19));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 19,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 19,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 19,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 19,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 19,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationRestrictMaximumPointPerImprovisationBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 19,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 20));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 20));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 20,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 20,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 20,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 20,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 20,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMinNumberOfImprovisationsBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 20,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 21));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 21));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 21,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 21,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 21,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 21,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 21,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationMaxNumberOfImprovisationsBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 21,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 22));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 22));
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 22,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 22,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 22,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 22,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 22,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesIsEmpty() {
    return not().group(
      (q) => q
          .integrationPenaltyTypesIsNull()
          .or()
          .integrationPenaltyTypesIsNotEmpty(),
    );
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      integrationPenaltyTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 22, value: null),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 23,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 23,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 23,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 23,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 23,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesIsEmpty() {
    return not().teamNamesIsNotEmpty();
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterFilterCondition>
      teamNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 23, value: null),
      );
    });
  }
}

extension MatchEntityQueryObject
    on QueryBuilder<MatchEntity, MatchEntity, QFilterCondition> {}

extension MatchEntityQuerySortBy
    on QueryBuilder<MatchEntity, MatchEntity, QSortBy> {
  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnableStatisticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnablePenaltiesImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesImpactTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesRequiredToImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByEnableMatchExpulsionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByPenaltiesRequiredToExpelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        16,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> sortByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        16,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        17,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        17,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        18,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationAdditionalDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        18,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationRestrictMaximumPointPerImprovisation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(19);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationRestrictMaximumPointPerImprovisationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(19, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationMinNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(20);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationMinNumberOfImprovisationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(20, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationMaxNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(21);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      sortByIntegrationMaxNumberOfImprovisationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(21, sort: Sort.desc);
    });
  }
}

extension MatchEntityQuerySortThenBy
    on QueryBuilder<MatchEntity, MatchEntity, QSortThenBy> {
  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnableStatisticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnablePenaltiesImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesImpactTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesRequiredToImpactPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByEnableMatchExpulsionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(14, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByPenaltiesRequiredToExpelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(15, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByIntegrationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy> thenByIntegrationIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(16, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationEntityIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(17, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationAdditionalDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(18, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationRestrictMaximumPointPerImprovisation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(19);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationRestrictMaximumPointPerImprovisationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(19, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationMinNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(20);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationMinNumberOfImprovisationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(20, sort: Sort.desc);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationMaxNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(21);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterSortBy>
      thenByIntegrationMaxNumberOfImprovisationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(21, sort: Sort.desc);
    });
  }
}

extension MatchEntityQueryWhereDistinct
    on QueryBuilder<MatchEntity, MatchEntity, QDistinct> {
  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByEnableStatistics() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByEnablePenaltiesImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByPenaltiesImpactType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(12);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByPenaltiesRequiredToImpactPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(13);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByEnableMatchExpulsion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(14);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByPenaltiesRequiredToExpel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(15);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(16, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(17, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationAdditionalData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(18, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationRestrictMaximumPointPerImprovisation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(19);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationMinNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(20);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationMaxNumberOfImprovisations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(21);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct>
      distinctByIntegrationPenaltyTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(22);
    });
  }

  QueryBuilder<MatchEntity, MatchEntity, QAfterDistinct> distinctByTeamNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(23);
    });
  }
}

extension MatchEntityQueryProperty1
    on QueryBuilder<MatchEntity, MatchEntity, QProperty> {
  QueryBuilder<MatchEntity, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchEntity, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchEntity, DateTime?, QAfterProperty> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchEntity, DateTime?, QAfterProperty> modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchEntity, List<MatchTeamEntity>, QAfterProperty>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchEntity, List<ImprovisationEntity>, QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchEntity, List<PenaltyEntity>, QAfterProperty>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchEntity, List<PointEntity>, QAfterProperty>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchEntity, List<String>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchEntity, List<StarEntity>, QAfterProperty> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchEntity, bool, QAfterProperty> enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchEntity, bool, QAfterProperty>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchEntity, PenaltiesImpactType, QAfterProperty>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchEntity, int, QAfterProperty>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchEntity, bool, QAfterProperty>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchEntity, int, QAfterProperty>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchEntity, String?, QAfterProperty> integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchEntity, String?, QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchEntity, String?, QAfterProperty>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }

  QueryBuilder<MatchEntity, int?, QAfterProperty>
      integrationRestrictMaximumPointPerImprovisationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(19);
    });
  }

  QueryBuilder<MatchEntity, int?, QAfterProperty>
      integrationMinNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(20);
    });
  }

  QueryBuilder<MatchEntity, int?, QAfterProperty>
      integrationMaxNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(21);
    });
  }

  QueryBuilder<MatchEntity, List<String>?, QAfterProperty>
      integrationPenaltyTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(22);
    });
  }

  QueryBuilder<MatchEntity, List<String>, QAfterProperty> teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(23);
    });
  }
}

extension MatchEntityQueryProperty2<R>
    on QueryBuilder<MatchEntity, R, QAfterProperty> {
  QueryBuilder<MatchEntity, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchEntity, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchEntity, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchEntity, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchEntity, (R, List<MatchTeamEntity>), QAfterProperty>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchEntity, (R, List<ImprovisationEntity>), QAfterProperty>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchEntity, (R, List<PenaltyEntity>), QAfterProperty>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchEntity, (R, List<PointEntity>), QAfterProperty>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchEntity, (R, List<String>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchEntity, (R, List<StarEntity>), QAfterProperty>
      starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchEntity, (R, bool), QAfterProperty>
      enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchEntity, (R, bool), QAfterProperty>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchEntity, (R, PenaltiesImpactType), QAfterProperty>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchEntity, (R, int), QAfterProperty>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchEntity, (R, bool), QAfterProperty>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchEntity, (R, int), QAfterProperty>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchEntity, (R, String?), QAfterProperty>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchEntity, (R, String?), QAfterProperty>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchEntity, (R, String?), QAfterProperty>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }

  QueryBuilder<MatchEntity, (R, int?), QAfterProperty>
      integrationRestrictMaximumPointPerImprovisationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(19);
    });
  }

  QueryBuilder<MatchEntity, (R, int?), QAfterProperty>
      integrationMinNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(20);
    });
  }

  QueryBuilder<MatchEntity, (R, int?), QAfterProperty>
      integrationMaxNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(21);
    });
  }

  QueryBuilder<MatchEntity, (R, List<String>?), QAfterProperty>
      integrationPenaltyTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(22);
    });
  }

  QueryBuilder<MatchEntity, (R, List<String>), QAfterProperty>
      teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(23);
    });
  }
}

extension MatchEntityQueryProperty3<R1, R2>
    on QueryBuilder<MatchEntity, (R1, R2), QAfterProperty> {
  QueryBuilder<MatchEntity, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<MatchTeamEntity>), QOperations>
      teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<ImprovisationEntity>), QOperations>
      improvisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<PenaltyEntity>), QOperations>
      penaltiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<PointEntity>), QOperations>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<String>), QOperations>
      tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<StarEntity>), QOperations>
      starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, bool), QOperations>
      enableStatisticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, bool), QOperations>
      enablePenaltiesImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, PenaltiesImpactType), QOperations>
      penaltiesImpactTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, int), QOperations>
      penaltiesRequiredToImpactPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, bool), QOperations>
      enableMatchExpulsionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(14);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, int), QOperations>
      penaltiesRequiredToExpelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(15);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, String?), QOperations>
      integrationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(16);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, String?), QOperations>
      integrationEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(17);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, String?), QOperations>
      integrationAdditionalDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(18);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, int?), QOperations>
      integrationRestrictMaximumPointPerImprovisationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(19);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, int?), QOperations>
      integrationMinNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(20);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, int?), QOperations>
      integrationMaxNumberOfImprovisationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(21);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<String>?), QOperations>
      integrationPenaltyTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(22);
    });
  }

  QueryBuilder<MatchEntity, (R1, R2, List<String>), QOperations>
      teamNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(23);
    });
  }
}
