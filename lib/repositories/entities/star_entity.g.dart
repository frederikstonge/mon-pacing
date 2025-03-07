// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_entity.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const StarEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'StarModel',
    embedded: true,
    properties: [
      IsarPropertySchema(name: 'id', type: IsarType.long),
      IsarPropertySchema(name: 'performerId', type: IsarType.long),
      IsarPropertySchema(name: 'teamId', type: IsarType.long),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, StarEntity>(serialize: serializeStarEntity, deserialize: deserializeStarEntity),
);

@isarProtected
int serializeStarEntity(IsarWriter writer, StarEntity object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeLong(writer, 2, object.performerId);
  IsarCore.writeLong(writer, 3, object.teamId);
  return 0;
}

@isarProtected
StarEntity deserializeStarEntity(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final int _performerId;
  _performerId = IsarCore.readLong(reader, 2);
  final int _teamId;
  _teamId = IsarCore.readLong(reader, 3);
  final object = StarEntity(id: _id, performerId: _performerId, teamId: _teamId);
  return object;
}

extension StarEntityQueryFilter on QueryBuilder<StarEntity, StarEntity, QFilterCondition> {
  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 1, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 1, lower: lower, upper: upper));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 2, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> performerIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 2, lower: lower, upper: upper));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 3, value: value));
    });
  }

  QueryBuilder<StarEntity, StarEntity, QAfterFilterCondition> teamIdBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 3, lower: lower, upper: upper));
    });
  }
}

extension StarEntityQueryObject on QueryBuilder<StarEntity, StarEntity, QFilterCondition> {}
