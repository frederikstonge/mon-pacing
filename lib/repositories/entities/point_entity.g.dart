// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_entity.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const PointEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PointModel',
    embedded: true,
    properties: [
      IsarPropertySchema(name: 'id', type: IsarType.long),
      IsarPropertySchema(name: 'teamId', type: IsarType.long),
      IsarPropertySchema(name: 'improvisationId', type: IsarType.long),
      IsarPropertySchema(name: 'value', type: IsarType.long),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, PointEntity>(
    serialize: serializePointEntity,
    deserialize: deserializePointEntity,
  ),
);

@isarProtected
int serializePointEntity(IsarWriter writer, PointEntity object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeLong(writer, 2, object.teamId);
  IsarCore.writeLong(writer, 3, object.improvisationId);
  IsarCore.writeLong(writer, 4, object.value);
  return 0;
}

@isarProtected
PointEntity deserializePointEntity(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final int _teamId;
  _teamId = IsarCore.readLong(reader, 2);
  final int _improvisationId;
  _improvisationId = IsarCore.readLong(reader, 3);
  final int _value;
  _value = IsarCore.readLong(reader, 4);
  final object = PointEntity(id: _id, teamId: _teamId, improvisationId: _improvisationId, value: _value);
  return object;
}

extension PointEntityQueryFilter on QueryBuilder<PointEntity, PointEntity, QFilterCondition> {
  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 1, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> teamIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 2, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 3, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> improvisationIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 3, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 4, value: value));
    });
  }

  QueryBuilder<PointEntity, PointEntity, QAfterFilterCondition> valueBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 4, lower: lower, upper: upper));
    });
  }
}

extension PointEntityQueryObject on QueryBuilder<PointEntity, PointEntity, QFilterCondition> {}
