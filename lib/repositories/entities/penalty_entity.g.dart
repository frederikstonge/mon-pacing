// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_entity.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const PenaltyEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PenaltyModel',
    embedded: true,
    properties: [
      IsarPropertySchema(name: 'id', type: IsarType.long),
      IsarPropertySchema(name: 'major', type: IsarType.bool),
      IsarPropertySchema(name: 'type', type: IsarType.string),
      IsarPropertySchema(name: 'performerId', type: IsarType.long),
      IsarPropertySchema(name: 'teamId', type: IsarType.long),
      IsarPropertySchema(name: 'improvisationId', type: IsarType.long),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, PenaltyEntity>(
    serialize: serializePenaltyEntity,
    deserialize: deserializePenaltyEntity,
  ),
);

@isarProtected
int serializePenaltyEntity(IsarWriter writer, PenaltyEntity object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeBool(writer, 2, object.major);
  IsarCore.writeString(writer, 3, object.type);
  IsarCore.writeLong(writer, 4, object.performerId ?? -9223372036854775808);
  IsarCore.writeLong(writer, 5, object.teamId);
  IsarCore.writeLong(writer, 6, object.improvisationId);
  return 0;
}

@isarProtected
PenaltyEntity deserializePenaltyEntity(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final bool _major;
  _major = IsarCore.readBool(reader, 2);
  final String _type;
  _type = IsarCore.readString(reader, 3) ?? '';
  final int? _performerId;
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      _performerId = null;
    } else {
      _performerId = value;
    }
  }
  final int _teamId;
  _teamId = IsarCore.readLong(reader, 5);
  final int _improvisationId;
  _improvisationId = IsarCore.readLong(reader, 6);
  final object = PenaltyEntity(
    id: _id,
    major: _major,
    type: _type,
    performerId: _performerId,
    teamId: _teamId,
    improvisationId: _improvisationId,
  );
  return object;
}

extension PenaltyEntityQueryFilter on QueryBuilder<PenaltyEntity, PenaltyEntity, QFilterCondition> {
  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 1, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> majorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(StartsWithCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EndsWithCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(ContainsCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(MatchesCondition(property: 3, wildcard: pattern, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const EqualCondition(property: 3, value: ''));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const GreaterCondition(property: 3, value: ''));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdGreaterThan(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdGreaterThanOrEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdLessThan(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdLessThanOrEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> performerIdBetween(int? lower, int? upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 4, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 5, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 5, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 5, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 5, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 5, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> teamIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 5, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 6, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 6, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 6, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 6, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 6, value: value));
    });
  }

  QueryBuilder<PenaltyEntity, PenaltyEntity, QAfterFilterCondition> improvisationIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 6, lower: lower, upper: upper));
    });
  }
}

extension PenaltyEntityQueryObject on QueryBuilder<PenaltyEntity, PenaltyEntity, QFilterCondition> {}
