// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_suggestion_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCategorySuggestionModelCollection on Isar {
  IsarCollection<int, CategorySuggestionModel> get categorySuggestionModels =>
      this.collection();
}

const CategorySuggestionModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CategorySuggestionModel',
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
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CategorySuggestionModel>(
    serialize: serializeCategorySuggestionModel,
    deserialize: deserializeCategorySuggestionModel,
    deserializeProperty: deserializeCategorySuggestionModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCategorySuggestionModel(
    IsarWriter writer, CategorySuggestionModel object) {
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
  return object.id;
}

@isarProtected
CategorySuggestionModel deserializeCategorySuggestionModel(IsarReader reader) {
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
  final object = CategorySuggestionModel(
    id: _id,
    createdDate: _createdDate,
    modifiedDate: _modifiedDate,
    name: _name,
  );
  return object;
}

@isarProtected
dynamic deserializeCategorySuggestionModelProp(
    IsarReader reader, int property) {
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
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CategorySuggestionModelUpdate {
  bool call({
    required int id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
  });
}

class _CategorySuggestionModelUpdateImpl
    implements _CategorySuggestionModelUpdate {
  const _CategorySuggestionModelUpdateImpl(this.collection);

  final IsarCollection<int, CategorySuggestionModel> collection;

  @override
  bool call({
    required int id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (createdDate != ignore) 1: createdDate as DateTime?,
          if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
          if (name != ignore) 3: name as String?,
        }) >
        0;
  }
}

sealed class _CategorySuggestionModelUpdateAll {
  int call({
    required List<int> id,
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
  });
}

class _CategorySuggestionModelUpdateAllImpl
    implements _CategorySuggestionModelUpdateAll {
  const _CategorySuggestionModelUpdateAllImpl(this.collection);

  final IsarCollection<int, CategorySuggestionModel> collection;

  @override
  int call({
    required List<int> id,
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties(id, {
      if (createdDate != ignore) 1: createdDate as DateTime?,
      if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
      if (name != ignore) 3: name as String?,
    });
  }
}

extension CategorySuggestionModelUpdate
    on IsarCollection<int, CategorySuggestionModel> {
  _CategorySuggestionModelUpdate get update =>
      _CategorySuggestionModelUpdateImpl(this);

  _CategorySuggestionModelUpdateAll get updateAll =>
      _CategorySuggestionModelUpdateAllImpl(this);
}

sealed class _CategorySuggestionModelQueryUpdate {
  int call({
    DateTime? createdDate,
    DateTime? modifiedDate,
    String? name,
  });
}

class _CategorySuggestionModelQueryUpdateImpl
    implements _CategorySuggestionModelQueryUpdate {
  const _CategorySuggestionModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CategorySuggestionModel> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (createdDate != ignore) 1: createdDate as DateTime?,
      if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
      if (name != ignore) 3: name as String?,
    });
  }
}

extension CategorySuggestionModelQueryUpdate
    on IsarQuery<CategorySuggestionModel> {
  _CategorySuggestionModelQueryUpdate get updateFirst =>
      _CategorySuggestionModelQueryUpdateImpl(this, limit: 1);

  _CategorySuggestionModelQueryUpdate get updateAll =>
      _CategorySuggestionModelQueryUpdateImpl(this);
}

class _CategorySuggestionModelQueryBuilderUpdateImpl
    implements _CategorySuggestionModelQueryUpdate {
  const _CategorySuggestionModelQueryBuilderUpdateImpl(this.query,
      {this.limit});

  final QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QOperations> query;
  final int? limit;

  @override
  int call({
    Object? createdDate = ignore,
    Object? modifiedDate = ignore,
    Object? name = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (createdDate != ignore) 1: createdDate as DateTime?,
        if (modifiedDate != ignore) 2: modifiedDate as DateTime?,
        if (name != ignore) 3: name as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension CategorySuggestionModelQueryBuilderUpdate on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QOperations> {
  _CategorySuggestionModelQueryUpdate get updateFirst =>
      _CategorySuggestionModelQueryBuilderUpdateImpl(this, limit: 1);

  _CategorySuggestionModelQueryUpdate get updateAll =>
      _CategorySuggestionModelQueryBuilderUpdateImpl(this);
}

extension CategorySuggestionModelQueryFilter on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QFilterCondition> {
  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateGreaterThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateGreaterThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateLessThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateLessThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> createdDateBetween(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateGreaterThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateGreaterThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateLessThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateLessThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> modifiedDateBetween(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameGreaterThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameLessThanOrEqualTo(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension CategorySuggestionModelQueryObject on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QFilterCondition> {}

extension CategorySuggestionModelQuerySortBy
    on QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QSortBy> {
  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      sortByNameDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension CategorySuggestionModelQuerySortThenBy on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QSortThenBy> {
  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterSortBy>
      thenByNameDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension CategorySuggestionModelQueryWhereDistinct on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QDistinct> {
  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterDistinct>
      distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, CategorySuggestionModel, QAfterDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }
}

extension CategorySuggestionModelQueryProperty1 on QueryBuilder<
    CategorySuggestionModel, CategorySuggestionModel, QProperty> {
  QueryBuilder<CategorySuggestionModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CategorySuggestionModel, DateTime?, QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, DateTime?, QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CategorySuggestionModelQueryProperty2<R>
    on QueryBuilder<CategorySuggestionModel, R, QAfterProperty> {
  QueryBuilder<CategorySuggestionModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R, DateTime?), QAfterProperty>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R, DateTime?), QAfterProperty>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R, String), QAfterProperty>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CategorySuggestionModelQueryProperty3<R1, R2>
    on QueryBuilder<CategorySuggestionModel, (R1, R2), QAfterProperty> {
  QueryBuilder<CategorySuggestionModel, (R1, R2, int), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R1, R2, DateTime?), QOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R1, R2, DateTime?), QOperations>
      modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CategorySuggestionModel, (R1, R2, String), QOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategorySuggestionModelImpl _$$CategorySuggestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySuggestionModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$$CategorySuggestionModelImplToJson(
        _$CategorySuggestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
    };
