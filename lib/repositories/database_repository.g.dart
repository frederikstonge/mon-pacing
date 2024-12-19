// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repository.dart';

// ignore_for_file: type=lint
class $PacingEntityTable extends PacingEntity
    with TableInfo<$PacingEntityTable, PacingEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PacingEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($PacingEntityTable.$convertertags);
  static const VerificationMeta _improvisationsMeta =
      const VerificationMeta('improvisations');
  @override
  late final GeneratedColumnWithTypeConverter<ImprovisationModel, String>
      improvisations = GeneratedColumn<String>(
              'improvisations', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ImprovisationModel>(
              $PacingEntityTable.$converterimprovisations);
  static const VerificationMeta _defaultNumberOfTeamsMeta =
      const VerificationMeta('defaultNumberOfTeams');
  @override
  late final GeneratedColumn<int> defaultNumberOfTeams = GeneratedColumn<int>(
      'default_number_of_teams', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2));
  static const VerificationMeta _integrationIdMeta =
      const VerificationMeta('integrationId');
  @override
  late final GeneratedColumn<String> integrationId = GeneratedColumn<String>(
      'integration_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _integrationEntityIdMeta =
      const VerificationMeta('integrationEntityId');
  @override
  late final GeneratedColumn<String> integrationEntityId =
      GeneratedColumn<String>('integration_entity_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _integrationAdditionalDataMeta =
      const VerificationMeta('integrationAdditionalData');
  @override
  late final GeneratedColumn<String> integrationAdditionalData =
      GeneratedColumn<String>('integration_additional_data', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        createdDate,
        modifiedDate,
        tags,
        improvisations,
        defaultNumberOfTeams,
        integrationId,
        integrationEntityId,
        integrationAdditionalData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pacing_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PacingEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_improvisationsMeta, const VerificationResult.success());
    if (data.containsKey('default_number_of_teams')) {
      context.handle(
          _defaultNumberOfTeamsMeta,
          defaultNumberOfTeams.isAcceptableOrUnknown(
              data['default_number_of_teams']!, _defaultNumberOfTeamsMeta));
    }
    if (data.containsKey('integration_id')) {
      context.handle(
          _integrationIdMeta,
          integrationId.isAcceptableOrUnknown(
              data['integration_id']!, _integrationIdMeta));
    }
    if (data.containsKey('integration_entity_id')) {
      context.handle(
          _integrationEntityIdMeta,
          integrationEntityId.isAcceptableOrUnknown(
              data['integration_entity_id']!, _integrationEntityIdMeta));
    }
    if (data.containsKey('integration_additional_data')) {
      context.handle(
          _integrationAdditionalDataMeta,
          integrationAdditionalData.isAcceptableOrUnknown(
              data['integration_additional_data']!,
              _integrationAdditionalDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PacingEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PacingEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      tags: $PacingEntityTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      improvisations: $PacingEntityTable.$converterimprovisations.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}improvisations'])!),
      defaultNumberOfTeams: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}default_number_of_teams'])!,
      integrationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}integration_id']),
      integrationEntityId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}integration_entity_id']),
      integrationAdditionalData: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}integration_additional_data']),
    );
  }

  @override
  $PacingEntityTable createAlias(String alias) {
    return $PacingEntityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, String> $convertertags =
      const TagsConverter();
  static JsonTypeConverter2<ImprovisationModel, String, String>
      $converterimprovisations = ImprovisationModel.converter;
}

class PacingEntityData extends DataClass
    implements Insertable<PacingEntityData> {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<String> tags;
  final ImprovisationModel improvisations;
  final int defaultNumberOfTeams;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  const PacingEntityData(
      {required this.id,
      required this.name,
      this.createdDate,
      this.modifiedDate,
      required this.tags,
      required this.improvisations,
      required this.defaultNumberOfTeams,
      this.integrationId,
      this.integrationEntityId,
      this.integrationAdditionalData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    {
      map['tags'] =
          Variable<String>($PacingEntityTable.$convertertags.toSql(tags));
    }
    {
      map['improvisations'] = Variable<String>(
          $PacingEntityTable.$converterimprovisations.toSql(improvisations));
    }
    map['default_number_of_teams'] = Variable<int>(defaultNumberOfTeams);
    if (!nullToAbsent || integrationId != null) {
      map['integration_id'] = Variable<String>(integrationId);
    }
    if (!nullToAbsent || integrationEntityId != null) {
      map['integration_entity_id'] = Variable<String>(integrationEntityId);
    }
    if (!nullToAbsent || integrationAdditionalData != null) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData);
    }
    return map;
  }

  PacingEntityCompanion toCompanion(bool nullToAbsent) {
    return PacingEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      tags: Value(tags),
      improvisations: Value(improvisations),
      defaultNumberOfTeams: Value(defaultNumberOfTeams),
      integrationId: integrationId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationId),
      integrationEntityId: integrationEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationEntityId),
      integrationAdditionalData:
          integrationAdditionalData == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationAdditionalData),
    );
  }

  factory PacingEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PacingEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      tags: $PacingEntityTable.$convertertags
          .fromJson(serializer.fromJson<String>(json['tags'])),
      improvisations: $PacingEntityTable.$converterimprovisations
          .fromJson(serializer.fromJson<String>(json['improvisations'])),
      defaultNumberOfTeams:
          serializer.fromJson<int>(json['defaultNumberOfTeams']),
      integrationId: serializer.fromJson<String?>(json['integrationId']),
      integrationEntityId:
          serializer.fromJson<String?>(json['integrationEntityId']),
      integrationAdditionalData:
          serializer.fromJson<String?>(json['integrationAdditionalData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'tags': serializer
          .toJson<String>($PacingEntityTable.$convertertags.toJson(tags)),
      'improvisations': serializer.toJson<String>(
          $PacingEntityTable.$converterimprovisations.toJson(improvisations)),
      'defaultNumberOfTeams': serializer.toJson<int>(defaultNumberOfTeams),
      'integrationId': serializer.toJson<String?>(integrationId),
      'integrationEntityId': serializer.toJson<String?>(integrationEntityId),
      'integrationAdditionalData':
          serializer.toJson<String?>(integrationAdditionalData),
    };
  }

  PacingEntityData copyWith(
          {int? id,
          String? name,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          List<String>? tags,
          ImprovisationModel? improvisations,
          int? defaultNumberOfTeams,
          Value<String?> integrationId = const Value.absent(),
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent()}) =>
      PacingEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        tags: tags ?? this.tags,
        improvisations: improvisations ?? this.improvisations,
        defaultNumberOfTeams: defaultNumberOfTeams ?? this.defaultNumberOfTeams,
        integrationId:
            integrationId.present ? integrationId.value : this.integrationId,
        integrationEntityId: integrationEntityId.present
            ? integrationEntityId.value
            : this.integrationEntityId,
        integrationAdditionalData: integrationAdditionalData.present
            ? integrationAdditionalData.value
            : this.integrationAdditionalData,
      );
  PacingEntityData copyWithCompanion(PacingEntityCompanion data) {
    return PacingEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      tags: data.tags.present ? data.tags.value : this.tags,
      improvisations: data.improvisations.present
          ? data.improvisations.value
          : this.improvisations,
      defaultNumberOfTeams: data.defaultNumberOfTeams.present
          ? data.defaultNumberOfTeams.value
          : this.defaultNumberOfTeams,
      integrationId: data.integrationId.present
          ? data.integrationId.value
          : this.integrationId,
      integrationEntityId: data.integrationEntityId.present
          ? data.integrationEntityId.value
          : this.integrationEntityId,
      integrationAdditionalData: data.integrationAdditionalData.present
          ? data.integrationAdditionalData.value
          : this.integrationAdditionalData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PacingEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tags: $tags, ')
          ..write('improvisations: $improvisations, ')
          ..write('defaultNumberOfTeams: $defaultNumberOfTeams, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      createdDate,
      modifiedDate,
      tags,
      improvisations,
      defaultNumberOfTeams,
      integrationId,
      integrationEntityId,
      integrationAdditionalData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PacingEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.tags == this.tags &&
          other.improvisations == this.improvisations &&
          other.defaultNumberOfTeams == this.defaultNumberOfTeams &&
          other.integrationId == this.integrationId &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData);
}

class PacingEntityCompanion extends UpdateCompanion<PacingEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> createdDate;
  final Value<DateTime?> modifiedDate;
  final Value<List<String>> tags;
  final Value<ImprovisationModel> improvisations;
  final Value<int> defaultNumberOfTeams;
  final Value<String?> integrationId;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  const PacingEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.improvisations = const Value.absent(),
    this.defaultNumberOfTeams = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  });
  PacingEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required List<String> tags,
    required ImprovisationModel improvisations,
    this.defaultNumberOfTeams = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  })  : name = Value(name),
        tags = Value(tags),
        improvisations = Value(improvisations);
  static Insertable<PacingEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<String>? tags,
    Expression<String>? improvisations,
    Expression<int>? defaultNumberOfTeams,
    Expression<String>? integrationId,
    Expression<String>? integrationEntityId,
    Expression<String>? integrationAdditionalData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (tags != null) 'tags': tags,
      if (improvisations != null) 'improvisations': improvisations,
      if (defaultNumberOfTeams != null)
        'default_number_of_teams': defaultNumberOfTeams,
      if (integrationId != null) 'integration_id': integrationId,
      if (integrationEntityId != null)
        'integration_entity_id': integrationEntityId,
      if (integrationAdditionalData != null)
        'integration_additional_data': integrationAdditionalData,
    });
  }

  PacingEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime?>? createdDate,
      Value<DateTime?>? modifiedDate,
      Value<List<String>>? tags,
      Value<ImprovisationModel>? improvisations,
      Value<int>? defaultNumberOfTeams,
      Value<String?>? integrationId,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData}) {
    return PacingEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      tags: tags ?? this.tags,
      improvisations: improvisations ?? this.improvisations,
      defaultNumberOfTeams: defaultNumberOfTeams ?? this.defaultNumberOfTeams,
      integrationId: integrationId ?? this.integrationId,
      integrationEntityId: integrationEntityId ?? this.integrationEntityId,
      integrationAdditionalData:
          integrationAdditionalData ?? this.integrationAdditionalData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($PacingEntityTable.$convertertags.toSql(tags.value));
    }
    if (improvisations.present) {
      map['improvisations'] = Variable<String>($PacingEntityTable
          .$converterimprovisations
          .toSql(improvisations.value));
    }
    if (defaultNumberOfTeams.present) {
      map['default_number_of_teams'] =
          Variable<int>(defaultNumberOfTeams.value);
    }
    if (integrationId.present) {
      map['integration_id'] = Variable<String>(integrationId.value);
    }
    if (integrationEntityId.present) {
      map['integration_entity_id'] =
          Variable<String>(integrationEntityId.value);
    }
    if (integrationAdditionalData.present) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PacingEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tags: $tags, ')
          ..write('improvisations: $improvisations, ')
          ..write('defaultNumberOfTeams: $defaultNumberOfTeams, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }
}

class $MatchEntityTable extends MatchEntity
    with TableInfo<$MatchEntityTable, MatchEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($MatchEntityTable.$convertertags);
  static const VerificationMeta _teamsMeta = const VerificationMeta('teams');
  @override
  late final GeneratedColumnWithTypeConverter<MatchTeamModel, String> teams =
      GeneratedColumn<String>('teams', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MatchTeamModel>($MatchEntityTable.$converterteams);
  static const VerificationMeta _improvisationsMeta =
      const VerificationMeta('improvisations');
  @override
  late final GeneratedColumnWithTypeConverter<MatchTeamModel, String>
      improvisations = GeneratedColumn<String>(
              'improvisations', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MatchTeamModel>(
              $MatchEntityTable.$converterimprovisations);
  static const VerificationMeta _penaltiesMeta =
      const VerificationMeta('penalties');
  @override
  late final GeneratedColumnWithTypeConverter<MatchTeamModel, String>
      penalties = GeneratedColumn<String>('penalties', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MatchTeamModel>($MatchEntityTable.$converterpenalties);
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumnWithTypeConverter<MatchTeamModel, String> points =
      GeneratedColumn<String>('points', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MatchTeamModel>($MatchEntityTable.$converterpoints);
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumnWithTypeConverter<MatchTeamModel, String> stars =
      GeneratedColumn<String>('stars', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MatchTeamModel>($MatchEntityTable.$converterstars);
  static const VerificationMeta _enableStatisticsMeta =
      const VerificationMeta('enableStatistics');
  @override
  late final GeneratedColumn<bool> enableStatistics = GeneratedColumn<bool>(
      'enable_statistics', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_statistics" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _enablePenaltiesImpactPointsMeta =
      const VerificationMeta('enablePenaltiesImpactPoints');
  @override
  late final GeneratedColumn<bool> enablePenaltiesImpactPoints =
      GeneratedColumn<bool>(
          'enable_penalties_impact_points', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("enable_penalties_impact_points" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _penaltiesImpactTypeMeta =
      const VerificationMeta('penaltiesImpactType');
  @override
  late final GeneratedColumnWithTypeConverter<PenaltiesImpactType, int>
      penaltiesImpactType = GeneratedColumn<int>(
              'penalties_impact_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(PenaltiesImpactType.addPoints.index))
          .withConverter<PenaltiesImpactType>(
              $MatchEntityTable.$converterpenaltiesImpactType);
  static const VerificationMeta _penaltiesRequiredToImpactPointsMeta =
      const VerificationMeta('penaltiesRequiredToImpactPoints');
  @override
  late final GeneratedColumn<int> penaltiesRequiredToImpactPoints =
      GeneratedColumn<int>(
          'penalties_required_to_impact_points', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(3));
  static const VerificationMeta _enableMatchExpulsionMeta =
      const VerificationMeta('enableMatchExpulsion');
  @override
  late final GeneratedColumn<bool> enableMatchExpulsion = GeneratedColumn<bool>(
      'enable_match_expulsion', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_match_expulsion" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _penaltiesRequiredToExpelMeta =
      const VerificationMeta('penaltiesRequiredToExpel');
  @override
  late final GeneratedColumn<int> penaltiesRequiredToExpel =
      GeneratedColumn<int>('penalties_required_to_expel', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(3));
  static const VerificationMeta _integrationIdMeta =
      const VerificationMeta('integrationId');
  @override
  late final GeneratedColumn<String> integrationId = GeneratedColumn<String>(
      'integration_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _integrationEntityIdMeta =
      const VerificationMeta('integrationEntityId');
  @override
  late final GeneratedColumn<String> integrationEntityId =
      GeneratedColumn<String>('integration_entity_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _integrationAdditionalDataMeta =
      const VerificationMeta('integrationAdditionalData');
  @override
  late final GeneratedColumn<String> integrationAdditionalData =
      GeneratedColumn<String>('integration_additional_data', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta
      _integrationRestrictMaximumPointPerImprovisationMeta =
      const VerificationMeta('integrationRestrictMaximumPointPerImprovisation');
  @override
  late final GeneratedColumn<int>
      integrationRestrictMaximumPointPerImprovisation = GeneratedColumn<int>(
          'integration_restrict_maximum_point_per_improvisation',
          aliasedName,
          true,
          type: DriftSqlType.int,
          requiredDuringInsert: false);
  static const VerificationMeta _integrationMinNumberOfImprovisationsMeta =
      const VerificationMeta('integrationMinNumberOfImprovisations');
  @override
  late final GeneratedColumn<int> integrationMinNumberOfImprovisations =
      GeneratedColumn<int>(
          'integration_min_number_of_improvisations', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _integrationMaxNumberOfImprovisationsMeta =
      const VerificationMeta('integrationMaxNumberOfImprovisations');
  @override
  late final GeneratedColumn<int> integrationMaxNumberOfImprovisations =
      GeneratedColumn<int>(
          'integration_max_number_of_improvisations', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _integrationPenaltyTypesMeta =
      const VerificationMeta('integrationPenaltyTypes');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      integrationPenaltyTypes = GeneratedColumn<String>(
              'integration_penalty_types', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $MatchEntityTable.$converterintegrationPenaltyTypesn);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        createdDate,
        modifiedDate,
        tags,
        teams,
        improvisations,
        penalties,
        points,
        stars,
        enableStatistics,
        enablePenaltiesImpactPoints,
        penaltiesImpactType,
        penaltiesRequiredToImpactPoints,
        enableMatchExpulsion,
        penaltiesRequiredToExpel,
        integrationId,
        integrationEntityId,
        integrationAdditionalData,
        integrationRestrictMaximumPointPerImprovisation,
        integrationMinNumberOfImprovisations,
        integrationMaxNumberOfImprovisations,
        integrationPenaltyTypes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'match_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MatchEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_teamsMeta, const VerificationResult.success());
    context.handle(_improvisationsMeta, const VerificationResult.success());
    context.handle(_penaltiesMeta, const VerificationResult.success());
    context.handle(_pointsMeta, const VerificationResult.success());
    context.handle(_starsMeta, const VerificationResult.success());
    if (data.containsKey('enable_statistics')) {
      context.handle(
          _enableStatisticsMeta,
          enableStatistics.isAcceptableOrUnknown(
              data['enable_statistics']!, _enableStatisticsMeta));
    }
    if (data.containsKey('enable_penalties_impact_points')) {
      context.handle(
          _enablePenaltiesImpactPointsMeta,
          enablePenaltiesImpactPoints.isAcceptableOrUnknown(
              data['enable_penalties_impact_points']!,
              _enablePenaltiesImpactPointsMeta));
    }
    context.handle(
        _penaltiesImpactTypeMeta, const VerificationResult.success());
    if (data.containsKey('penalties_required_to_impact_points')) {
      context.handle(
          _penaltiesRequiredToImpactPointsMeta,
          penaltiesRequiredToImpactPoints.isAcceptableOrUnknown(
              data['penalties_required_to_impact_points']!,
              _penaltiesRequiredToImpactPointsMeta));
    }
    if (data.containsKey('enable_match_expulsion')) {
      context.handle(
          _enableMatchExpulsionMeta,
          enableMatchExpulsion.isAcceptableOrUnknown(
              data['enable_match_expulsion']!, _enableMatchExpulsionMeta));
    }
    if (data.containsKey('penalties_required_to_expel')) {
      context.handle(
          _penaltiesRequiredToExpelMeta,
          penaltiesRequiredToExpel.isAcceptableOrUnknown(
              data['penalties_required_to_expel']!,
              _penaltiesRequiredToExpelMeta));
    }
    if (data.containsKey('integration_id')) {
      context.handle(
          _integrationIdMeta,
          integrationId.isAcceptableOrUnknown(
              data['integration_id']!, _integrationIdMeta));
    }
    if (data.containsKey('integration_entity_id')) {
      context.handle(
          _integrationEntityIdMeta,
          integrationEntityId.isAcceptableOrUnknown(
              data['integration_entity_id']!, _integrationEntityIdMeta));
    }
    if (data.containsKey('integration_additional_data')) {
      context.handle(
          _integrationAdditionalDataMeta,
          integrationAdditionalData.isAcceptableOrUnknown(
              data['integration_additional_data']!,
              _integrationAdditionalDataMeta));
    }
    if (data
        .containsKey('integration_restrict_maximum_point_per_improvisation')) {
      context.handle(
          _integrationRestrictMaximumPointPerImprovisationMeta,
          integrationRestrictMaximumPointPerImprovisation.isAcceptableOrUnknown(
              data['integration_restrict_maximum_point_per_improvisation']!,
              _integrationRestrictMaximumPointPerImprovisationMeta));
    }
    if (data.containsKey('integration_min_number_of_improvisations')) {
      context.handle(
          _integrationMinNumberOfImprovisationsMeta,
          integrationMinNumberOfImprovisations.isAcceptableOrUnknown(
              data['integration_min_number_of_improvisations']!,
              _integrationMinNumberOfImprovisationsMeta));
    }
    if (data.containsKey('integration_max_number_of_improvisations')) {
      context.handle(
          _integrationMaxNumberOfImprovisationsMeta,
          integrationMaxNumberOfImprovisations.isAcceptableOrUnknown(
              data['integration_max_number_of_improvisations']!,
              _integrationMaxNumberOfImprovisationsMeta));
    }
    context.handle(
        _integrationPenaltyTypesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MatchEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MatchEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      tags: $MatchEntityTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      teams: $MatchEntityTable.$converterteams.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teams'])!),
      improvisations: $MatchEntityTable.$converterimprovisations.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}improvisations'])!),
      penalties: $MatchEntityTable.$converterpenalties.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}penalties'])!),
      points: $MatchEntityTable.$converterpoints.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}points'])!),
      stars: $MatchEntityTable.$converterstars.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stars'])!),
      enableStatistics: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}enable_statistics'])!,
      enablePenaltiesImpactPoints: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}enable_penalties_impact_points'])!,
      penaltiesImpactType: $MatchEntityTable.$converterpenaltiesImpactType
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}penalties_impact_type'])!),
      penaltiesRequiredToImpactPoints: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}penalties_required_to_impact_points'])!,
      enableMatchExpulsion: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}enable_match_expulsion'])!,
      penaltiesRequiredToExpel: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}penalties_required_to_expel'])!,
      integrationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}integration_id']),
      integrationEntityId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}integration_entity_id']),
      integrationAdditionalData: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}integration_additional_data']),
      integrationRestrictMaximumPointPerImprovisation:
          attachedDatabase.typeMapping.read(
              DriftSqlType.int,
              data[
                  '${effectivePrefix}integration_restrict_maximum_point_per_improvisation']),
      integrationMinNumberOfImprovisations: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}integration_min_number_of_improvisations']),
      integrationMaxNumberOfImprovisations: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}integration_max_number_of_improvisations']),
      integrationPenaltyTypes: $MatchEntityTable
          .$converterintegrationPenaltyTypesn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}integration_penalty_types'])),
    );
  }

  @override
  $MatchEntityTable createAlias(String alias) {
    return $MatchEntityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<String>, String, String> $convertertags =
      const TagsConverter();
  static JsonTypeConverter2<MatchTeamModel, String, String> $converterteams =
      MatchTeamModel.converter;
  static JsonTypeConverter2<MatchTeamModel, String, String>
      $converterimprovisations = MatchTeamModel.converter;
  static JsonTypeConverter2<MatchTeamModel, String, String>
      $converterpenalties = MatchTeamModel.converter;
  static JsonTypeConverter2<MatchTeamModel, String, String> $converterpoints =
      MatchTeamModel.converter;
  static JsonTypeConverter2<MatchTeamModel, String, String> $converterstars =
      MatchTeamModel.converter;
  static JsonTypeConverter2<PenaltiesImpactType, int, int>
      $converterpenaltiesImpactType =
      const EnumIndexConverter<PenaltiesImpactType>(PenaltiesImpactType.values);
  static JsonTypeConverter2<List<String>, String, String>
      $converterintegrationPenaltyTypes = const TagsConverter();
  static JsonTypeConverter2<List<String>?, String?, String?>
      $converterintegrationPenaltyTypesn =
      JsonTypeConverter2.asNullable($converterintegrationPenaltyTypes);
}

class MatchEntityData extends DataClass implements Insertable<MatchEntityData> {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<String> tags;
  final MatchTeamModel teams;
  final MatchTeamModel improvisations;
  final MatchTeamModel penalties;
  final MatchTeamModel points;
  final MatchTeamModel stars;
  final bool enableStatistics;
  final bool enablePenaltiesImpactPoints;
  final PenaltiesImpactType penaltiesImpactType;
  final int penaltiesRequiredToImpactPoints;
  final bool enableMatchExpulsion;
  final int penaltiesRequiredToExpel;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  final int? integrationRestrictMaximumPointPerImprovisation;
  final int? integrationMinNumberOfImprovisations;
  final int? integrationMaxNumberOfImprovisations;
  final List<String>? integrationPenaltyTypes;
  const MatchEntityData(
      {required this.id,
      required this.name,
      this.createdDate,
      this.modifiedDate,
      required this.tags,
      required this.teams,
      required this.improvisations,
      required this.penalties,
      required this.points,
      required this.stars,
      required this.enableStatistics,
      required this.enablePenaltiesImpactPoints,
      required this.penaltiesImpactType,
      required this.penaltiesRequiredToImpactPoints,
      required this.enableMatchExpulsion,
      required this.penaltiesRequiredToExpel,
      this.integrationId,
      this.integrationEntityId,
      this.integrationAdditionalData,
      this.integrationRestrictMaximumPointPerImprovisation,
      this.integrationMinNumberOfImprovisations,
      this.integrationMaxNumberOfImprovisations,
      this.integrationPenaltyTypes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    {
      map['tags'] =
          Variable<String>($MatchEntityTable.$convertertags.toSql(tags));
    }
    {
      map['teams'] =
          Variable<String>($MatchEntityTable.$converterteams.toSql(teams));
    }
    {
      map['improvisations'] = Variable<String>(
          $MatchEntityTable.$converterimprovisations.toSql(improvisations));
    }
    {
      map['penalties'] = Variable<String>(
          $MatchEntityTable.$converterpenalties.toSql(penalties));
    }
    {
      map['points'] =
          Variable<String>($MatchEntityTable.$converterpoints.toSql(points));
    }
    {
      map['stars'] =
          Variable<String>($MatchEntityTable.$converterstars.toSql(stars));
    }
    map['enable_statistics'] = Variable<bool>(enableStatistics);
    map['enable_penalties_impact_points'] =
        Variable<bool>(enablePenaltiesImpactPoints);
    {
      map['penalties_impact_type'] = Variable<int>($MatchEntityTable
          .$converterpenaltiesImpactType
          .toSql(penaltiesImpactType));
    }
    map['penalties_required_to_impact_points'] =
        Variable<int>(penaltiesRequiredToImpactPoints);
    map['enable_match_expulsion'] = Variable<bool>(enableMatchExpulsion);
    map['penalties_required_to_expel'] =
        Variable<int>(penaltiesRequiredToExpel);
    if (!nullToAbsent || integrationId != null) {
      map['integration_id'] = Variable<String>(integrationId);
    }
    if (!nullToAbsent || integrationEntityId != null) {
      map['integration_entity_id'] = Variable<String>(integrationEntityId);
    }
    if (!nullToAbsent || integrationAdditionalData != null) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData);
    }
    if (!nullToAbsent ||
        integrationRestrictMaximumPointPerImprovisation != null) {
      map['integration_restrict_maximum_point_per_improvisation'] =
          Variable<int>(integrationRestrictMaximumPointPerImprovisation);
    }
    if (!nullToAbsent || integrationMinNumberOfImprovisations != null) {
      map['integration_min_number_of_improvisations'] =
          Variable<int>(integrationMinNumberOfImprovisations);
    }
    if (!nullToAbsent || integrationMaxNumberOfImprovisations != null) {
      map['integration_max_number_of_improvisations'] =
          Variable<int>(integrationMaxNumberOfImprovisations);
    }
    if (!nullToAbsent || integrationPenaltyTypes != null) {
      map['integration_penalty_types'] = Variable<String>($MatchEntityTable
          .$converterintegrationPenaltyTypesn
          .toSql(integrationPenaltyTypes));
    }
    return map;
  }

  MatchEntityCompanion toCompanion(bool nullToAbsent) {
    return MatchEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      tags: Value(tags),
      teams: Value(teams),
      improvisations: Value(improvisations),
      penalties: Value(penalties),
      points: Value(points),
      stars: Value(stars),
      enableStatistics: Value(enableStatistics),
      enablePenaltiesImpactPoints: Value(enablePenaltiesImpactPoints),
      penaltiesImpactType: Value(penaltiesImpactType),
      penaltiesRequiredToImpactPoints: Value(penaltiesRequiredToImpactPoints),
      enableMatchExpulsion: Value(enableMatchExpulsion),
      penaltiesRequiredToExpel: Value(penaltiesRequiredToExpel),
      integrationId: integrationId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationId),
      integrationEntityId: integrationEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationEntityId),
      integrationAdditionalData:
          integrationAdditionalData == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationAdditionalData),
      integrationRestrictMaximumPointPerImprovisation:
          integrationRestrictMaximumPointPerImprovisation == null &&
                  nullToAbsent
              ? const Value.absent()
              : Value(integrationRestrictMaximumPointPerImprovisation),
      integrationMinNumberOfImprovisations:
          integrationMinNumberOfImprovisations == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationMinNumberOfImprovisations),
      integrationMaxNumberOfImprovisations:
          integrationMaxNumberOfImprovisations == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationMaxNumberOfImprovisations),
      integrationPenaltyTypes: integrationPenaltyTypes == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationPenaltyTypes),
    );
  }

  factory MatchEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MatchEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      tags: $MatchEntityTable.$convertertags
          .fromJson(serializer.fromJson<String>(json['tags'])),
      teams: $MatchEntityTable.$converterteams
          .fromJson(serializer.fromJson<String>(json['teams'])),
      improvisations: $MatchEntityTable.$converterimprovisations
          .fromJson(serializer.fromJson<String>(json['improvisations'])),
      penalties: $MatchEntityTable.$converterpenalties
          .fromJson(serializer.fromJson<String>(json['penalties'])),
      points: $MatchEntityTable.$converterpoints
          .fromJson(serializer.fromJson<String>(json['points'])),
      stars: $MatchEntityTable.$converterstars
          .fromJson(serializer.fromJson<String>(json['stars'])),
      enableStatistics: serializer.fromJson<bool>(json['enableStatistics']),
      enablePenaltiesImpactPoints:
          serializer.fromJson<bool>(json['enablePenaltiesImpactPoints']),
      penaltiesImpactType: $MatchEntityTable.$converterpenaltiesImpactType
          .fromJson(serializer.fromJson<int>(json['penaltiesImpactType'])),
      penaltiesRequiredToImpactPoints:
          serializer.fromJson<int>(json['penaltiesRequiredToImpactPoints']),
      enableMatchExpulsion:
          serializer.fromJson<bool>(json['enableMatchExpulsion']),
      penaltiesRequiredToExpel:
          serializer.fromJson<int>(json['penaltiesRequiredToExpel']),
      integrationId: serializer.fromJson<String?>(json['integrationId']),
      integrationEntityId:
          serializer.fromJson<String?>(json['integrationEntityId']),
      integrationAdditionalData:
          serializer.fromJson<String?>(json['integrationAdditionalData']),
      integrationRestrictMaximumPointPerImprovisation:
          serializer.fromJson<int?>(
              json['integrationRestrictMaximumPointPerImprovisation']),
      integrationMinNumberOfImprovisations: serializer
          .fromJson<int?>(json['integrationMinNumberOfImprovisations']),
      integrationMaxNumberOfImprovisations: serializer
          .fromJson<int?>(json['integrationMaxNumberOfImprovisations']),
      integrationPenaltyTypes:
          $MatchEntityTable.$converterintegrationPenaltyTypesn.fromJson(
              serializer.fromJson<String?>(json['integrationPenaltyTypes'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'tags': serializer
          .toJson<String>($MatchEntityTable.$convertertags.toJson(tags)),
      'teams': serializer
          .toJson<String>($MatchEntityTable.$converterteams.toJson(teams)),
      'improvisations': serializer.toJson<String>(
          $MatchEntityTable.$converterimprovisations.toJson(improvisations)),
      'penalties': serializer.toJson<String>(
          $MatchEntityTable.$converterpenalties.toJson(penalties)),
      'points': serializer
          .toJson<String>($MatchEntityTable.$converterpoints.toJson(points)),
      'stars': serializer
          .toJson<String>($MatchEntityTable.$converterstars.toJson(stars)),
      'enableStatistics': serializer.toJson<bool>(enableStatistics),
      'enablePenaltiesImpactPoints':
          serializer.toJson<bool>(enablePenaltiesImpactPoints),
      'penaltiesImpactType': serializer.toJson<int>($MatchEntityTable
          .$converterpenaltiesImpactType
          .toJson(penaltiesImpactType)),
      'penaltiesRequiredToImpactPoints':
          serializer.toJson<int>(penaltiesRequiredToImpactPoints),
      'enableMatchExpulsion': serializer.toJson<bool>(enableMatchExpulsion),
      'penaltiesRequiredToExpel':
          serializer.toJson<int>(penaltiesRequiredToExpel),
      'integrationId': serializer.toJson<String?>(integrationId),
      'integrationEntityId': serializer.toJson<String?>(integrationEntityId),
      'integrationAdditionalData':
          serializer.toJson<String?>(integrationAdditionalData),
      'integrationRestrictMaximumPointPerImprovisation': serializer
          .toJson<int?>(integrationRestrictMaximumPointPerImprovisation),
      'integrationMinNumberOfImprovisations':
          serializer.toJson<int?>(integrationMinNumberOfImprovisations),
      'integrationMaxNumberOfImprovisations':
          serializer.toJson<int?>(integrationMaxNumberOfImprovisations),
      'integrationPenaltyTypes': serializer.toJson<String?>($MatchEntityTable
          .$converterintegrationPenaltyTypesn
          .toJson(integrationPenaltyTypes)),
    };
  }

  MatchEntityData copyWith(
          {int? id,
          String? name,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          List<String>? tags,
          MatchTeamModel? teams,
          MatchTeamModel? improvisations,
          MatchTeamModel? penalties,
          MatchTeamModel? points,
          MatchTeamModel? stars,
          bool? enableStatistics,
          bool? enablePenaltiesImpactPoints,
          PenaltiesImpactType? penaltiesImpactType,
          int? penaltiesRequiredToImpactPoints,
          bool? enableMatchExpulsion,
          int? penaltiesRequiredToExpel,
          Value<String?> integrationId = const Value.absent(),
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent(),
          Value<int?> integrationRestrictMaximumPointPerImprovisation =
              const Value.absent(),
          Value<int?> integrationMinNumberOfImprovisations =
              const Value.absent(),
          Value<int?> integrationMaxNumberOfImprovisations =
              const Value.absent(),
          Value<List<String>?> integrationPenaltyTypes =
              const Value.absent()}) =>
      MatchEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        tags: tags ?? this.tags,
        teams: teams ?? this.teams,
        improvisations: improvisations ?? this.improvisations,
        penalties: penalties ?? this.penalties,
        points: points ?? this.points,
        stars: stars ?? this.stars,
        enableStatistics: enableStatistics ?? this.enableStatistics,
        enablePenaltiesImpactPoints:
            enablePenaltiesImpactPoints ?? this.enablePenaltiesImpactPoints,
        penaltiesImpactType: penaltiesImpactType ?? this.penaltiesImpactType,
        penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints ??
            this.penaltiesRequiredToImpactPoints,
        enableMatchExpulsion: enableMatchExpulsion ?? this.enableMatchExpulsion,
        penaltiesRequiredToExpel:
            penaltiesRequiredToExpel ?? this.penaltiesRequiredToExpel,
        integrationId:
            integrationId.present ? integrationId.value : this.integrationId,
        integrationEntityId: integrationEntityId.present
            ? integrationEntityId.value
            : this.integrationEntityId,
        integrationAdditionalData: integrationAdditionalData.present
            ? integrationAdditionalData.value
            : this.integrationAdditionalData,
        integrationRestrictMaximumPointPerImprovisation:
            integrationRestrictMaximumPointPerImprovisation.present
                ? integrationRestrictMaximumPointPerImprovisation.value
                : this.integrationRestrictMaximumPointPerImprovisation,
        integrationMinNumberOfImprovisations:
            integrationMinNumberOfImprovisations.present
                ? integrationMinNumberOfImprovisations.value
                : this.integrationMinNumberOfImprovisations,
        integrationMaxNumberOfImprovisations:
            integrationMaxNumberOfImprovisations.present
                ? integrationMaxNumberOfImprovisations.value
                : this.integrationMaxNumberOfImprovisations,
        integrationPenaltyTypes: integrationPenaltyTypes.present
            ? integrationPenaltyTypes.value
            : this.integrationPenaltyTypes,
      );
  MatchEntityData copyWithCompanion(MatchEntityCompanion data) {
    return MatchEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      tags: data.tags.present ? data.tags.value : this.tags,
      teams: data.teams.present ? data.teams.value : this.teams,
      improvisations: data.improvisations.present
          ? data.improvisations.value
          : this.improvisations,
      penalties: data.penalties.present ? data.penalties.value : this.penalties,
      points: data.points.present ? data.points.value : this.points,
      stars: data.stars.present ? data.stars.value : this.stars,
      enableStatistics: data.enableStatistics.present
          ? data.enableStatistics.value
          : this.enableStatistics,
      enablePenaltiesImpactPoints: data.enablePenaltiesImpactPoints.present
          ? data.enablePenaltiesImpactPoints.value
          : this.enablePenaltiesImpactPoints,
      penaltiesImpactType: data.penaltiesImpactType.present
          ? data.penaltiesImpactType.value
          : this.penaltiesImpactType,
      penaltiesRequiredToImpactPoints:
          data.penaltiesRequiredToImpactPoints.present
              ? data.penaltiesRequiredToImpactPoints.value
              : this.penaltiesRequiredToImpactPoints,
      enableMatchExpulsion: data.enableMatchExpulsion.present
          ? data.enableMatchExpulsion.value
          : this.enableMatchExpulsion,
      penaltiesRequiredToExpel: data.penaltiesRequiredToExpel.present
          ? data.penaltiesRequiredToExpel.value
          : this.penaltiesRequiredToExpel,
      integrationId: data.integrationId.present
          ? data.integrationId.value
          : this.integrationId,
      integrationEntityId: data.integrationEntityId.present
          ? data.integrationEntityId.value
          : this.integrationEntityId,
      integrationAdditionalData: data.integrationAdditionalData.present
          ? data.integrationAdditionalData.value
          : this.integrationAdditionalData,
      integrationRestrictMaximumPointPerImprovisation:
          data.integrationRestrictMaximumPointPerImprovisation.present
              ? data.integrationRestrictMaximumPointPerImprovisation.value
              : this.integrationRestrictMaximumPointPerImprovisation,
      integrationMinNumberOfImprovisations:
          data.integrationMinNumberOfImprovisations.present
              ? data.integrationMinNumberOfImprovisations.value
              : this.integrationMinNumberOfImprovisations,
      integrationMaxNumberOfImprovisations:
          data.integrationMaxNumberOfImprovisations.present
              ? data.integrationMaxNumberOfImprovisations.value
              : this.integrationMaxNumberOfImprovisations,
      integrationPenaltyTypes: data.integrationPenaltyTypes.present
          ? data.integrationPenaltyTypes.value
          : this.integrationPenaltyTypes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MatchEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tags: $tags, ')
          ..write('teams: $teams, ')
          ..write('improvisations: $improvisations, ')
          ..write('penalties: $penalties, ')
          ..write('points: $points, ')
          ..write('stars: $stars, ')
          ..write('enableStatistics: $enableStatistics, ')
          ..write('enablePenaltiesImpactPoints: $enablePenaltiesImpactPoints, ')
          ..write('penaltiesImpactType: $penaltiesImpactType, ')
          ..write(
              'penaltiesRequiredToImpactPoints: $penaltiesRequiredToImpactPoints, ')
          ..write('enableMatchExpulsion: $enableMatchExpulsion, ')
          ..write('penaltiesRequiredToExpel: $penaltiesRequiredToExpel, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData, ')
          ..write(
              'integrationRestrictMaximumPointPerImprovisation: $integrationRestrictMaximumPointPerImprovisation, ')
          ..write(
              'integrationMinNumberOfImprovisations: $integrationMinNumberOfImprovisations, ')
          ..write(
              'integrationMaxNumberOfImprovisations: $integrationMaxNumberOfImprovisations, ')
          ..write('integrationPenaltyTypes: $integrationPenaltyTypes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        createdDate,
        modifiedDate,
        tags,
        teams,
        improvisations,
        penalties,
        points,
        stars,
        enableStatistics,
        enablePenaltiesImpactPoints,
        penaltiesImpactType,
        penaltiesRequiredToImpactPoints,
        enableMatchExpulsion,
        penaltiesRequiredToExpel,
        integrationId,
        integrationEntityId,
        integrationAdditionalData,
        integrationRestrictMaximumPointPerImprovisation,
        integrationMinNumberOfImprovisations,
        integrationMaxNumberOfImprovisations,
        integrationPenaltyTypes
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MatchEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.tags == this.tags &&
          other.teams == this.teams &&
          other.improvisations == this.improvisations &&
          other.penalties == this.penalties &&
          other.points == this.points &&
          other.stars == this.stars &&
          other.enableStatistics == this.enableStatistics &&
          other.enablePenaltiesImpactPoints ==
              this.enablePenaltiesImpactPoints &&
          other.penaltiesImpactType == this.penaltiesImpactType &&
          other.penaltiesRequiredToImpactPoints ==
              this.penaltiesRequiredToImpactPoints &&
          other.enableMatchExpulsion == this.enableMatchExpulsion &&
          other.penaltiesRequiredToExpel == this.penaltiesRequiredToExpel &&
          other.integrationId == this.integrationId &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData &&
          other.integrationRestrictMaximumPointPerImprovisation ==
              this.integrationRestrictMaximumPointPerImprovisation &&
          other.integrationMinNumberOfImprovisations ==
              this.integrationMinNumberOfImprovisations &&
          other.integrationMaxNumberOfImprovisations ==
              this.integrationMaxNumberOfImprovisations &&
          other.integrationPenaltyTypes == this.integrationPenaltyTypes);
}

class MatchEntityCompanion extends UpdateCompanion<MatchEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> createdDate;
  final Value<DateTime?> modifiedDate;
  final Value<List<String>> tags;
  final Value<MatchTeamModel> teams;
  final Value<MatchTeamModel> improvisations;
  final Value<MatchTeamModel> penalties;
  final Value<MatchTeamModel> points;
  final Value<MatchTeamModel> stars;
  final Value<bool> enableStatistics;
  final Value<bool> enablePenaltiesImpactPoints;
  final Value<PenaltiesImpactType> penaltiesImpactType;
  final Value<int> penaltiesRequiredToImpactPoints;
  final Value<bool> enableMatchExpulsion;
  final Value<int> penaltiesRequiredToExpel;
  final Value<String?> integrationId;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  final Value<int?> integrationRestrictMaximumPointPerImprovisation;
  final Value<int?> integrationMinNumberOfImprovisations;
  final Value<int?> integrationMaxNumberOfImprovisations;
  final Value<List<String>?> integrationPenaltyTypes;
  const MatchEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.teams = const Value.absent(),
    this.improvisations = const Value.absent(),
    this.penalties = const Value.absent(),
    this.points = const Value.absent(),
    this.stars = const Value.absent(),
    this.enableStatistics = const Value.absent(),
    this.enablePenaltiesImpactPoints = const Value.absent(),
    this.penaltiesImpactType = const Value.absent(),
    this.penaltiesRequiredToImpactPoints = const Value.absent(),
    this.enableMatchExpulsion = const Value.absent(),
    this.penaltiesRequiredToExpel = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
    this.integrationRestrictMaximumPointPerImprovisation = const Value.absent(),
    this.integrationMinNumberOfImprovisations = const Value.absent(),
    this.integrationMaxNumberOfImprovisations = const Value.absent(),
    this.integrationPenaltyTypes = const Value.absent(),
  });
  MatchEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required List<String> tags,
    required MatchTeamModel teams,
    required MatchTeamModel improvisations,
    required MatchTeamModel penalties,
    required MatchTeamModel points,
    required MatchTeamModel stars,
    this.enableStatistics = const Value.absent(),
    this.enablePenaltiesImpactPoints = const Value.absent(),
    this.penaltiesImpactType = const Value.absent(),
    this.penaltiesRequiredToImpactPoints = const Value.absent(),
    this.enableMatchExpulsion = const Value.absent(),
    this.penaltiesRequiredToExpel = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
    this.integrationRestrictMaximumPointPerImprovisation = const Value.absent(),
    this.integrationMinNumberOfImprovisations = const Value.absent(),
    this.integrationMaxNumberOfImprovisations = const Value.absent(),
    this.integrationPenaltyTypes = const Value.absent(),
  })  : name = Value(name),
        tags = Value(tags),
        teams = Value(teams),
        improvisations = Value(improvisations),
        penalties = Value(penalties),
        points = Value(points),
        stars = Value(stars);
  static Insertable<MatchEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<String>? tags,
    Expression<String>? teams,
    Expression<String>? improvisations,
    Expression<String>? penalties,
    Expression<String>? points,
    Expression<String>? stars,
    Expression<bool>? enableStatistics,
    Expression<bool>? enablePenaltiesImpactPoints,
    Expression<int>? penaltiesImpactType,
    Expression<int>? penaltiesRequiredToImpactPoints,
    Expression<bool>? enableMatchExpulsion,
    Expression<int>? penaltiesRequiredToExpel,
    Expression<String>? integrationId,
    Expression<String>? integrationEntityId,
    Expression<String>? integrationAdditionalData,
    Expression<int>? integrationRestrictMaximumPointPerImprovisation,
    Expression<int>? integrationMinNumberOfImprovisations,
    Expression<int>? integrationMaxNumberOfImprovisations,
    Expression<String>? integrationPenaltyTypes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (tags != null) 'tags': tags,
      if (teams != null) 'teams': teams,
      if (improvisations != null) 'improvisations': improvisations,
      if (penalties != null) 'penalties': penalties,
      if (points != null) 'points': points,
      if (stars != null) 'stars': stars,
      if (enableStatistics != null) 'enable_statistics': enableStatistics,
      if (enablePenaltiesImpactPoints != null)
        'enable_penalties_impact_points': enablePenaltiesImpactPoints,
      if (penaltiesImpactType != null)
        'penalties_impact_type': penaltiesImpactType,
      if (penaltiesRequiredToImpactPoints != null)
        'penalties_required_to_impact_points': penaltiesRequiredToImpactPoints,
      if (enableMatchExpulsion != null)
        'enable_match_expulsion': enableMatchExpulsion,
      if (penaltiesRequiredToExpel != null)
        'penalties_required_to_expel': penaltiesRequiredToExpel,
      if (integrationId != null) 'integration_id': integrationId,
      if (integrationEntityId != null)
        'integration_entity_id': integrationEntityId,
      if (integrationAdditionalData != null)
        'integration_additional_data': integrationAdditionalData,
      if (integrationRestrictMaximumPointPerImprovisation != null)
        'integration_restrict_maximum_point_per_improvisation':
            integrationRestrictMaximumPointPerImprovisation,
      if (integrationMinNumberOfImprovisations != null)
        'integration_min_number_of_improvisations':
            integrationMinNumberOfImprovisations,
      if (integrationMaxNumberOfImprovisations != null)
        'integration_max_number_of_improvisations':
            integrationMaxNumberOfImprovisations,
      if (integrationPenaltyTypes != null)
        'integration_penalty_types': integrationPenaltyTypes,
    });
  }

  MatchEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime?>? createdDate,
      Value<DateTime?>? modifiedDate,
      Value<List<String>>? tags,
      Value<MatchTeamModel>? teams,
      Value<MatchTeamModel>? improvisations,
      Value<MatchTeamModel>? penalties,
      Value<MatchTeamModel>? points,
      Value<MatchTeamModel>? stars,
      Value<bool>? enableStatistics,
      Value<bool>? enablePenaltiesImpactPoints,
      Value<PenaltiesImpactType>? penaltiesImpactType,
      Value<int>? penaltiesRequiredToImpactPoints,
      Value<bool>? enableMatchExpulsion,
      Value<int>? penaltiesRequiredToExpel,
      Value<String?>? integrationId,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData,
      Value<int?>? integrationRestrictMaximumPointPerImprovisation,
      Value<int?>? integrationMinNumberOfImprovisations,
      Value<int?>? integrationMaxNumberOfImprovisations,
      Value<List<String>?>? integrationPenaltyTypes}) {
    return MatchEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      tags: tags ?? this.tags,
      teams: teams ?? this.teams,
      improvisations: improvisations ?? this.improvisations,
      penalties: penalties ?? this.penalties,
      points: points ?? this.points,
      stars: stars ?? this.stars,
      enableStatistics: enableStatistics ?? this.enableStatistics,
      enablePenaltiesImpactPoints:
          enablePenaltiesImpactPoints ?? this.enablePenaltiesImpactPoints,
      penaltiesImpactType: penaltiesImpactType ?? this.penaltiesImpactType,
      penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints ??
          this.penaltiesRequiredToImpactPoints,
      enableMatchExpulsion: enableMatchExpulsion ?? this.enableMatchExpulsion,
      penaltiesRequiredToExpel:
          penaltiesRequiredToExpel ?? this.penaltiesRequiredToExpel,
      integrationId: integrationId ?? this.integrationId,
      integrationEntityId: integrationEntityId ?? this.integrationEntityId,
      integrationAdditionalData:
          integrationAdditionalData ?? this.integrationAdditionalData,
      integrationRestrictMaximumPointPerImprovisation:
          integrationRestrictMaximumPointPerImprovisation ??
              this.integrationRestrictMaximumPointPerImprovisation,
      integrationMinNumberOfImprovisations:
          integrationMinNumberOfImprovisations ??
              this.integrationMinNumberOfImprovisations,
      integrationMaxNumberOfImprovisations:
          integrationMaxNumberOfImprovisations ??
              this.integrationMaxNumberOfImprovisations,
      integrationPenaltyTypes:
          integrationPenaltyTypes ?? this.integrationPenaltyTypes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($MatchEntityTable.$convertertags.toSql(tags.value));
    }
    if (teams.present) {
      map['teams'] = Variable<String>(
          $MatchEntityTable.$converterteams.toSql(teams.value));
    }
    if (improvisations.present) {
      map['improvisations'] = Variable<String>($MatchEntityTable
          .$converterimprovisations
          .toSql(improvisations.value));
    }
    if (penalties.present) {
      map['penalties'] = Variable<String>(
          $MatchEntityTable.$converterpenalties.toSql(penalties.value));
    }
    if (points.present) {
      map['points'] = Variable<String>(
          $MatchEntityTable.$converterpoints.toSql(points.value));
    }
    if (stars.present) {
      map['stars'] = Variable<String>(
          $MatchEntityTable.$converterstars.toSql(stars.value));
    }
    if (enableStatistics.present) {
      map['enable_statistics'] = Variable<bool>(enableStatistics.value);
    }
    if (enablePenaltiesImpactPoints.present) {
      map['enable_penalties_impact_points'] =
          Variable<bool>(enablePenaltiesImpactPoints.value);
    }
    if (penaltiesImpactType.present) {
      map['penalties_impact_type'] = Variable<int>($MatchEntityTable
          .$converterpenaltiesImpactType
          .toSql(penaltiesImpactType.value));
    }
    if (penaltiesRequiredToImpactPoints.present) {
      map['penalties_required_to_impact_points'] =
          Variable<int>(penaltiesRequiredToImpactPoints.value);
    }
    if (enableMatchExpulsion.present) {
      map['enable_match_expulsion'] =
          Variable<bool>(enableMatchExpulsion.value);
    }
    if (penaltiesRequiredToExpel.present) {
      map['penalties_required_to_expel'] =
          Variable<int>(penaltiesRequiredToExpel.value);
    }
    if (integrationId.present) {
      map['integration_id'] = Variable<String>(integrationId.value);
    }
    if (integrationEntityId.present) {
      map['integration_entity_id'] =
          Variable<String>(integrationEntityId.value);
    }
    if (integrationAdditionalData.present) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData.value);
    }
    if (integrationRestrictMaximumPointPerImprovisation.present) {
      map['integration_restrict_maximum_point_per_improvisation'] =
          Variable<int>(integrationRestrictMaximumPointPerImprovisation.value);
    }
    if (integrationMinNumberOfImprovisations.present) {
      map['integration_min_number_of_improvisations'] =
          Variable<int>(integrationMinNumberOfImprovisations.value);
    }
    if (integrationMaxNumberOfImprovisations.present) {
      map['integration_max_number_of_improvisations'] =
          Variable<int>(integrationMaxNumberOfImprovisations.value);
    }
    if (integrationPenaltyTypes.present) {
      map['integration_penalty_types'] = Variable<String>($MatchEntityTable
          .$converterintegrationPenaltyTypesn
          .toSql(integrationPenaltyTypes.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tags: $tags, ')
          ..write('teams: $teams, ')
          ..write('improvisations: $improvisations, ')
          ..write('penalties: $penalties, ')
          ..write('points: $points, ')
          ..write('stars: $stars, ')
          ..write('enableStatistics: $enableStatistics, ')
          ..write('enablePenaltiesImpactPoints: $enablePenaltiesImpactPoints, ')
          ..write('penaltiesImpactType: $penaltiesImpactType, ')
          ..write(
              'penaltiesRequiredToImpactPoints: $penaltiesRequiredToImpactPoints, ')
          ..write('enableMatchExpulsion: $enableMatchExpulsion, ')
          ..write('penaltiesRequiredToExpel: $penaltiesRequiredToExpel, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData, ')
          ..write(
              'integrationRestrictMaximumPointPerImprovisation: $integrationRestrictMaximumPointPerImprovisation, ')
          ..write(
              'integrationMinNumberOfImprovisations: $integrationMinNumberOfImprovisations, ')
          ..write(
              'integrationMaxNumberOfImprovisations: $integrationMaxNumberOfImprovisations, ')
          ..write('integrationPenaltyTypes: $integrationPenaltyTypes')
          ..write(')'))
        .toString();
  }
}

class $TeamEntityTable extends TeamEntity
    with TableInfo<$TeamEntityTable, TeamEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _performersMeta =
      const VerificationMeta('performers');
  @override
  late final GeneratedColumnWithTypeConverter<PerformerModel, String>
      performers = GeneratedColumn<String>('performers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PerformerModel>($TeamEntityTable.$converterperformers);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TeamEntityTable.$convertertags);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, createdDate, modifiedDate, color, performers, tags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'team_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TeamEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    context.handle(_performersMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      performers: $TeamEntityTable.$converterperformers.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}performers'])!),
      tags: $TeamEntityTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
    );
  }

  @override
  $TeamEntityTable createAlias(String alias) {
    return $TeamEntityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PerformerModel, String, String>
      $converterperformers = PerformerModel.converter;
  static JsonTypeConverter2<List<String>, String, String> $convertertags =
      const TagsConverter();
}

class TeamEntityData extends DataClass implements Insertable<TeamEntityData> {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int color;
  final PerformerModel performers;
  final List<String> tags;
  const TeamEntityData(
      {required this.id,
      required this.name,
      this.createdDate,
      this.modifiedDate,
      required this.color,
      required this.performers,
      required this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    map['color'] = Variable<int>(color);
    {
      map['performers'] = Variable<String>(
          $TeamEntityTable.$converterperformers.toSql(performers));
    }
    {
      map['tags'] =
          Variable<String>($TeamEntityTable.$convertertags.toSql(tags));
    }
    return map;
  }

  TeamEntityCompanion toCompanion(bool nullToAbsent) {
    return TeamEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      color: Value(color),
      performers: Value(performers),
      tags: Value(tags),
    );
  }

  factory TeamEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      color: serializer.fromJson<int>(json['color']),
      performers: $TeamEntityTable.$converterperformers
          .fromJson(serializer.fromJson<String>(json['performers'])),
      tags: $TeamEntityTable.$convertertags
          .fromJson(serializer.fromJson<String>(json['tags'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'color': serializer.toJson<int>(color),
      'performers': serializer.toJson<String>(
          $TeamEntityTable.$converterperformers.toJson(performers)),
      'tags': serializer
          .toJson<String>($TeamEntityTable.$convertertags.toJson(tags)),
    };
  }

  TeamEntityData copyWith(
          {int? id,
          String? name,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          int? color,
          PerformerModel? performers,
          List<String>? tags}) =>
      TeamEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        color: color ?? this.color,
        performers: performers ?? this.performers,
        tags: tags ?? this.tags,
      );
  TeamEntityData copyWithCompanion(TeamEntityCompanion data) {
    return TeamEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      color: data.color.present ? data.color.value : this.color,
      performers:
          data.performers.present ? data.performers.value : this.performers,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('color: $color, ')
          ..write('performers: $performers, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdDate, modifiedDate, color, performers, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.color == this.color &&
          other.performers == this.performers &&
          other.tags == this.tags);
}

class TeamEntityCompanion extends UpdateCompanion<TeamEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> createdDate;
  final Value<DateTime?> modifiedDate;
  final Value<int> color;
  final Value<PerformerModel> performers;
  final Value<List<String>> tags;
  const TeamEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.color = const Value.absent(),
    this.performers = const Value.absent(),
    this.tags = const Value.absent(),
  });
  TeamEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int color,
    required PerformerModel performers,
    required List<String> tags,
  })  : name = Value(name),
        color = Value(color),
        performers = Value(performers),
        tags = Value(tags);
  static Insertable<TeamEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? color,
    Expression<String>? performers,
    Expression<String>? tags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (color != null) 'color': color,
      if (performers != null) 'performers': performers,
      if (tags != null) 'tags': tags,
    });
  }

  TeamEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime?>? createdDate,
      Value<DateTime?>? modifiedDate,
      Value<int>? color,
      Value<PerformerModel>? performers,
      Value<List<String>>? tags}) {
    return TeamEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      color: color ?? this.color,
      performers: performers ?? this.performers,
      tags: tags ?? this.tags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (performers.present) {
      map['performers'] = Variable<String>(
          $TeamEntityTable.$converterperformers.toSql(performers.value));
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($TeamEntityTable.$convertertags.toSql(tags.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('color: $color, ')
          ..write('performers: $performers, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PacingEntityTable pacingEntity = $PacingEntityTable(this);
  late final $MatchEntityTable matchEntity = $MatchEntityTable(this);
  late final $TeamEntityTable teamEntity = $TeamEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pacingEntity, matchEntity, teamEntity];
}

typedef $$PacingEntityTableCreateCompanionBuilder = PacingEntityCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  required List<String> tags,
  required ImprovisationModel improvisations,
  Value<int> defaultNumberOfTeams,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});
typedef $$PacingEntityTableUpdateCompanionBuilder = PacingEntityCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  Value<List<String>> tags,
  Value<ImprovisationModel> improvisations,
  Value<int> defaultNumberOfTeams,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});

class $$PacingEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PacingEntityTable> {
  $$PacingEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ImprovisationModel, ImprovisationModel, String>
      get improvisations => $composableBuilder(
          column: $table.improvisations,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get defaultNumberOfTeams => $composableBuilder(
      column: $table.defaultNumberOfTeams,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnFilters(column));
}

class $$PacingEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PacingEntityTable> {
  $$PacingEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvisations => $composableBuilder(
      column: $table.improvisations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultNumberOfTeams => $composableBuilder(
      column: $table.defaultNumberOfTeams,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationId => $composableBuilder(
      column: $table.integrationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnOrderings(column));
}

class $$PacingEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PacingEntityTable> {
  $$PacingEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ImprovisationModel, String>
      get improvisations => $composableBuilder(
          column: $table.improvisations, builder: (column) => column);

  GeneratedColumn<int> get defaultNumberOfTeams => $composableBuilder(
      column: $table.defaultNumberOfTeams, builder: (column) => column);

  GeneratedColumn<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => column);

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);
}

class $$PacingEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PacingEntityTable,
    PacingEntityData,
    $$PacingEntityTableFilterComposer,
    $$PacingEntityTableOrderingComposer,
    $$PacingEntityTableAnnotationComposer,
    $$PacingEntityTableCreateCompanionBuilder,
    $$PacingEntityTableUpdateCompanionBuilder,
    (
      PacingEntityData,
      BaseReferences<_$AppDatabase, $PacingEntityTable, PacingEntityData>
    ),
    PacingEntityData,
    PrefetchHooks Function()> {
  $$PacingEntityTableTableManager(_$AppDatabase db, $PacingEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PacingEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PacingEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PacingEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<ImprovisationModel> improvisations = const Value.absent(),
            Value<int> defaultNumberOfTeams = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              PacingEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tags: tags,
            improvisations: improvisations,
            defaultNumberOfTeams: defaultNumberOfTeams,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            required List<String> tags,
            required ImprovisationModel improvisations,
            Value<int> defaultNumberOfTeams = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              PacingEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tags: tags,
            improvisations: improvisations,
            defaultNumberOfTeams: defaultNumberOfTeams,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PacingEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PacingEntityTable,
    PacingEntityData,
    $$PacingEntityTableFilterComposer,
    $$PacingEntityTableOrderingComposer,
    $$PacingEntityTableAnnotationComposer,
    $$PacingEntityTableCreateCompanionBuilder,
    $$PacingEntityTableUpdateCompanionBuilder,
    (
      PacingEntityData,
      BaseReferences<_$AppDatabase, $PacingEntityTable, PacingEntityData>
    ),
    PacingEntityData,
    PrefetchHooks Function()>;
typedef $$MatchEntityTableCreateCompanionBuilder = MatchEntityCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  required List<String> tags,
  required MatchTeamModel teams,
  required MatchTeamModel improvisations,
  required MatchTeamModel penalties,
  required MatchTeamModel points,
  required MatchTeamModel stars,
  Value<bool> enableStatistics,
  Value<bool> enablePenaltiesImpactPoints,
  Value<PenaltiesImpactType> penaltiesImpactType,
  Value<int> penaltiesRequiredToImpactPoints,
  Value<bool> enableMatchExpulsion,
  Value<int> penaltiesRequiredToExpel,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
  Value<int?> integrationRestrictMaximumPointPerImprovisation,
  Value<int?> integrationMinNumberOfImprovisations,
  Value<int?> integrationMaxNumberOfImprovisations,
  Value<List<String>?> integrationPenaltyTypes,
});
typedef $$MatchEntityTableUpdateCompanionBuilder = MatchEntityCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  Value<List<String>> tags,
  Value<MatchTeamModel> teams,
  Value<MatchTeamModel> improvisations,
  Value<MatchTeamModel> penalties,
  Value<MatchTeamModel> points,
  Value<MatchTeamModel> stars,
  Value<bool> enableStatistics,
  Value<bool> enablePenaltiesImpactPoints,
  Value<PenaltiesImpactType> penaltiesImpactType,
  Value<int> penaltiesRequiredToImpactPoints,
  Value<bool> enableMatchExpulsion,
  Value<int> penaltiesRequiredToExpel,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
  Value<int?> integrationRestrictMaximumPointPerImprovisation,
  Value<int?> integrationMinNumberOfImprovisations,
  Value<int?> integrationMaxNumberOfImprovisations,
  Value<List<String>?> integrationPenaltyTypes,
});

class $$MatchEntityTableFilterComposer
    extends Composer<_$AppDatabase, $MatchEntityTable> {
  $$MatchEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MatchTeamModel, MatchTeamModel, String>
      get teams => $composableBuilder(
          column: $table.teams,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MatchTeamModel, MatchTeamModel, String>
      get improvisations => $composableBuilder(
          column: $table.improvisations,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MatchTeamModel, MatchTeamModel, String>
      get penalties => $composableBuilder(
          column: $table.penalties,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MatchTeamModel, MatchTeamModel, String>
      get points => $composableBuilder(
          column: $table.points,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<MatchTeamModel, MatchTeamModel, String>
      get stars => $composableBuilder(
          column: $table.stars,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get enableStatistics => $composableBuilder(
      column: $table.enableStatistics,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enablePenaltiesImpactPoints => $composableBuilder(
      column: $table.enablePenaltiesImpactPoints,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PenaltiesImpactType, PenaltiesImpactType, int>
      get penaltiesImpactType => $composableBuilder(
          column: $table.penaltiesImpactType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get penaltiesRequiredToImpactPoints => $composableBuilder(
      column: $table.penaltiesRequiredToImpactPoints,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enableMatchExpulsion => $composableBuilder(
      column: $table.enableMatchExpulsion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get penaltiesRequiredToExpel => $composableBuilder(
      column: $table.penaltiesRequiredToExpel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get integrationRestrictMaximumPointPerImprovisation =>
      $composableBuilder(
          column: $table.integrationRestrictMaximumPointPerImprovisation,
          builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get integrationMinNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMinNumberOfImprovisations,
          builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get integrationMaxNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMaxNumberOfImprovisations,
          builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get integrationPenaltyTypes => $composableBuilder(
          column: $table.integrationPenaltyTypes,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$MatchEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $MatchEntityTable> {
  $$MatchEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get teams => $composableBuilder(
      column: $table.teams, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvisations => $composableBuilder(
      column: $table.improvisations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get penalties => $composableBuilder(
      column: $table.penalties, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get points => $composableBuilder(
      column: $table.points, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stars => $composableBuilder(
      column: $table.stars, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableStatistics => $composableBuilder(
      column: $table.enableStatistics,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enablePenaltiesImpactPoints => $composableBuilder(
      column: $table.enablePenaltiesImpactPoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get penaltiesImpactType => $composableBuilder(
      column: $table.penaltiesImpactType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get penaltiesRequiredToImpactPoints =>
      $composableBuilder(
          column: $table.penaltiesRequiredToImpactPoints,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableMatchExpulsion => $composableBuilder(
      column: $table.enableMatchExpulsion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get penaltiesRequiredToExpel => $composableBuilder(
      column: $table.penaltiesRequiredToExpel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationId => $composableBuilder(
      column: $table.integrationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get integrationRestrictMaximumPointPerImprovisation =>
      $composableBuilder(
          column: $table.integrationRestrictMaximumPointPerImprovisation,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get integrationMinNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMinNumberOfImprovisations,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get integrationMaxNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMaxNumberOfImprovisations,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationPenaltyTypes => $composableBuilder(
      column: $table.integrationPenaltyTypes,
      builder: (column) => ColumnOrderings(column));
}

class $$MatchEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $MatchEntityTable> {
  $$MatchEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MatchTeamModel, String> get teams =>
      $composableBuilder(column: $table.teams, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MatchTeamModel, String> get improvisations =>
      $composableBuilder(
          column: $table.improvisations, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MatchTeamModel, String> get penalties =>
      $composableBuilder(column: $table.penalties, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MatchTeamModel, String> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MatchTeamModel, String> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<bool> get enableStatistics => $composableBuilder(
      column: $table.enableStatistics, builder: (column) => column);

  GeneratedColumn<bool> get enablePenaltiesImpactPoints => $composableBuilder(
      column: $table.enablePenaltiesImpactPoints, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PenaltiesImpactType, int>
      get penaltiesImpactType => $composableBuilder(
          column: $table.penaltiesImpactType, builder: (column) => column);

  GeneratedColumn<int> get penaltiesRequiredToImpactPoints =>
      $composableBuilder(
          column: $table.penaltiesRequiredToImpactPoints,
          builder: (column) => column);

  GeneratedColumn<bool> get enableMatchExpulsion => $composableBuilder(
      column: $table.enableMatchExpulsion, builder: (column) => column);

  GeneratedColumn<int> get penaltiesRequiredToExpel => $composableBuilder(
      column: $table.penaltiesRequiredToExpel, builder: (column) => column);

  GeneratedColumn<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => column);

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);

  GeneratedColumn<int> get integrationRestrictMaximumPointPerImprovisation =>
      $composableBuilder(
          column: $table.integrationRestrictMaximumPointPerImprovisation,
          builder: (column) => column);

  GeneratedColumn<int> get integrationMinNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMinNumberOfImprovisations,
          builder: (column) => column);

  GeneratedColumn<int> get integrationMaxNumberOfImprovisations =>
      $composableBuilder(
          column: $table.integrationMaxNumberOfImprovisations,
          builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
      get integrationPenaltyTypes => $composableBuilder(
          column: $table.integrationPenaltyTypes, builder: (column) => column);
}

class $$MatchEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MatchEntityTable,
    MatchEntityData,
    $$MatchEntityTableFilterComposer,
    $$MatchEntityTableOrderingComposer,
    $$MatchEntityTableAnnotationComposer,
    $$MatchEntityTableCreateCompanionBuilder,
    $$MatchEntityTableUpdateCompanionBuilder,
    (
      MatchEntityData,
      BaseReferences<_$AppDatabase, $MatchEntityTable, MatchEntityData>
    ),
    MatchEntityData,
    PrefetchHooks Function()> {
  $$MatchEntityTableTableManager(_$AppDatabase db, $MatchEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatchEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatchEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatchEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<MatchTeamModel> teams = const Value.absent(),
            Value<MatchTeamModel> improvisations = const Value.absent(),
            Value<MatchTeamModel> penalties = const Value.absent(),
            Value<MatchTeamModel> points = const Value.absent(),
            Value<MatchTeamModel> stars = const Value.absent(),
            Value<bool> enableStatistics = const Value.absent(),
            Value<bool> enablePenaltiesImpactPoints = const Value.absent(),
            Value<PenaltiesImpactType> penaltiesImpactType =
                const Value.absent(),
            Value<int> penaltiesRequiredToImpactPoints = const Value.absent(),
            Value<bool> enableMatchExpulsion = const Value.absent(),
            Value<int> penaltiesRequiredToExpel = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
            Value<int?> integrationRestrictMaximumPointPerImprovisation =
                const Value.absent(),
            Value<int?> integrationMinNumberOfImprovisations =
                const Value.absent(),
            Value<int?> integrationMaxNumberOfImprovisations =
                const Value.absent(),
            Value<List<String>?> integrationPenaltyTypes = const Value.absent(),
          }) =>
              MatchEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tags: tags,
            teams: teams,
            improvisations: improvisations,
            penalties: penalties,
            points: points,
            stars: stars,
            enableStatistics: enableStatistics,
            enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
            penaltiesImpactType: penaltiesImpactType,
            penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints,
            enableMatchExpulsion: enableMatchExpulsion,
            penaltiesRequiredToExpel: penaltiesRequiredToExpel,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
            integrationRestrictMaximumPointPerImprovisation:
                integrationRestrictMaximumPointPerImprovisation,
            integrationMinNumberOfImprovisations:
                integrationMinNumberOfImprovisations,
            integrationMaxNumberOfImprovisations:
                integrationMaxNumberOfImprovisations,
            integrationPenaltyTypes: integrationPenaltyTypes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            required List<String> tags,
            required MatchTeamModel teams,
            required MatchTeamModel improvisations,
            required MatchTeamModel penalties,
            required MatchTeamModel points,
            required MatchTeamModel stars,
            Value<bool> enableStatistics = const Value.absent(),
            Value<bool> enablePenaltiesImpactPoints = const Value.absent(),
            Value<PenaltiesImpactType> penaltiesImpactType =
                const Value.absent(),
            Value<int> penaltiesRequiredToImpactPoints = const Value.absent(),
            Value<bool> enableMatchExpulsion = const Value.absent(),
            Value<int> penaltiesRequiredToExpel = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
            Value<int?> integrationRestrictMaximumPointPerImprovisation =
                const Value.absent(),
            Value<int?> integrationMinNumberOfImprovisations =
                const Value.absent(),
            Value<int?> integrationMaxNumberOfImprovisations =
                const Value.absent(),
            Value<List<String>?> integrationPenaltyTypes = const Value.absent(),
          }) =>
              MatchEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tags: tags,
            teams: teams,
            improvisations: improvisations,
            penalties: penalties,
            points: points,
            stars: stars,
            enableStatistics: enableStatistics,
            enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
            penaltiesImpactType: penaltiesImpactType,
            penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints,
            enableMatchExpulsion: enableMatchExpulsion,
            penaltiesRequiredToExpel: penaltiesRequiredToExpel,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
            integrationRestrictMaximumPointPerImprovisation:
                integrationRestrictMaximumPointPerImprovisation,
            integrationMinNumberOfImprovisations:
                integrationMinNumberOfImprovisations,
            integrationMaxNumberOfImprovisations:
                integrationMaxNumberOfImprovisations,
            integrationPenaltyTypes: integrationPenaltyTypes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MatchEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MatchEntityTable,
    MatchEntityData,
    $$MatchEntityTableFilterComposer,
    $$MatchEntityTableOrderingComposer,
    $$MatchEntityTableAnnotationComposer,
    $$MatchEntityTableCreateCompanionBuilder,
    $$MatchEntityTableUpdateCompanionBuilder,
    (
      MatchEntityData,
      BaseReferences<_$AppDatabase, $MatchEntityTable, MatchEntityData>
    ),
    MatchEntityData,
    PrefetchHooks Function()>;
typedef $$TeamEntityTableCreateCompanionBuilder = TeamEntityCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  required int color,
  required PerformerModel performers,
  required List<String> tags,
});
typedef $$TeamEntityTableUpdateCompanionBuilder = TeamEntityCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime?> createdDate,
  Value<DateTime?> modifiedDate,
  Value<int> color,
  Value<PerformerModel> performers,
  Value<List<String>> tags,
});

class $$TeamEntityTableFilterComposer
    extends Composer<_$AppDatabase, $TeamEntityTable> {
  $$TeamEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PerformerModel, PerformerModel, String>
      get performers => $composableBuilder(
          column: $table.performers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$TeamEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $TeamEntityTable> {
  $$TeamEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performers => $composableBuilder(
      column: $table.performers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));
}

class $$TeamEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeamEntityTable> {
  $$TeamEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PerformerModel, String> get performers =>
      $composableBuilder(
          column: $table.performers, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);
}

class $$TeamEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TeamEntityTable,
    TeamEntityData,
    $$TeamEntityTableFilterComposer,
    $$TeamEntityTableOrderingComposer,
    $$TeamEntityTableAnnotationComposer,
    $$TeamEntityTableCreateCompanionBuilder,
    $$TeamEntityTableUpdateCompanionBuilder,
    (
      TeamEntityData,
      BaseReferences<_$AppDatabase, $TeamEntityTable, TeamEntityData>
    ),
    TeamEntityData,
    PrefetchHooks Function()> {
  $$TeamEntityTableTableManager(_$AppDatabase db, $TeamEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<PerformerModel> performers = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
          }) =>
              TeamEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            color: color,
            performers: performers,
            tags: tags,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            required int color,
            required PerformerModel performers,
            required List<String> tags,
          }) =>
              TeamEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            color: color,
            performers: performers,
            tags: tags,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TeamEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TeamEntityTable,
    TeamEntityData,
    $$TeamEntityTableFilterComposer,
    $$TeamEntityTableOrderingComposer,
    $$TeamEntityTableAnnotationComposer,
    $$TeamEntityTableCreateCompanionBuilder,
    $$TeamEntityTableUpdateCompanionBuilder,
    (
      TeamEntityData,
      BaseReferences<_$AppDatabase, $TeamEntityTable, TeamEntityData>
    ),
    TeamEntityData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PacingEntityTableTableManager get pacingEntity =>
      $$PacingEntityTableTableManager(_db, _db.pacingEntity);
  $$MatchEntityTableTableManager get matchEntity =>
      $$MatchEntityTableTableManager(_db, _db.matchEntity);
  $$TeamEntityTableTableManager get teamEntity =>
      $$TeamEntityTableTableManager(_db, _db.teamEntity);
}
