// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_model.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const StarModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'StarModel',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'performerId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'teamId',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, StarModel>(
    serialize: serializeStarModel,
    deserialize: deserializeStarModel,
  ),
);

@isarProtected
int serializeStarModel(IsarWriter writer, StarModel object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeLong(writer, 2, object.performerId);
  IsarCore.writeLong(writer, 3, object.teamId);
  return 0;
}

@isarProtected
StarModel deserializeStarModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final int _performerId;
  _performerId = IsarCore.readLong(reader, 2);
  final int _teamId;
  _teamId = IsarCore.readLong(reader, 3);
  final object = StarModel(
    id: _id,
    performerId: _performerId,
    teamId: _teamId,
  );
  return object;
}

extension StarModelQueryFilter
    on QueryBuilder<StarModel, StarModel, QFilterCondition> {
  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> idEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> idGreaterThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> idLessThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> performerIdEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      performerIdGreaterThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      performerIdGreaterThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> performerIdLessThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      performerIdLessThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> performerIdBetween(
    int lower,
    int upper,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> teamIdEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> teamIdGreaterThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      teamIdGreaterThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> teamIdLessThan(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition>
      teamIdLessThanOrEqualTo(
    int value,
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

  QueryBuilder<StarModel, StarModel, QAfterFilterCondition> teamIdBetween(
    int lower,
    int upper,
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
}

extension StarModelQueryObject
    on QueryBuilder<StarModel, StarModel, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StarModelImpl _$$StarModelImplFromJson(Map<String, dynamic> json) =>
    _$StarModelImpl(
      id: (json['id'] as num).toInt(),
      performerId: (json['performerId'] as num).toInt(),
      teamId: (json['teamId'] as num).toInt(),
    );

Map<String, dynamic> _$$StarModelImplToJson(_$StarModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'performerId': instance.performerId,
      'teamId': instance.teamId,
    };
