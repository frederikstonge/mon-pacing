// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performer_entity.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const PerformerEntitySchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PerformerModel',
    embedded: true,
    properties: [
      IsarPropertySchema(name: 'id', type: IsarType.long),
      IsarPropertySchema(name: 'name', type: IsarType.string),
      IsarPropertySchema(name: 'integrationEntityId', type: IsarType.string),
      IsarPropertySchema(name: 'integrationAdditionalData', type: IsarType.string),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, PerformerEntity>(
    serialize: serializePerformerEntity,
    deserialize: deserializePerformerEntity,
  ),
);

@isarProtected
int serializePerformerEntity(IsarWriter writer, PerformerEntity object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.name);
  {
    final value = object.integrationEntityId;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  {
    final value = object.integrationAdditionalData;
    if (value == null) {
      IsarCore.writeNull(writer, 4);
    } else {
      IsarCore.writeString(writer, 4, value);
    }
  }
  return 0;
}

@isarProtected
PerformerEntity deserializePerformerEntity(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final String _name;
  _name = IsarCore.readString(reader, 2) ?? '';
  final String? _integrationEntityId;
  _integrationEntityId = IsarCore.readString(reader, 3);
  final String? _integrationAdditionalData;
  _integrationAdditionalData = IsarCore.readString(reader, 4);
  final object = PerformerEntity(
    id: _id,
    name: _name,
    integrationEntityId: _integrationEntityId,
    integrationAdditionalData: _integrationAdditionalData,
  );
  return object;
}

extension PerformerEntityQueryFilter on QueryBuilder<PerformerEntity, PerformerEntity, QFilterCondition> {
  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idGreaterThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idLessThanOrEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 1, value: value));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> idBetween(int lower, int upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(BetweenCondition(property: 1, lower: lower, upper: upper));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 2, lower: lower, upper: upper, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(StartsWithCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EndsWithCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(ContainsCondition(property: 2, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(MatchesCondition(property: 2, wildcard: pattern, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const EqualCondition(property: 2, value: ''));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const GreaterCondition(property: 2, value: ''));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(StartsWithCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EndsWithCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(ContainsCondition(property: 3, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(MatchesCondition(property: 3, wildcard: pattern, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const EqualCondition(property: 3, value: ''));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationEntityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const GreaterCondition(property: 3, value: ''));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EqualCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(GreaterOrEqualCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessOrEqualCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 4, lower: lower, upper: upper, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(StartsWithCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(EndsWithCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(ContainsCondition(property: 4, value: value, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(MatchesCondition(property: 4, wildcard: pattern, caseSensitive: caseSensitive));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const EqualCondition(property: 4, value: ''));
    });
  }

  QueryBuilder<PerformerEntity, PerformerEntity, QAfterFilterCondition> integrationAdditionalDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const GreaterCondition(property: 4, value: ''));
    });
  }
}

extension PerformerEntityQueryObject on QueryBuilder<PerformerEntity, PerformerEntity, QFilterCondition> {}
