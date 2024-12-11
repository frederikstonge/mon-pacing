// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'improvisation_model.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const ImprovisationModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'ImprovisationModel',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'type',
        type: IsarType.byte,
        enumMap: {"mixed": 0, "compared": 1},
      ),
      IsarPropertySchema(
        name: 'category',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'theme',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'durationsInSeconds',
        type: IsarType.longList,
      ),
      IsarPropertySchema(
        name: 'performers',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'notes',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'timeBufferInSeconds',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'huddleTimerInSeconds',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'integrationEntityId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'integrationAdditionalData',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, ImprovisationModel>(
    serialize: serializeImprovisationModel,
    deserialize: deserializeImprovisationModel,
  ),
);

@isarProtected
int serializeImprovisationModel(IsarWriter writer, ImprovisationModel object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeByte(writer, 2, object.type.index);
  IsarCore.writeString(writer, 3, object.category);
  IsarCore.writeString(writer, 4, object.theme);
  {
    final list = object.durationsInSeconds;
    final listWriter = IsarCore.beginList(writer, 5, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeLong(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeString(writer, 6, object.performers);
  IsarCore.writeString(writer, 7, object.notes);
  IsarCore.writeLong(writer, 8, object.timeBufferInSeconds);
  IsarCore.writeLong(writer, 9, object.huddleTimerInSeconds);
  {
    final value = object.integrationEntityId;
    if (value == null) {
      IsarCore.writeNull(writer, 10);
    } else {
      IsarCore.writeString(writer, 10, value);
    }
  }
  {
    final value = object.integrationAdditionalData;
    if (value == null) {
      IsarCore.writeNull(writer, 11);
    } else {
      IsarCore.writeString(writer, 11, value);
    }
  }
  return 0;
}

@isarProtected
ImprovisationModel deserializeImprovisationModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readLong(reader, 1);
  final ImprovisationType _type;
  {
    if (IsarCore.readNull(reader, 2)) {
      _type = ImprovisationType.mixed;
    } else {
      _type = _improvisationModelType[IsarCore.readByte(reader, 2)] ??
          ImprovisationType.mixed;
    }
  }
  final String _category;
  _category = IsarCore.readString(reader, 3) ?? '';
  final String _theme;
  _theme = IsarCore.readString(reader, 4) ?? '';
  final List<int> _durationsInSeconds;
  {
    final length = IsarCore.readList(reader, 5, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _durationsInSeconds = const <int>[];
      } else {
        final list =
            List<int>.filled(length, -9223372036854775808, growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readLong(reader, i);
        }
        IsarCore.freeReader(reader);
        _durationsInSeconds = list;
      }
    }
  }
  final String _performers;
  _performers = IsarCore.readString(reader, 6) ?? '';
  final String _notes;
  _notes = IsarCore.readString(reader, 7) ?? '';
  final int _timeBufferInSeconds;
  _timeBufferInSeconds = IsarCore.readLong(reader, 8);
  final int _huddleTimerInSeconds;
  _huddleTimerInSeconds = IsarCore.readLong(reader, 9);
  final String? _integrationEntityId;
  _integrationEntityId = IsarCore.readString(reader, 10);
  final String? _integrationAdditionalData;
  _integrationAdditionalData = IsarCore.readString(reader, 11);
  final object = ImprovisationModel(
    id: _id,
    type: _type,
    category: _category,
    theme: _theme,
    durationsInSeconds: _durationsInSeconds,
    performers: _performers,
    notes: _notes,
    timeBufferInSeconds: _timeBufferInSeconds,
    huddleTimerInSeconds: _huddleTimerInSeconds,
    integrationEntityId: _integrationEntityId,
    integrationAdditionalData: _integrationAdditionalData,
  );
  return object;
}

const _improvisationModelType = {
  0: ImprovisationType.mixed,
  1: ImprovisationType.compared,
};

extension ImprovisationModelQueryFilter
    on QueryBuilder<ImprovisationModel, ImprovisationModel, QFilterCondition> {
  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      idEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeEqualTo(
    ImprovisationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeGreaterThan(
    ImprovisationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeGreaterThanOrEqualTo(
    ImprovisationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeLessThan(
    ImprovisationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeLessThanOrEqualTo(
    ImprovisationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      typeBetween(
    ImprovisationType lower,
    ImprovisationType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryGreaterThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryGreaterThanOrEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryLessThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryLessThanOrEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryBetween(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryStartsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryEndsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeEqualTo(
    String value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeGreaterThan(
    String value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeGreaterThanOrEqualTo(
    String value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeLessThan(
    String value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeLessThanOrEqualTo(
    String value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeStartsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeEndsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      themeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsElementBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsIsEmpty() {
    return not().durationsInSecondsIsNotEmpty();
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      durationsInSecondsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 5, value: null),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersGreaterThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersGreaterThanOrEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersLessThan(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersLessThanOrEqualTo(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersBetween(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersStartsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersEndsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      performersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 7,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      timeBufferInSecondsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      huddleTimerInSecondsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 10,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 10,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationEntityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 10,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataEqualTo(
    String? value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataGreaterThan(
    String? value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataLessThan(
    String? value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataStartsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataEndsWith(
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataContains(String value,
          {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataMatches(String pattern,
          {bool caseSensitive = true}) {
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

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ImprovisationModel, ImprovisationModel, QAfterFilterCondition>
      integrationAdditionalDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }
}

extension ImprovisationModelQueryObject
    on QueryBuilder<ImprovisationModel, ImprovisationModel, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImprovisationModelImpl _$$ImprovisationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImprovisationModelImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$ImprovisationTypeEnumMap, json['type']),
      category: json['category'] as String,
      theme: json['theme'] as String,
      durationsInSeconds: (json['durationsInSeconds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      performers: json['performers'] as String,
      notes: json['notes'] as String,
      timeBufferInSeconds: (json['timeBufferInSeconds'] as num?)?.toInt() ?? 30,
      huddleTimerInSeconds:
          (json['huddleTimerInSeconds'] as num?)?.toInt() ?? 30,
      integrationEntityId: json['integrationEntityId'] as String?,
      integrationAdditionalData: json['integrationAdditionalData'] as String?,
    );

Map<String, dynamic> _$$ImprovisationModelImplToJson(
        _$ImprovisationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ImprovisationTypeEnumMap[instance.type]!,
      'category': instance.category,
      'theme': instance.theme,
      'durationsInSeconds': instance.durationsInSeconds,
      'performers': instance.performers,
      'notes': instance.notes,
      'timeBufferInSeconds': instance.timeBufferInSeconds,
      'huddleTimerInSeconds': instance.huddleTimerInSeconds,
      'integrationEntityId': instance.integrationEntityId,
      'integrationAdditionalData': instance.integrationAdditionalData,
    };

const _$ImprovisationTypeEnumMap = {
  ImprovisationType.mixed: 'mixed',
  ImprovisationType.compared: 'compared',
};
