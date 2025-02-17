// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

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
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
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
}

class PacingEntityData extends DataClass
    implements Insertable<PacingEntityData> {
  final int id;
  final String name;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int defaultNumberOfTeams;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  const PacingEntityData(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate,
      required this.defaultNumberOfTeams,
      this.integrationId,
      this.integrationEntityId,
      this.integrationAdditionalData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
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
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
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
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
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
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
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
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? defaultNumberOfTeams,
          Value<String?> integrationId = const Value.absent(),
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent()}) =>
      PacingEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
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
          other.defaultNumberOfTeams == this.defaultNumberOfTeams &&
          other.integrationId == this.integrationId &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData);
}

class PacingEntityCompanion extends UpdateCompanion<PacingEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> defaultNumberOfTeams;
  final Value<String?> integrationId;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  const PacingEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
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
    this.defaultNumberOfTeams = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PacingEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
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
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? defaultNumberOfTeams,
      Value<String?>? integrationId,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData}) {
    return PacingEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
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
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
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

  static JsonTypeConverter2<PenaltiesImpactType, int, int>
      $converterpenaltiesImpactType =
      const EnumIndexConverter<PenaltiesImpactType>(PenaltiesImpactType.values);
  static JsonTypeConverter2<List<String>, String, String>
      $converterintegrationPenaltyTypes = const StringListConverter();
  static JsonTypeConverter2<List<String>?, String?, String?>
      $converterintegrationPenaltyTypesn =
      JsonTypeConverter2.asNullable($converterintegrationPenaltyTypes);
}

class MatchEntityData extends DataClass implements Insertable<MatchEntityData> {
  final int id;
  final String name;
  final DateTime createdDate;
  final DateTime modifiedDate;
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
      required this.createdDate,
      required this.modifiedDate,
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
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
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
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
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
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
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
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
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
          DateTime? createdDate,
          DateTime? modifiedDate,
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
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
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
  int get hashCode => Object.hash(
      id,
      name,
      createdDate,
      modifiedDate,
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
      integrationPenaltyTypes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MatchEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
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
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
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
  }) : name = Value(name);
  static Insertable<MatchEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
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
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
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
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
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
        color,
        match,
        integrationId,
        integrationEntityId,
        integrationAdditionalData
      ];
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
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
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
  TeamEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match']),
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
  $TeamEntityTable createAlias(String alias) {
    return $TeamEntityTable(attachedDatabase, alias);
  }
}

class TeamEntityData extends DataClass implements Insertable<TeamEntityData> {
  final int id;
  final String name;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int color;
  final int? match;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  const TeamEntityData(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate,
      required this.color,
      this.match,
      this.integrationId,
      this.integrationEntityId,
      this.integrationAdditionalData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['color'] = Variable<int>(color);
    if (!nullToAbsent || match != null) {
      map['match'] = Variable<int>(match);
    }
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

  TeamEntityCompanion toCompanion(bool nullToAbsent) {
    return TeamEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      color: Value(color),
      match:
          match == null && nullToAbsent ? const Value.absent() : Value(match),
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

  factory TeamEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      color: serializer.fromJson<int>(json['color']),
      match: serializer.fromJson<int?>(json['match']),
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
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'color': serializer.toJson<int>(color),
      'match': serializer.toJson<int?>(match),
      'integrationId': serializer.toJson<String?>(integrationId),
      'integrationEntityId': serializer.toJson<String?>(integrationEntityId),
      'integrationAdditionalData':
          serializer.toJson<String?>(integrationAdditionalData),
    };
  }

  TeamEntityData copyWith(
          {int? id,
          String? name,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? color,
          Value<int?> match = const Value.absent(),
          Value<String?> integrationId = const Value.absent(),
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent()}) =>
      TeamEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        color: color ?? this.color,
        match: match.present ? match.value : this.match,
        integrationId:
            integrationId.present ? integrationId.value : this.integrationId,
        integrationEntityId: integrationEntityId.present
            ? integrationEntityId.value
            : this.integrationEntityId,
        integrationAdditionalData: integrationAdditionalData.present
            ? integrationAdditionalData.value
            : this.integrationAdditionalData,
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
      match: data.match.present ? data.match.value : this.match,
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
    return (StringBuffer('TeamEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('color: $color, ')
          ..write('match: $match, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdDate, modifiedDate, color,
      match, integrationId, integrationEntityId, integrationAdditionalData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.color == this.color &&
          other.match == this.match &&
          other.integrationId == this.integrationId &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData);
}

class TeamEntityCompanion extends UpdateCompanion<TeamEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> color;
  final Value<int?> match;
  final Value<String?> integrationId;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  const TeamEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.color = const Value.absent(),
    this.match = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  });
  TeamEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int color,
    this.match = const Value.absent(),
    this.integrationId = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  })  : name = Value(name),
        color = Value(color);
  static Insertable<TeamEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? color,
    Expression<int>? match,
    Expression<String>? integrationId,
    Expression<String>? integrationEntityId,
    Expression<String>? integrationAdditionalData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (color != null) 'color': color,
      if (match != null) 'match': match,
      if (integrationId != null) 'integration_id': integrationId,
      if (integrationEntityId != null)
        'integration_entity_id': integrationEntityId,
      if (integrationAdditionalData != null)
        'integration_additional_data': integrationAdditionalData,
    });
  }

  TeamEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? color,
      Value<int?>? match,
      Value<String?>? integrationId,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData}) {
    return TeamEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      color: color ?? this.color,
      match: match ?? this.match,
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
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
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
    return (StringBuffer('TeamEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('color: $color, ')
          ..write('match: $match, ')
          ..write('integrationId: $integrationId, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }
}

class $PerformerEntityTable extends PerformerEntity
    with TableInfo<$PerformerEntityTable, PerformerEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerformerEntityTable(this.attachedDatabase, [this._alias]);
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
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<int> team = GeneratedColumn<int>(
      'team', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES team_entity (id)'));
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
        team,
        integrationEntityId,
        integrationAdditionalData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'performer_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PerformerEntityData> instance,
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
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
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
  PerformerEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PerformerEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team'])!,
      integrationEntityId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}integration_entity_id']),
      integrationAdditionalData: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}integration_additional_data']),
    );
  }

  @override
  $PerformerEntityTable createAlias(String alias) {
    return $PerformerEntityTable(attachedDatabase, alias);
  }
}

class PerformerEntityData extends DataClass
    implements Insertable<PerformerEntityData> {
  final int id;
  final String name;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int team;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  const PerformerEntityData(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate,
      required this.team,
      this.integrationEntityId,
      this.integrationAdditionalData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['team'] = Variable<int>(team);
    if (!nullToAbsent || integrationEntityId != null) {
      map['integration_entity_id'] = Variable<String>(integrationEntityId);
    }
    if (!nullToAbsent || integrationAdditionalData != null) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData);
    }
    return map;
  }

  PerformerEntityCompanion toCompanion(bool nullToAbsent) {
    return PerformerEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      team: Value(team),
      integrationEntityId: integrationEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationEntityId),
      integrationAdditionalData:
          integrationAdditionalData == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationAdditionalData),
    );
  }

  factory PerformerEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PerformerEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      team: serializer.fromJson<int>(json['team']),
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
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'team': serializer.toJson<int>(team),
      'integrationEntityId': serializer.toJson<String?>(integrationEntityId),
      'integrationAdditionalData':
          serializer.toJson<String?>(integrationAdditionalData),
    };
  }

  PerformerEntityData copyWith(
          {int? id,
          String? name,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? team,
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent()}) =>
      PerformerEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        team: team ?? this.team,
        integrationEntityId: integrationEntityId.present
            ? integrationEntityId.value
            : this.integrationEntityId,
        integrationAdditionalData: integrationAdditionalData.present
            ? integrationAdditionalData.value
            : this.integrationAdditionalData,
      );
  PerformerEntityData copyWithCompanion(PerformerEntityCompanion data) {
    return PerformerEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      team: data.team.present ? data.team.value : this.team,
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
    return (StringBuffer('PerformerEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('team: $team, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdDate, modifiedDate, team,
      integrationEntityId, integrationAdditionalData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PerformerEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.team == this.team &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData);
}

class PerformerEntityCompanion extends UpdateCompanion<PerformerEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> team;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  const PerformerEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.team = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  });
  PerformerEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int team,
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
  })  : name = Value(name),
        team = Value(team);
  static Insertable<PerformerEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? team,
    Expression<String>? integrationEntityId,
    Expression<String>? integrationAdditionalData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (team != null) 'team': team,
      if (integrationEntityId != null)
        'integration_entity_id': integrationEntityId,
      if (integrationAdditionalData != null)
        'integration_additional_data': integrationAdditionalData,
    });
  }

  PerformerEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? team,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData}) {
    return PerformerEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      team: team ?? this.team,
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
    if (team.present) {
      map['team'] = Variable<int>(team.value);
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
    return (StringBuffer('PerformerEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('team: $team, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData')
          ..write(')'))
        .toString();
  }
}

class $ImprovisationEntityTable extends ImprovisationEntity
    with TableInfo<$ImprovisationEntityTable, ImprovisationEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImprovisationEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ImprovisationType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ImprovisationType>(
              $ImprovisationEntityTable.$convertertype);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationsInSecondsMeta =
      const VerificationMeta('durationsInSeconds');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
      durationsInSeconds = GeneratedColumn<String>(
              'durations_in_seconds', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>(
              $ImprovisationEntityTable.$converterdurationsInSeconds);
  static const VerificationMeta _performersMeta =
      const VerificationMeta('performers');
  @override
  late final GeneratedColumn<String> performers = GeneratedColumn<String>(
      'performers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeBufferInSecondsMeta =
      const VerificationMeta('timeBufferInSeconds');
  @override
  late final GeneratedColumn<int> timeBufferInSeconds = GeneratedColumn<int>(
      'time_buffer_in_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _huddleTimerInSecondsMeta =
      const VerificationMeta('huddleTimerInSeconds');
  @override
  late final GeneratedColumn<int> huddleTimerInSeconds = GeneratedColumn<int>(
      'huddle_timer_in_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _pacingMeta = const VerificationMeta('pacing');
  @override
  late final GeneratedColumn<int> pacing = GeneratedColumn<int>(
      'pacing', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pacing_entity (id)'));
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        order,
        createdDate,
        modifiedDate,
        type,
        category,
        theme,
        durationsInSeconds,
        performers,
        notes,
        timeBufferInSeconds,
        huddleTimerInSeconds,
        integrationEntityId,
        integrationAdditionalData,
        pacing,
        match
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'improvisation_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ImprovisationEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
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
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    context.handle(_durationsInSecondsMeta, const VerificationResult.success());
    if (data.containsKey('performers')) {
      context.handle(
          _performersMeta,
          performers.isAcceptableOrUnknown(
              data['performers']!, _performersMeta));
    } else if (isInserting) {
      context.missing(_performersMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('time_buffer_in_seconds')) {
      context.handle(
          _timeBufferInSecondsMeta,
          timeBufferInSeconds.isAcceptableOrUnknown(
              data['time_buffer_in_seconds']!, _timeBufferInSecondsMeta));
    } else if (isInserting) {
      context.missing(_timeBufferInSecondsMeta);
    }
    if (data.containsKey('huddle_timer_in_seconds')) {
      context.handle(
          _huddleTimerInSecondsMeta,
          huddleTimerInSeconds.isAcceptableOrUnknown(
              data['huddle_timer_in_seconds']!, _huddleTimerInSecondsMeta));
    } else if (isInserting) {
      context.missing(_huddleTimerInSecondsMeta);
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
    if (data.containsKey('pacing')) {
      context.handle(_pacingMeta,
          pacing.isAcceptableOrUnknown(data['pacing']!, _pacingMeta));
    }
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImprovisationEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImprovisationEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      type: $ImprovisationEntityTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      durationsInSeconds: $ImprovisationEntityTable.$converterdurationsInSeconds
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}durations_in_seconds'])!),
      performers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}performers'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      timeBufferInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_buffer_in_seconds'])!,
      huddleTimerInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}huddle_timer_in_seconds'])!,
      integrationEntityId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}integration_entity_id']),
      integrationAdditionalData: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}integration_additional_data']),
      pacing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pacing']),
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match']),
    );
  }

  @override
  $ImprovisationEntityTable createAlias(String alias) {
    return $ImprovisationEntityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ImprovisationType, int, int> $convertertype =
      const EnumIndexConverter<ImprovisationType>(ImprovisationType.values);
  static JsonTypeConverter2<List<int>, String, String>
      $converterdurationsInSeconds = IntListConverter();
}

class ImprovisationEntityData extends DataClass
    implements Insertable<ImprovisationEntityData> {
  final int id;
  final int order;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final ImprovisationType type;
  final String category;
  final String theme;
  final List<int> durationsInSeconds;
  final String performers;
  final String notes;
  final int timeBufferInSeconds;
  final int huddleTimerInSeconds;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  final int? pacing;
  final int? match;
  const ImprovisationEntityData(
      {required this.id,
      required this.order,
      required this.createdDate,
      required this.modifiedDate,
      required this.type,
      required this.category,
      required this.theme,
      required this.durationsInSeconds,
      required this.performers,
      required this.notes,
      required this.timeBufferInSeconds,
      required this.huddleTimerInSeconds,
      this.integrationEntityId,
      this.integrationAdditionalData,
      this.pacing,
      this.match});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    {
      map['type'] =
          Variable<int>($ImprovisationEntityTable.$convertertype.toSql(type));
    }
    map['category'] = Variable<String>(category);
    map['theme'] = Variable<String>(theme);
    {
      map['durations_in_seconds'] = Variable<String>($ImprovisationEntityTable
          .$converterdurationsInSeconds
          .toSql(durationsInSeconds));
    }
    map['performers'] = Variable<String>(performers);
    map['notes'] = Variable<String>(notes);
    map['time_buffer_in_seconds'] = Variable<int>(timeBufferInSeconds);
    map['huddle_timer_in_seconds'] = Variable<int>(huddleTimerInSeconds);
    if (!nullToAbsent || integrationEntityId != null) {
      map['integration_entity_id'] = Variable<String>(integrationEntityId);
    }
    if (!nullToAbsent || integrationAdditionalData != null) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData);
    }
    if (!nullToAbsent || pacing != null) {
      map['pacing'] = Variable<int>(pacing);
    }
    if (!nullToAbsent || match != null) {
      map['match'] = Variable<int>(match);
    }
    return map;
  }

  ImprovisationEntityCompanion toCompanion(bool nullToAbsent) {
    return ImprovisationEntityCompanion(
      id: Value(id),
      order: Value(order),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      type: Value(type),
      category: Value(category),
      theme: Value(theme),
      durationsInSeconds: Value(durationsInSeconds),
      performers: Value(performers),
      notes: Value(notes),
      timeBufferInSeconds: Value(timeBufferInSeconds),
      huddleTimerInSeconds: Value(huddleTimerInSeconds),
      integrationEntityId: integrationEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationEntityId),
      integrationAdditionalData:
          integrationAdditionalData == null && nullToAbsent
              ? const Value.absent()
              : Value(integrationAdditionalData),
      pacing:
          pacing == null && nullToAbsent ? const Value.absent() : Value(pacing),
      match:
          match == null && nullToAbsent ? const Value.absent() : Value(match),
    );
  }

  factory ImprovisationEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImprovisationEntityData(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      type: $ImprovisationEntityTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      category: serializer.fromJson<String>(json['category']),
      theme: serializer.fromJson<String>(json['theme']),
      durationsInSeconds: $ImprovisationEntityTable.$converterdurationsInSeconds
          .fromJson(serializer.fromJson<String>(json['durationsInSeconds'])),
      performers: serializer.fromJson<String>(json['performers']),
      notes: serializer.fromJson<String>(json['notes']),
      timeBufferInSeconds:
          serializer.fromJson<int>(json['timeBufferInSeconds']),
      huddleTimerInSeconds:
          serializer.fromJson<int>(json['huddleTimerInSeconds']),
      integrationEntityId:
          serializer.fromJson<String?>(json['integrationEntityId']),
      integrationAdditionalData:
          serializer.fromJson<String?>(json['integrationAdditionalData']),
      pacing: serializer.fromJson<int?>(json['pacing']),
      match: serializer.fromJson<int?>(json['match']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'type': serializer
          .toJson<int>($ImprovisationEntityTable.$convertertype.toJson(type)),
      'category': serializer.toJson<String>(category),
      'theme': serializer.toJson<String>(theme),
      'durationsInSeconds': serializer.toJson<String>($ImprovisationEntityTable
          .$converterdurationsInSeconds
          .toJson(durationsInSeconds)),
      'performers': serializer.toJson<String>(performers),
      'notes': serializer.toJson<String>(notes),
      'timeBufferInSeconds': serializer.toJson<int>(timeBufferInSeconds),
      'huddleTimerInSeconds': serializer.toJson<int>(huddleTimerInSeconds),
      'integrationEntityId': serializer.toJson<String?>(integrationEntityId),
      'integrationAdditionalData':
          serializer.toJson<String?>(integrationAdditionalData),
      'pacing': serializer.toJson<int?>(pacing),
      'match': serializer.toJson<int?>(match),
    };
  }

  ImprovisationEntityData copyWith(
          {int? id,
          int? order,
          DateTime? createdDate,
          DateTime? modifiedDate,
          ImprovisationType? type,
          String? category,
          String? theme,
          List<int>? durationsInSeconds,
          String? performers,
          String? notes,
          int? timeBufferInSeconds,
          int? huddleTimerInSeconds,
          Value<String?> integrationEntityId = const Value.absent(),
          Value<String?> integrationAdditionalData = const Value.absent(),
          Value<int?> pacing = const Value.absent(),
          Value<int?> match = const Value.absent()}) =>
      ImprovisationEntityData(
        id: id ?? this.id,
        order: order ?? this.order,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        type: type ?? this.type,
        category: category ?? this.category,
        theme: theme ?? this.theme,
        durationsInSeconds: durationsInSeconds ?? this.durationsInSeconds,
        performers: performers ?? this.performers,
        notes: notes ?? this.notes,
        timeBufferInSeconds: timeBufferInSeconds ?? this.timeBufferInSeconds,
        huddleTimerInSeconds: huddleTimerInSeconds ?? this.huddleTimerInSeconds,
        integrationEntityId: integrationEntityId.present
            ? integrationEntityId.value
            : this.integrationEntityId,
        integrationAdditionalData: integrationAdditionalData.present
            ? integrationAdditionalData.value
            : this.integrationAdditionalData,
        pacing: pacing.present ? pacing.value : this.pacing,
        match: match.present ? match.value : this.match,
      );
  ImprovisationEntityData copyWithCompanion(ImprovisationEntityCompanion data) {
    return ImprovisationEntityData(
      id: data.id.present ? data.id.value : this.id,
      order: data.order.present ? data.order.value : this.order,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      type: data.type.present ? data.type.value : this.type,
      category: data.category.present ? data.category.value : this.category,
      theme: data.theme.present ? data.theme.value : this.theme,
      durationsInSeconds: data.durationsInSeconds.present
          ? data.durationsInSeconds.value
          : this.durationsInSeconds,
      performers:
          data.performers.present ? data.performers.value : this.performers,
      notes: data.notes.present ? data.notes.value : this.notes,
      timeBufferInSeconds: data.timeBufferInSeconds.present
          ? data.timeBufferInSeconds.value
          : this.timeBufferInSeconds,
      huddleTimerInSeconds: data.huddleTimerInSeconds.present
          ? data.huddleTimerInSeconds.value
          : this.huddleTimerInSeconds,
      integrationEntityId: data.integrationEntityId.present
          ? data.integrationEntityId.value
          : this.integrationEntityId,
      integrationAdditionalData: data.integrationAdditionalData.present
          ? data.integrationAdditionalData.value
          : this.integrationAdditionalData,
      pacing: data.pacing.present ? data.pacing.value : this.pacing,
      match: data.match.present ? data.match.value : this.match,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImprovisationEntityData(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('theme: $theme, ')
          ..write('durationsInSeconds: $durationsInSeconds, ')
          ..write('performers: $performers, ')
          ..write('notes: $notes, ')
          ..write('timeBufferInSeconds: $timeBufferInSeconds, ')
          ..write('huddleTimerInSeconds: $huddleTimerInSeconds, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData, ')
          ..write('pacing: $pacing, ')
          ..write('match: $match')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      order,
      createdDate,
      modifiedDate,
      type,
      category,
      theme,
      durationsInSeconds,
      performers,
      notes,
      timeBufferInSeconds,
      huddleTimerInSeconds,
      integrationEntityId,
      integrationAdditionalData,
      pacing,
      match);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImprovisationEntityData &&
          other.id == this.id &&
          other.order == this.order &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.type == this.type &&
          other.category == this.category &&
          other.theme == this.theme &&
          other.durationsInSeconds == this.durationsInSeconds &&
          other.performers == this.performers &&
          other.notes == this.notes &&
          other.timeBufferInSeconds == this.timeBufferInSeconds &&
          other.huddleTimerInSeconds == this.huddleTimerInSeconds &&
          other.integrationEntityId == this.integrationEntityId &&
          other.integrationAdditionalData == this.integrationAdditionalData &&
          other.pacing == this.pacing &&
          other.match == this.match);
}

class ImprovisationEntityCompanion
    extends UpdateCompanion<ImprovisationEntityData> {
  final Value<int> id;
  final Value<int> order;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<ImprovisationType> type;
  final Value<String> category;
  final Value<String> theme;
  final Value<List<int>> durationsInSeconds;
  final Value<String> performers;
  final Value<String> notes;
  final Value<int> timeBufferInSeconds;
  final Value<int> huddleTimerInSeconds;
  final Value<String?> integrationEntityId;
  final Value<String?> integrationAdditionalData;
  final Value<int?> pacing;
  final Value<int?> match;
  const ImprovisationEntityCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.theme = const Value.absent(),
    this.durationsInSeconds = const Value.absent(),
    this.performers = const Value.absent(),
    this.notes = const Value.absent(),
    this.timeBufferInSeconds = const Value.absent(),
    this.huddleTimerInSeconds = const Value.absent(),
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
    this.pacing = const Value.absent(),
    this.match = const Value.absent(),
  });
  ImprovisationEntityCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required ImprovisationType type,
    required String category,
    required String theme,
    required List<int> durationsInSeconds,
    required String performers,
    required String notes,
    required int timeBufferInSeconds,
    required int huddleTimerInSeconds,
    this.integrationEntityId = const Value.absent(),
    this.integrationAdditionalData = const Value.absent(),
    this.pacing = const Value.absent(),
    this.match = const Value.absent(),
  })  : order = Value(order),
        type = Value(type),
        category = Value(category),
        theme = Value(theme),
        durationsInSeconds = Value(durationsInSeconds),
        performers = Value(performers),
        notes = Value(notes),
        timeBufferInSeconds = Value(timeBufferInSeconds),
        huddleTimerInSeconds = Value(huddleTimerInSeconds);
  static Insertable<ImprovisationEntityData> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? type,
    Expression<String>? category,
    Expression<String>? theme,
    Expression<String>? durationsInSeconds,
    Expression<String>? performers,
    Expression<String>? notes,
    Expression<int>? timeBufferInSeconds,
    Expression<int>? huddleTimerInSeconds,
    Expression<String>? integrationEntityId,
    Expression<String>? integrationAdditionalData,
    Expression<int>? pacing,
    Expression<int>? match,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (theme != null) 'theme': theme,
      if (durationsInSeconds != null)
        'durations_in_seconds': durationsInSeconds,
      if (performers != null) 'performers': performers,
      if (notes != null) 'notes': notes,
      if (timeBufferInSeconds != null)
        'time_buffer_in_seconds': timeBufferInSeconds,
      if (huddleTimerInSeconds != null)
        'huddle_timer_in_seconds': huddleTimerInSeconds,
      if (integrationEntityId != null)
        'integration_entity_id': integrationEntityId,
      if (integrationAdditionalData != null)
        'integration_additional_data': integrationAdditionalData,
      if (pacing != null) 'pacing': pacing,
      if (match != null) 'match': match,
    });
  }

  ImprovisationEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? order,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<ImprovisationType>? type,
      Value<String>? category,
      Value<String>? theme,
      Value<List<int>>? durationsInSeconds,
      Value<String>? performers,
      Value<String>? notes,
      Value<int>? timeBufferInSeconds,
      Value<int>? huddleTimerInSeconds,
      Value<String?>? integrationEntityId,
      Value<String?>? integrationAdditionalData,
      Value<int?>? pacing,
      Value<int?>? match}) {
    return ImprovisationEntityCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      type: type ?? this.type,
      category: category ?? this.category,
      theme: theme ?? this.theme,
      durationsInSeconds: durationsInSeconds ?? this.durationsInSeconds,
      performers: performers ?? this.performers,
      notes: notes ?? this.notes,
      timeBufferInSeconds: timeBufferInSeconds ?? this.timeBufferInSeconds,
      huddleTimerInSeconds: huddleTimerInSeconds ?? this.huddleTimerInSeconds,
      integrationEntityId: integrationEntityId ?? this.integrationEntityId,
      integrationAdditionalData:
          integrationAdditionalData ?? this.integrationAdditionalData,
      pacing: pacing ?? this.pacing,
      match: match ?? this.match,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $ImprovisationEntityTable.$convertertype.toSql(type.value));
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (durationsInSeconds.present) {
      map['durations_in_seconds'] = Variable<String>($ImprovisationEntityTable
          .$converterdurationsInSeconds
          .toSql(durationsInSeconds.value));
    }
    if (performers.present) {
      map['performers'] = Variable<String>(performers.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (timeBufferInSeconds.present) {
      map['time_buffer_in_seconds'] = Variable<int>(timeBufferInSeconds.value);
    }
    if (huddleTimerInSeconds.present) {
      map['huddle_timer_in_seconds'] =
          Variable<int>(huddleTimerInSeconds.value);
    }
    if (integrationEntityId.present) {
      map['integration_entity_id'] =
          Variable<String>(integrationEntityId.value);
    }
    if (integrationAdditionalData.present) {
      map['integration_additional_data'] =
          Variable<String>(integrationAdditionalData.value);
    }
    if (pacing.present) {
      map['pacing'] = Variable<int>(pacing.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImprovisationEntityCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('theme: $theme, ')
          ..write('durationsInSeconds: $durationsInSeconds, ')
          ..write('performers: $performers, ')
          ..write('notes: $notes, ')
          ..write('timeBufferInSeconds: $timeBufferInSeconds, ')
          ..write('huddleTimerInSeconds: $huddleTimerInSeconds, ')
          ..write('integrationEntityId: $integrationEntityId, ')
          ..write('integrationAdditionalData: $integrationAdditionalData, ')
          ..write('pacing: $pacing, ')
          ..write('match: $match')
          ..write(')'))
        .toString();
  }
}

class $PenaltyEntityTable extends PenaltyEntity
    with TableInfo<$PenaltyEntityTable, PenaltyEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PenaltyEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _majorMeta = const VerificationMeta('major');
  @override
  late final GeneratedColumn<bool> major = GeneratedColumn<bool>(
      'major', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("major" IN (0, 1))'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<int> team = GeneratedColumn<int>(
      'team', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES team_entity (id)'));
  static const VerificationMeta _improvisationMeta =
      const VerificationMeta('improvisation');
  @override
  late final GeneratedColumn<int> improvisation = GeneratedColumn<int>(
      'improvisation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES improvisation_entity (id)'));
  static const VerificationMeta _performerMeta =
      const VerificationMeta('performer');
  @override
  late final GeneratedColumn<int> performer = GeneratedColumn<int>(
      'performer', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES performer_entity (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdDate,
        modifiedDate,
        major,
        type,
        match,
        team,
        improvisation,
        performer
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'penalty_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PenaltyEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('major')) {
      context.handle(
          _majorMeta, major.isAcceptableOrUnknown(data['major']!, _majorMeta));
    } else if (isInserting) {
      context.missing(_majorMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
    } else if (isInserting) {
      context.missing(_matchMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('improvisation')) {
      context.handle(
          _improvisationMeta,
          improvisation.isAcceptableOrUnknown(
              data['improvisation']!, _improvisationMeta));
    } else if (isInserting) {
      context.missing(_improvisationMeta);
    }
    if (data.containsKey('performer')) {
      context.handle(_performerMeta,
          performer.isAcceptableOrUnknown(data['performer']!, _performerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PenaltyEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PenaltyEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      major: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}major'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team'])!,
      improvisation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}improvisation'])!,
      performer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}performer']),
    );
  }

  @override
  $PenaltyEntityTable createAlias(String alias) {
    return $PenaltyEntityTable(attachedDatabase, alias);
  }
}

class PenaltyEntityData extends DataClass
    implements Insertable<PenaltyEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final bool major;
  final String type;
  final int match;
  final int team;
  final int improvisation;
  final int? performer;
  const PenaltyEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.major,
      required this.type,
      required this.match,
      required this.team,
      required this.improvisation,
      this.performer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['major'] = Variable<bool>(major);
    map['type'] = Variable<String>(type);
    map['match'] = Variable<int>(match);
    map['team'] = Variable<int>(team);
    map['improvisation'] = Variable<int>(improvisation);
    if (!nullToAbsent || performer != null) {
      map['performer'] = Variable<int>(performer);
    }
    return map;
  }

  PenaltyEntityCompanion toCompanion(bool nullToAbsent) {
    return PenaltyEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      major: Value(major),
      type: Value(type),
      match: Value(match),
      team: Value(team),
      improvisation: Value(improvisation),
      performer: performer == null && nullToAbsent
          ? const Value.absent()
          : Value(performer),
    );
  }

  factory PenaltyEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PenaltyEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      major: serializer.fromJson<bool>(json['major']),
      type: serializer.fromJson<String>(json['type']),
      match: serializer.fromJson<int>(json['match']),
      team: serializer.fromJson<int>(json['team']),
      improvisation: serializer.fromJson<int>(json['improvisation']),
      performer: serializer.fromJson<int?>(json['performer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'major': serializer.toJson<bool>(major),
      'type': serializer.toJson<String>(type),
      'match': serializer.toJson<int>(match),
      'team': serializer.toJson<int>(team),
      'improvisation': serializer.toJson<int>(improvisation),
      'performer': serializer.toJson<int?>(performer),
    };
  }

  PenaltyEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          bool? major,
          String? type,
          int? match,
          int? team,
          int? improvisation,
          Value<int?> performer = const Value.absent()}) =>
      PenaltyEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        major: major ?? this.major,
        type: type ?? this.type,
        match: match ?? this.match,
        team: team ?? this.team,
        improvisation: improvisation ?? this.improvisation,
        performer: performer.present ? performer.value : this.performer,
      );
  PenaltyEntityData copyWithCompanion(PenaltyEntityCompanion data) {
    return PenaltyEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      major: data.major.present ? data.major.value : this.major,
      type: data.type.present ? data.type.value : this.type,
      match: data.match.present ? data.match.value : this.match,
      team: data.team.present ? data.team.value : this.team,
      improvisation: data.improvisation.present
          ? data.improvisation.value
          : this.improvisation,
      performer: data.performer.present ? data.performer.value : this.performer,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PenaltyEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('major: $major, ')
          ..write('type: $type, ')
          ..write('match: $match, ')
          ..write('team: $team, ')
          ..write('improvisation: $improvisation, ')
          ..write('performer: $performer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, modifiedDate, major, type,
      match, team, improvisation, performer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PenaltyEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.major == this.major &&
          other.type == this.type &&
          other.match == this.match &&
          other.team == this.team &&
          other.improvisation == this.improvisation &&
          other.performer == this.performer);
}

class PenaltyEntityCompanion extends UpdateCompanion<PenaltyEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<bool> major;
  final Value<String> type;
  final Value<int> match;
  final Value<int> team;
  final Value<int> improvisation;
  final Value<int?> performer;
  const PenaltyEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.major = const Value.absent(),
    this.type = const Value.absent(),
    this.match = const Value.absent(),
    this.team = const Value.absent(),
    this.improvisation = const Value.absent(),
    this.performer = const Value.absent(),
  });
  PenaltyEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required bool major,
    required String type,
    required int match,
    required int team,
    required int improvisation,
    this.performer = const Value.absent(),
  })  : major = Value(major),
        type = Value(type),
        match = Value(match),
        team = Value(team),
        improvisation = Value(improvisation);
  static Insertable<PenaltyEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<bool>? major,
    Expression<String>? type,
    Expression<int>? match,
    Expression<int>? team,
    Expression<int>? improvisation,
    Expression<int>? performer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (major != null) 'major': major,
      if (type != null) 'type': type,
      if (match != null) 'match': match,
      if (team != null) 'team': team,
      if (improvisation != null) 'improvisation': improvisation,
      if (performer != null) 'performer': performer,
    });
  }

  PenaltyEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<bool>? major,
      Value<String>? type,
      Value<int>? match,
      Value<int>? team,
      Value<int>? improvisation,
      Value<int?>? performer}) {
    return PenaltyEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      major: major ?? this.major,
      type: type ?? this.type,
      match: match ?? this.match,
      team: team ?? this.team,
      improvisation: improvisation ?? this.improvisation,
      performer: performer ?? this.performer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (major.present) {
      map['major'] = Variable<bool>(major.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    if (improvisation.present) {
      map['improvisation'] = Variable<int>(improvisation.value);
    }
    if (performer.present) {
      map['performer'] = Variable<int>(performer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PenaltyEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('major: $major, ')
          ..write('type: $type, ')
          ..write('match: $match, ')
          ..write('team: $team, ')
          ..write('improvisation: $improvisation, ')
          ..write('performer: $performer')
          ..write(')'))
        .toString();
  }
}

class $PointEntityTable extends PointEntity
    with TableInfo<$PointEntityTable, PointEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<int> team = GeneratedColumn<int>(
      'team', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES team_entity (id)'));
  static const VerificationMeta _improvisationMeta =
      const VerificationMeta('improvisation');
  @override
  late final GeneratedColumn<int> improvisation = GeneratedColumn<int>(
      'improvisation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES improvisation_entity (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdDate, modifiedDate, value, match, team, improvisation];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'point_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PointEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
    } else if (isInserting) {
      context.missing(_matchMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('improvisation')) {
      context.handle(
          _improvisationMeta,
          improvisation.isAcceptableOrUnknown(
              data['improvisation']!, _improvisationMeta));
    } else if (isInserting) {
      context.missing(_improvisationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team'])!,
      improvisation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}improvisation'])!,
    );
  }

  @override
  $PointEntityTable createAlias(String alias) {
    return $PointEntityTable(attachedDatabase, alias);
  }
}

class PointEntityData extends DataClass implements Insertable<PointEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int value;
  final int match;
  final int team;
  final int improvisation;
  const PointEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.value,
      required this.match,
      required this.team,
      required this.improvisation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['value'] = Variable<int>(value);
    map['match'] = Variable<int>(match);
    map['team'] = Variable<int>(team);
    map['improvisation'] = Variable<int>(improvisation);
    return map;
  }

  PointEntityCompanion toCompanion(bool nullToAbsent) {
    return PointEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      value: Value(value),
      match: Value(match),
      team: Value(team),
      improvisation: Value(improvisation),
    );
  }

  factory PointEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      value: serializer.fromJson<int>(json['value']),
      match: serializer.fromJson<int>(json['match']),
      team: serializer.fromJson<int>(json['team']),
      improvisation: serializer.fromJson<int>(json['improvisation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'value': serializer.toJson<int>(value),
      'match': serializer.toJson<int>(match),
      'team': serializer.toJson<int>(team),
      'improvisation': serializer.toJson<int>(improvisation),
    };
  }

  PointEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? value,
          int? match,
          int? team,
          int? improvisation}) =>
      PointEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        value: value ?? this.value,
        match: match ?? this.match,
        team: team ?? this.team,
        improvisation: improvisation ?? this.improvisation,
      );
  PointEntityData copyWithCompanion(PointEntityCompanion data) {
    return PointEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      value: data.value.present ? data.value.value : this.value,
      match: data.match.present ? data.match.value : this.match,
      team: data.team.present ? data.team.value : this.team,
      improvisation: data.improvisation.present
          ? data.improvisation.value
          : this.improvisation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('value: $value, ')
          ..write('match: $match, ')
          ..write('team: $team, ')
          ..write('improvisation: $improvisation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdDate, modifiedDate, value, match, team, improvisation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.value == this.value &&
          other.match == this.match &&
          other.team == this.team &&
          other.improvisation == this.improvisation);
}

class PointEntityCompanion extends UpdateCompanion<PointEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> value;
  final Value<int> match;
  final Value<int> team;
  final Value<int> improvisation;
  const PointEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.value = const Value.absent(),
    this.match = const Value.absent(),
    this.team = const Value.absent(),
    this.improvisation = const Value.absent(),
  });
  PointEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int value,
    required int match,
    required int team,
    required int improvisation,
  })  : value = Value(value),
        match = Value(match),
        team = Value(team),
        improvisation = Value(improvisation);
  static Insertable<PointEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? value,
    Expression<int>? match,
    Expression<int>? team,
    Expression<int>? improvisation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (value != null) 'value': value,
      if (match != null) 'match': match,
      if (team != null) 'team': team,
      if (improvisation != null) 'improvisation': improvisation,
    });
  }

  PointEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? value,
      Value<int>? match,
      Value<int>? team,
      Value<int>? improvisation}) {
    return PointEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      value: value ?? this.value,
      match: match ?? this.match,
      team: team ?? this.team,
      improvisation: improvisation ?? this.improvisation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    if (improvisation.present) {
      map['improvisation'] = Variable<int>(improvisation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('value: $value, ')
          ..write('match: $match, ')
          ..write('team: $team, ')
          ..write('improvisation: $improvisation')
          ..write(')'))
        .toString();
  }
}

class $StarEntityTable extends StarEntity
    with TableInfo<$StarEntityTable, StarEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StarEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
  static const VerificationMeta _performerMeta =
      const VerificationMeta('performer');
  @override
  late final GeneratedColumn<int> performer = GeneratedColumn<int>(
      'performer', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES performer_entity (id)'));
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<int> team = GeneratedColumn<int>(
      'team', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES team_entity (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdDate, modifiedDate, match, performer, team];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'star_entity';
  @override
  VerificationContext validateIntegrity(Insertable<StarEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
    } else if (isInserting) {
      context.missing(_matchMeta);
    }
    if (data.containsKey('performer')) {
      context.handle(_performerMeta,
          performer.isAcceptableOrUnknown(data['performer']!, _performerMeta));
    } else if (isInserting) {
      context.missing(_performerMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StarEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StarEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match'])!,
      performer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}performer'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team'])!,
    );
  }

  @override
  $StarEntityTable createAlias(String alias) {
    return $StarEntityTable(attachedDatabase, alias);
  }
}

class StarEntityData extends DataClass implements Insertable<StarEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int match;
  final int performer;
  final int team;
  const StarEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.match,
      required this.performer,
      required this.team});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['match'] = Variable<int>(match);
    map['performer'] = Variable<int>(performer);
    map['team'] = Variable<int>(team);
    return map;
  }

  StarEntityCompanion toCompanion(bool nullToAbsent) {
    return StarEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      match: Value(match),
      performer: Value(performer),
      team: Value(team),
    );
  }

  factory StarEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StarEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      match: serializer.fromJson<int>(json['match']),
      performer: serializer.fromJson<int>(json['performer']),
      team: serializer.fromJson<int>(json['team']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'match': serializer.toJson<int>(match),
      'performer': serializer.toJson<int>(performer),
      'team': serializer.toJson<int>(team),
    };
  }

  StarEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? match,
          int? performer,
          int? team}) =>
      StarEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        match: match ?? this.match,
        performer: performer ?? this.performer,
        team: team ?? this.team,
      );
  StarEntityData copyWithCompanion(StarEntityCompanion data) {
    return StarEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      match: data.match.present ? data.match.value : this.match,
      performer: data.performer.present ? data.performer.value : this.performer,
      team: data.team.present ? data.team.value : this.team,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StarEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('match: $match, ')
          ..write('performer: $performer, ')
          ..write('team: $team')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdDate, modifiedDate, match, performer, team);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StarEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.match == this.match &&
          other.performer == this.performer &&
          other.team == this.team);
}

class StarEntityCompanion extends UpdateCompanion<StarEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> match;
  final Value<int> performer;
  final Value<int> team;
  const StarEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.match = const Value.absent(),
    this.performer = const Value.absent(),
    this.team = const Value.absent(),
  });
  StarEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int match,
    required int performer,
    required int team,
  })  : match = Value(match),
        performer = Value(performer),
        team = Value(team);
  static Insertable<StarEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? match,
    Expression<int>? performer,
    Expression<int>? team,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (match != null) 'match': match,
      if (performer != null) 'performer': performer,
      if (team != null) 'team': team,
    });
  }

  StarEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? match,
      Value<int>? performer,
      Value<int>? team}) {
    return StarEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      match: match ?? this.match,
      performer: performer ?? this.performer,
      team: team ?? this.team,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
    }
    if (performer.present) {
      map['performer'] = Variable<int>(performer.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StarEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('match: $match, ')
          ..write('performer: $performer, ')
          ..write('team: $team')
          ..write(')'))
        .toString();
  }
}

class $TagEntityTable extends TagEntity
    with TableInfo<$TagEntityTable, TagEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagEntityTable(this.attachedDatabase, [this._alias]);
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
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, name, createdDate, modifiedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TagEntityData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
    );
  }

  @override
  $TagEntityTable createAlias(String alias) {
    return $TagEntityTable(attachedDatabase, alias);
  }
}

class TagEntityData extends DataClass implements Insertable<TagEntityData> {
  final int id;
  final String name;
  final DateTime createdDate;
  final DateTime modifiedDate;
  const TagEntityData(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    return map;
  }

  TagEntityCompanion toCompanion(bool nullToAbsent) {
    return TagEntityCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
    );
  }

  factory TagEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
    };
  }

  TagEntityData copyWith(
          {int? id,
          String? name,
          DateTime? createdDate,
          DateTime? modifiedDate}) =>
      TagEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
      );
  TagEntityData copyWithCompanion(TagEntityCompanion data) {
    return TagEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdDate, modifiedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate);
}

class TagEntityCompanion extends UpdateCompanion<TagEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  const TagEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
  });
  TagEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TagEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
    });
  }

  TagEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate}) {
    return TagEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate')
          ..write(')'))
        .toString();
  }
}

class $PacingTagEntityTable extends PacingTagEntity
    with TableInfo<$PacingTagEntityTable, PacingTagEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PacingTagEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<int> tag = GeneratedColumn<int>(
      'tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag_entity (id)'));
  static const VerificationMeta _pacingMeta = const VerificationMeta('pacing');
  @override
  late final GeneratedColumn<int> pacing = GeneratedColumn<int>(
      'pacing', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pacing_entity (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdDate, modifiedDate, tag, pacing];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pacing_tag_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PacingTagEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('pacing')) {
      context.handle(_pacingMeta,
          pacing.isAcceptableOrUnknown(data['pacing']!, _pacingMeta));
    } else if (isInserting) {
      context.missing(_pacingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PacingTagEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PacingTagEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag'])!,
      pacing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pacing'])!,
    );
  }

  @override
  $PacingTagEntityTable createAlias(String alias) {
    return $PacingTagEntityTable(attachedDatabase, alias);
  }
}

class PacingTagEntityData extends DataClass
    implements Insertable<PacingTagEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int tag;
  final int pacing;
  const PacingTagEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.tag,
      required this.pacing});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['tag'] = Variable<int>(tag);
    map['pacing'] = Variable<int>(pacing);
    return map;
  }

  PacingTagEntityCompanion toCompanion(bool nullToAbsent) {
    return PacingTagEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      tag: Value(tag),
      pacing: Value(pacing),
    );
  }

  factory PacingTagEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PacingTagEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      tag: serializer.fromJson<int>(json['tag']),
      pacing: serializer.fromJson<int>(json['pacing']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'tag': serializer.toJson<int>(tag),
      'pacing': serializer.toJson<int>(pacing),
    };
  }

  PacingTagEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? tag,
          int? pacing}) =>
      PacingTagEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        tag: tag ?? this.tag,
        pacing: pacing ?? this.pacing,
      );
  PacingTagEntityData copyWithCompanion(PacingTagEntityCompanion data) {
    return PacingTagEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      tag: data.tag.present ? data.tag.value : this.tag,
      pacing: data.pacing.present ? data.pacing.value : this.pacing,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PacingTagEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('pacing: $pacing')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, modifiedDate, tag, pacing);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PacingTagEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.tag == this.tag &&
          other.pacing == this.pacing);
}

class PacingTagEntityCompanion extends UpdateCompanion<PacingTagEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> tag;
  final Value<int> pacing;
  const PacingTagEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.tag = const Value.absent(),
    this.pacing = const Value.absent(),
  });
  PacingTagEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int tag,
    required int pacing,
  })  : tag = Value(tag),
        pacing = Value(pacing);
  static Insertable<PacingTagEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? tag,
    Expression<int>? pacing,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (tag != null) 'tag': tag,
      if (pacing != null) 'pacing': pacing,
    });
  }

  PacingTagEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? tag,
      Value<int>? pacing}) {
    return PacingTagEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      tag: tag ?? this.tag,
      pacing: pacing ?? this.pacing,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    if (pacing.present) {
      map['pacing'] = Variable<int>(pacing.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PacingTagEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('pacing: $pacing')
          ..write(')'))
        .toString();
  }
}

class $MatchTagEntityTable extends MatchTagEntity
    with TableInfo<$MatchTagEntityTable, MatchTagEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchTagEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<int> tag = GeneratedColumn<int>(
      'tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag_entity (id)'));
  static const VerificationMeta _matchMeta = const VerificationMeta('match');
  @override
  late final GeneratedColumn<int> match = GeneratedColumn<int>(
      'match', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES match_entity (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdDate, modifiedDate, tag, match];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'match_tag_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MatchTagEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('match')) {
      context.handle(
          _matchMeta, match.isAcceptableOrUnknown(data['match']!, _matchMeta));
    } else if (isInserting) {
      context.missing(_matchMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MatchTagEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MatchTagEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag'])!,
      match: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}match'])!,
    );
  }

  @override
  $MatchTagEntityTable createAlias(String alias) {
    return $MatchTagEntityTable(attachedDatabase, alias);
  }
}

class MatchTagEntityData extends DataClass
    implements Insertable<MatchTagEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int tag;
  final int match;
  const MatchTagEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.tag,
      required this.match});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['tag'] = Variable<int>(tag);
    map['match'] = Variable<int>(match);
    return map;
  }

  MatchTagEntityCompanion toCompanion(bool nullToAbsent) {
    return MatchTagEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      tag: Value(tag),
      match: Value(match),
    );
  }

  factory MatchTagEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MatchTagEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      tag: serializer.fromJson<int>(json['tag']),
      match: serializer.fromJson<int>(json['match']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'tag': serializer.toJson<int>(tag),
      'match': serializer.toJson<int>(match),
    };
  }

  MatchTagEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? tag,
          int? match}) =>
      MatchTagEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        tag: tag ?? this.tag,
        match: match ?? this.match,
      );
  MatchTagEntityData copyWithCompanion(MatchTagEntityCompanion data) {
    return MatchTagEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      tag: data.tag.present ? data.tag.value : this.tag,
      match: data.match.present ? data.match.value : this.match,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MatchTagEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('match: $match')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, modifiedDate, tag, match);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MatchTagEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.tag == this.tag &&
          other.match == this.match);
}

class MatchTagEntityCompanion extends UpdateCompanion<MatchTagEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> tag;
  final Value<int> match;
  const MatchTagEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.tag = const Value.absent(),
    this.match = const Value.absent(),
  });
  MatchTagEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int tag,
    required int match,
  })  : tag = Value(tag),
        match = Value(match);
  static Insertable<MatchTagEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? tag,
    Expression<int>? match,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (tag != null) 'tag': tag,
      if (match != null) 'match': match,
    });
  }

  MatchTagEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? tag,
      Value<int>? match}) {
    return MatchTagEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      tag: tag ?? this.tag,
      match: match ?? this.match,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    if (match.present) {
      map['match'] = Variable<int>(match.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchTagEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('match: $match')
          ..write(')'))
        .toString();
  }
}

class $TeamTagEntityTable extends TeamTagEntity
    with TableInfo<$TeamTagEntityTable, TeamTagEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamTagEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<int> tag = GeneratedColumn<int>(
      'tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag_entity (id)'));
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<int> team = GeneratedColumn<int>(
      'team', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES team_entity (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdDate, modifiedDate, tag, team];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'team_tag_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TeamTagEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamTagEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamTagEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team'])!,
    );
  }

  @override
  $TeamTagEntityTable createAlias(String alias) {
    return $TeamTagEntityTable(attachedDatabase, alias);
  }
}

class TeamTagEntityData extends DataClass
    implements Insertable<TeamTagEntityData> {
  final int id;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int tag;
  final int team;
  const TeamTagEntityData(
      {required this.id,
      required this.createdDate,
      required this.modifiedDate,
      required this.tag,
      required this.team});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    map['tag'] = Variable<int>(tag);
    map['team'] = Variable<int>(team);
    return map;
  }

  TeamTagEntityCompanion toCompanion(bool nullToAbsent) {
    return TeamTagEntityCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      tag: Value(tag),
      team: Value(team),
    );
  }

  factory TeamTagEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamTagEntityData(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      tag: serializer.fromJson<int>(json['tag']),
      team: serializer.fromJson<int>(json['team']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'tag': serializer.toJson<int>(tag),
      'team': serializer.toJson<int>(team),
    };
  }

  TeamTagEntityData copyWith(
          {int? id,
          DateTime? createdDate,
          DateTime? modifiedDate,
          int? tag,
          int? team}) =>
      TeamTagEntityData(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        tag: tag ?? this.tag,
        team: team ?? this.team,
      );
  TeamTagEntityData copyWithCompanion(TeamTagEntityCompanion data) {
    return TeamTagEntityData(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      tag: data.tag.present ? data.tag.value : this.tag,
      team: data.team.present ? data.team.value : this.team,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamTagEntityData(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('team: $team')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, modifiedDate, tag, team);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamTagEntityData &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.tag == this.tag &&
          other.team == this.team);
}

class TeamTagEntityCompanion extends UpdateCompanion<TeamTagEntityData> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<int> tag;
  final Value<int> team;
  const TeamTagEntityCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.tag = const Value.absent(),
    this.team = const Value.absent(),
  });
  TeamTagEntityCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    required int tag,
    required int team,
  })  : tag = Value(tag),
        team = Value(team);
  static Insertable<TeamTagEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<int>? tag,
    Expression<int>? team,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (tag != null) 'tag': tag,
      if (team != null) 'team': team,
    });
  }

  TeamTagEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<int>? tag,
      Value<int>? team}) {
    return TeamTagEntityCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      tag: tag ?? this.tag,
      team: team ?? this.team,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamTagEntityCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('tag: $tag, ')
          ..write('team: $team')
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
  late final $PerformerEntityTable performerEntity =
      $PerformerEntityTable(this);
  late final $ImprovisationEntityTable improvisationEntity =
      $ImprovisationEntityTable(this);
  late final $PenaltyEntityTable penaltyEntity = $PenaltyEntityTable(this);
  late final $PointEntityTable pointEntity = $PointEntityTable(this);
  late final $StarEntityTable starEntity = $StarEntityTable(this);
  late final $TagEntityTable tagEntity = $TagEntityTable(this);
  late final $PacingTagEntityTable pacingTagEntity =
      $PacingTagEntityTable(this);
  late final $MatchTagEntityTable matchTagEntity = $MatchTagEntityTable(this);
  late final $TeamTagEntityTable teamTagEntity = $TeamTagEntityTable(this);
  late final PacingsRepository pacingsRepository =
      PacingsRepository(this as AppDatabase);
  late final MatchesRepository matchesRepository =
      MatchesRepository(this as AppDatabase);
  late final TeamsRepository teamsRepository =
      TeamsRepository(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        pacingEntity,
        matchEntity,
        teamEntity,
        performerEntity,
        improvisationEntity,
        penaltyEntity,
        pointEntity,
        starEntity,
        tagEntity,
        pacingTagEntity,
        matchTagEntity,
        teamTagEntity
      ];
}

typedef $$PacingEntityTableCreateCompanionBuilder = PacingEntityCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> defaultNumberOfTeams,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});
typedef $$PacingEntityTableUpdateCompanionBuilder = PacingEntityCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> defaultNumberOfTeams,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});

final class $$PacingEntityTableReferences extends BaseReferences<_$AppDatabase,
    $PacingEntityTable, PacingEntityData> {
  $$PacingEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ImprovisationEntityTable,
      List<ImprovisationEntityData>> _improvisationEntityRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.improvisationEntity,
          aliasName: $_aliasNameGenerator(
              db.pacingEntity.id, db.improvisationEntity.pacing));

  $$ImprovisationEntityTableProcessedTableManager get improvisationEntityRefs {
    final manager =
        $$ImprovisationEntityTableTableManager($_db, $_db.improvisationEntity)
            .filter((f) => f.pacing.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_improvisationEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PacingTagEntityTable, List<PacingTagEntityData>>
      _pacingTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pacingTagEntity,
              aliasName: $_aliasNameGenerator(
                  db.pacingEntity.id, db.pacingTagEntity.pacing));

  $$PacingTagEntityTableProcessedTableManager get pacingTagEntityRefs {
    final manager =
        $$PacingTagEntityTableTableManager($_db, $_db.pacingTagEntity)
            .filter((f) => f.pacing.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_pacingTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> improvisationEntityRefs(
      Expression<bool> Function($$ImprovisationEntityTableFilterComposer f) f) {
    final $$ImprovisationEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.improvisationEntity,
        getReferencedColumn: (t) => t.pacing,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImprovisationEntityTableFilterComposer(
              $db: $db,
              $table: $db.improvisationEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pacingTagEntityRefs(
      Expression<bool> Function($$PacingTagEntityTableFilterComposer f) f) {
    final $$PacingTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pacingTagEntity,
        getReferencedColumn: (t) => t.pacing,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.pacingTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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

  GeneratedColumn<int> get defaultNumberOfTeams => $composableBuilder(
      column: $table.defaultNumberOfTeams, builder: (column) => column);

  GeneratedColumn<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => column);

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);

  Expression<T> improvisationEntityRefs<T extends Object>(
      Expression<T> Function($$ImprovisationEntityTableAnnotationComposer a)
          f) {
    final $$ImprovisationEntityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.pacing,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> pacingTagEntityRefs<T extends Object>(
      Expression<T> Function($$PacingTagEntityTableAnnotationComposer a) f) {
    final $$PacingTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pacingTagEntity,
        getReferencedColumn: (t) => t.pacing,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pacingTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (PacingEntityData, $$PacingEntityTableReferences),
    PacingEntityData,
    PrefetchHooks Function(
        {bool improvisationEntityRefs, bool pacingTagEntityRefs})> {
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
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
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
            defaultNumberOfTeams: defaultNumberOfTeams,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
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
            defaultNumberOfTeams: defaultNumberOfTeams,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PacingEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {improvisationEntityRefs = false, pacingTagEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (improvisationEntityRefs) db.improvisationEntity,
                if (pacingTagEntityRefs) db.pacingTagEntity
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (improvisationEntityRefs)
                    await $_getPrefetchedData<PacingEntityData,
                            $PacingEntityTable, ImprovisationEntityData>(
                        currentTable: table,
                        referencedTable: $$PacingEntityTableReferences
                            ._improvisationEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PacingEntityTableReferences(db, table, p0)
                                .improvisationEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.pacing == item.id),
                        typedResults: items),
                  if (pacingTagEntityRefs)
                    await $_getPrefetchedData<PacingEntityData,
                            $PacingEntityTable, PacingTagEntityData>(
                        currentTable: table,
                        referencedTable: $$PacingEntityTableReferences
                            ._pacingTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PacingEntityTableReferences(db, table, p0)
                                .pacingTagEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.pacing == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (PacingEntityData, $$PacingEntityTableReferences),
    PacingEntityData,
    PrefetchHooks Function(
        {bool improvisationEntityRefs, bool pacingTagEntityRefs})>;
typedef $$MatchEntityTableCreateCompanionBuilder = MatchEntityCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
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
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
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

final class $$MatchEntityTableReferences
    extends BaseReferences<_$AppDatabase, $MatchEntityTable, MatchEntityData> {
  $$MatchEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TeamEntityTable, List<TeamEntityData>>
      _teamEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.teamEntity,
              aliasName:
                  $_aliasNameGenerator(db.matchEntity.id, db.teamEntity.match));

  $$TeamEntityTableProcessedTableManager get teamEntityRefs {
    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teamEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ImprovisationEntityTable,
      List<ImprovisationEntityData>> _improvisationEntityRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.improvisationEntity,
          aliasName: $_aliasNameGenerator(
              db.matchEntity.id, db.improvisationEntity.match));

  $$ImprovisationEntityTableProcessedTableManager get improvisationEntityRefs {
    final manager =
        $$ImprovisationEntityTableTableManager($_db, $_db.improvisationEntity)
            .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_improvisationEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PenaltyEntityTable, List<PenaltyEntityData>>
      _penaltyEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.penaltyEntity,
              aliasName: $_aliasNameGenerator(
                  db.matchEntity.id, db.penaltyEntity.match));

  $$PenaltyEntityTableProcessedTableManager get penaltyEntityRefs {
    final manager = $$PenaltyEntityTableTableManager($_db, $_db.penaltyEntity)
        .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_penaltyEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PointEntityTable, List<PointEntityData>>
      _pointEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.pointEntity,
          aliasName:
              $_aliasNameGenerator(db.matchEntity.id, db.pointEntity.match));

  $$PointEntityTableProcessedTableManager get pointEntityRefs {
    final manager = $$PointEntityTableTableManager($_db, $_db.pointEntity)
        .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pointEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StarEntityTable, List<StarEntityData>>
      _starEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.starEntity,
              aliasName:
                  $_aliasNameGenerator(db.matchEntity.id, db.starEntity.match));

  $$StarEntityTableProcessedTableManager get starEntityRefs {
    final manager = $$StarEntityTableTableManager($_db, $_db.starEntity)
        .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_starEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MatchTagEntityTable, List<MatchTagEntityData>>
      _matchTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.matchTagEntity,
              aliasName: $_aliasNameGenerator(
                  db.matchEntity.id, db.matchTagEntity.match));

  $$MatchTagEntityTableProcessedTableManager get matchTagEntityRefs {
    final manager = $$MatchTagEntityTableTableManager($_db, $_db.matchTagEntity)
        .filter((f) => f.match.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_matchTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> teamEntityRefs(
      Expression<bool> Function($$TeamEntityTableFilterComposer f) f) {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> improvisationEntityRefs(
      Expression<bool> Function($$ImprovisationEntityTableFilterComposer f) f) {
    final $$ImprovisationEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.improvisationEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImprovisationEntityTableFilterComposer(
              $db: $db,
              $table: $db.improvisationEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> penaltyEntityRefs(
      Expression<bool> Function($$PenaltyEntityTableFilterComposer f) f) {
    final $$PenaltyEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableFilterComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pointEntityRefs(
      Expression<bool> Function($$PointEntityTableFilterComposer f) f) {
    final $$PointEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableFilterComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> starEntityRefs(
      Expression<bool> Function($$StarEntityTableFilterComposer f) f) {
    final $$StarEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableFilterComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> matchTagEntityRefs(
      Expression<bool> Function($$MatchTagEntityTableFilterComposer f) f) {
    final $$MatchTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.matchTagEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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

  Expression<T> teamEntityRefs<T extends Object>(
      Expression<T> Function($$TeamEntityTableAnnotationComposer a) f) {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> improvisationEntityRefs<T extends Object>(
      Expression<T> Function($$ImprovisationEntityTableAnnotationComposer a)
          f) {
    final $$ImprovisationEntityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.match,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> penaltyEntityRefs<T extends Object>(
      Expression<T> Function($$PenaltyEntityTableAnnotationComposer a) f) {
    final $$PenaltyEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pointEntityRefs<T extends Object>(
      Expression<T> Function($$PointEntityTableAnnotationComposer a) f) {
    final $$PointEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> starEntityRefs<T extends Object>(
      Expression<T> Function($$StarEntityTableAnnotationComposer a) f) {
    final $$StarEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> matchTagEntityRefs<T extends Object>(
      Expression<T> Function($$MatchTagEntityTableAnnotationComposer a) f) {
    final $$MatchTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.matchTagEntity,
        getReferencedColumn: (t) => t.match,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (MatchEntityData, $$MatchEntityTableReferences),
    MatchEntityData,
    PrefetchHooks Function(
        {bool teamEntityRefs,
        bool improvisationEntityRefs,
        bool penaltyEntityRefs,
        bool pointEntityRefs,
        bool starEntityRefs,
        bool matchTagEntityRefs})> {
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
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
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
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
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
              .map((e) => (
                    e.readTable(table),
                    $$MatchEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {teamEntityRefs = false,
              improvisationEntityRefs = false,
              penaltyEntityRefs = false,
              pointEntityRefs = false,
              starEntityRefs = false,
              matchTagEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (teamEntityRefs) db.teamEntity,
                if (improvisationEntityRefs) db.improvisationEntity,
                if (penaltyEntityRefs) db.penaltyEntity,
                if (pointEntityRefs) db.pointEntity,
                if (starEntityRefs) db.starEntity,
                if (matchTagEntityRefs) db.matchTagEntity
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teamEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, TeamEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._teamEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .teamEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items),
                  if (improvisationEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, ImprovisationEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._improvisationEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .improvisationEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items),
                  if (penaltyEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, PenaltyEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._penaltyEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .penaltyEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items),
                  if (pointEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, PointEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._pointEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .pointEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items),
                  if (starEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, StarEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._starEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .starEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items),
                  if (matchTagEntityRefs)
                    await $_getPrefetchedData<MatchEntityData,
                            $MatchEntityTable, MatchTagEntityData>(
                        currentTable: table,
                        referencedTable: $$MatchEntityTableReferences
                            ._matchTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MatchEntityTableReferences(db, table, p0)
                                .matchTagEntityRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.match == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (MatchEntityData, $$MatchEntityTableReferences),
    MatchEntityData,
    PrefetchHooks Function(
        {bool teamEntityRefs,
        bool improvisationEntityRefs,
        bool penaltyEntityRefs,
        bool pointEntityRefs,
        bool starEntityRefs,
        bool matchTagEntityRefs})>;
typedef $$TeamEntityTableCreateCompanionBuilder = TeamEntityCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int color,
  Value<int?> match,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});
typedef $$TeamEntityTableUpdateCompanionBuilder = TeamEntityCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> color,
  Value<int?> match,
  Value<String?> integrationId,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});

final class $$TeamEntityTableReferences
    extends BaseReferences<_$AppDatabase, $TeamEntityTable, TeamEntityData> {
  $$TeamEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias(
          $_aliasNameGenerator(db.teamEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager? get match {
    final $_column = $_itemColumn<int>('match');
    if ($_column == null) return null;
    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PerformerEntityTable, List<PerformerEntityData>>
      _performerEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.performerEntity,
              aliasName: $_aliasNameGenerator(
                  db.teamEntity.id, db.performerEntity.team));

  $$PerformerEntityTableProcessedTableManager get performerEntityRefs {
    final manager =
        $$PerformerEntityTableTableManager($_db, $_db.performerEntity)
            .filter((f) => f.team.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_performerEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PenaltyEntityTable, List<PenaltyEntityData>>
      _penaltyEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.penaltyEntity,
              aliasName: $_aliasNameGenerator(
                  db.teamEntity.id, db.penaltyEntity.team));

  $$PenaltyEntityTableProcessedTableManager get penaltyEntityRefs {
    final manager = $$PenaltyEntityTableTableManager($_db, $_db.penaltyEntity)
        .filter((f) => f.team.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_penaltyEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PointEntityTable, List<PointEntityData>>
      _pointEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pointEntity,
              aliasName:
                  $_aliasNameGenerator(db.teamEntity.id, db.pointEntity.team));

  $$PointEntityTableProcessedTableManager get pointEntityRefs {
    final manager = $$PointEntityTableTableManager($_db, $_db.pointEntity)
        .filter((f) => f.team.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pointEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StarEntityTable, List<StarEntityData>>
      _starEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.starEntity,
              aliasName:
                  $_aliasNameGenerator(db.teamEntity.id, db.starEntity.team));

  $$StarEntityTableProcessedTableManager get starEntityRefs {
    final manager = $$StarEntityTableTableManager($_db, $_db.starEntity)
        .filter((f) => f.team.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_starEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TeamTagEntityTable, List<TeamTagEntityData>>
      _teamTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.teamTagEntity,
              aliasName: $_aliasNameGenerator(
                  db.teamEntity.id, db.teamTagEntity.team));

  $$TeamTagEntityTableProcessedTableManager get teamTagEntityRefs {
    final manager = $$TeamTagEntityTableTableManager($_db, $_db.teamTagEntity)
        .filter((f) => f.team.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teamTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  ColumnFilters<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnFilters(column));

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> performerEntityRefs(
      Expression<bool> Function($$PerformerEntityTableFilterComposer f) f) {
    final $$PerformerEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableFilterComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> penaltyEntityRefs(
      Expression<bool> Function($$PenaltyEntityTableFilterComposer f) f) {
    final $$PenaltyEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableFilterComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pointEntityRefs(
      Expression<bool> Function($$PointEntityTableFilterComposer f) f) {
    final $$PointEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableFilterComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> starEntityRefs(
      Expression<bool> Function($$StarEntityTableFilterComposer f) f) {
    final $$StarEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableFilterComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> teamTagEntityRefs(
      Expression<bool> Function($$TeamTagEntityTableFilterComposer f) f) {
    final $$TeamTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamTagEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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

  ColumnOrderings<String> get integrationId => $composableBuilder(
      column: $table.integrationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnOrderings(column));

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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

  GeneratedColumn<String> get integrationId => $composableBuilder(
      column: $table.integrationId, builder: (column) => column);

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> performerEntityRefs<T extends Object>(
      Expression<T> Function($$PerformerEntityTableAnnotationComposer a) f) {
    final $$PerformerEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> penaltyEntityRefs<T extends Object>(
      Expression<T> Function($$PenaltyEntityTableAnnotationComposer a) f) {
    final $$PenaltyEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pointEntityRefs<T extends Object>(
      Expression<T> Function($$PointEntityTableAnnotationComposer a) f) {
    final $$PointEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> starEntityRefs<T extends Object>(
      Expression<T> Function($$StarEntityTableAnnotationComposer a) f) {
    final $$StarEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> teamTagEntityRefs<T extends Object>(
      Expression<T> Function($$TeamTagEntityTableAnnotationComposer a) f) {
    final $$TeamTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamTagEntity,
        getReferencedColumn: (t) => t.team,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (TeamEntityData, $$TeamEntityTableReferences),
    TeamEntityData,
    PrefetchHooks Function(
        {bool match,
        bool performerEntityRefs,
        bool penaltyEntityRefs,
        bool pointEntityRefs,
        bool starEntityRefs,
        bool teamTagEntityRefs})> {
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
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<int?> match = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              TeamEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            color: color,
            match: match,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int color,
            Value<int?> match = const Value.absent(),
            Value<String?> integrationId = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              TeamEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            color: color,
            match: match,
            integrationId: integrationId,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TeamEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {match = false,
              performerEntityRefs = false,
              penaltyEntityRefs = false,
              pointEntityRefs = false,
              starEntityRefs = false,
              teamTagEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (performerEntityRefs) db.performerEntity,
                if (penaltyEntityRefs) db.penaltyEntity,
                if (pointEntityRefs) db.pointEntity,
                if (starEntityRefs) db.starEntity,
                if (teamTagEntityRefs) db.teamTagEntity
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$TeamEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$TeamEntityTableReferences._matchTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (performerEntityRefs)
                    await $_getPrefetchedData<TeamEntityData, $TeamEntityTable,
                            PerformerEntityData>(
                        currentTable: table,
                        referencedTable: $$TeamEntityTableReferences
                            ._performerEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TeamEntityTableReferences(db, table, p0)
                                .performerEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.team == item.id),
                        typedResults: items),
                  if (penaltyEntityRefs)
                    await $_getPrefetchedData<TeamEntityData, $TeamEntityTable,
                            PenaltyEntityData>(
                        currentTable: table,
                        referencedTable: $$TeamEntityTableReferences
                            ._penaltyEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TeamEntityTableReferences(db, table, p0)
                                .penaltyEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.team == item.id),
                        typedResults: items),
                  if (pointEntityRefs)
                    await $_getPrefetchedData<TeamEntityData, $TeamEntityTable,
                            PointEntityData>(
                        currentTable: table,
                        referencedTable: $$TeamEntityTableReferences
                            ._pointEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TeamEntityTableReferences(db, table, p0)
                                .pointEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.team == item.id),
                        typedResults: items),
                  if (starEntityRefs)
                    await $_getPrefetchedData<TeamEntityData, $TeamEntityTable,
                            StarEntityData>(
                        currentTable: table,
                        referencedTable: $$TeamEntityTableReferences
                            ._starEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TeamEntityTableReferences(db, table, p0)
                                .starEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.team == item.id),
                        typedResults: items),
                  if (teamTagEntityRefs)
                    await $_getPrefetchedData<TeamEntityData, $TeamEntityTable,
                            TeamTagEntityData>(
                        currentTable: table,
                        referencedTable: $$TeamEntityTableReferences
                            ._teamTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TeamEntityTableReferences(db, table, p0)
                                .teamTagEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.team == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (TeamEntityData, $$TeamEntityTableReferences),
    TeamEntityData,
    PrefetchHooks Function(
        {bool match,
        bool performerEntityRefs,
        bool penaltyEntityRefs,
        bool pointEntityRefs,
        bool starEntityRefs,
        bool teamTagEntityRefs})>;
typedef $$PerformerEntityTableCreateCompanionBuilder = PerformerEntityCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int team,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});
typedef $$PerformerEntityTableUpdateCompanionBuilder = PerformerEntityCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> team,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
});

final class $$PerformerEntityTableReferences extends BaseReferences<
    _$AppDatabase, $PerformerEntityTable, PerformerEntityData> {
  $$PerformerEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TeamEntityTable _teamTable(_$AppDatabase db) =>
      db.teamEntity.createAlias(
          $_aliasNameGenerator(db.performerEntity.team, db.teamEntity.id));

  $$TeamEntityTableProcessedTableManager get team {
    final $_column = $_itemColumn<int>('team')!;

    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PenaltyEntityTable, List<PenaltyEntityData>>
      _penaltyEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.penaltyEntity,
              aliasName: $_aliasNameGenerator(
                  db.performerEntity.id, db.penaltyEntity.performer));

  $$PenaltyEntityTableProcessedTableManager get penaltyEntityRefs {
    final manager = $$PenaltyEntityTableTableManager($_db, $_db.penaltyEntity)
        .filter((f) => f.performer.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_penaltyEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StarEntityTable, List<StarEntityData>>
      _starEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.starEntity,
              aliasName: $_aliasNameGenerator(
                  db.performerEntity.id, db.starEntity.performer));

  $$StarEntityTableProcessedTableManager get starEntityRefs {
    final manager = $$StarEntityTableTableManager($_db, $_db.starEntity)
        .filter((f) => f.performer.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_starEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PerformerEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PerformerEntityTable> {
  $$PerformerEntityTableFilterComposer({
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

  ColumnFilters<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnFilters(column));

  $$TeamEntityTableFilterComposer get team {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> penaltyEntityRefs(
      Expression<bool> Function($$PenaltyEntityTableFilterComposer f) f) {
    final $$PenaltyEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.performer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableFilterComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> starEntityRefs(
      Expression<bool> Function($$StarEntityTableFilterComposer f) f) {
    final $$StarEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.performer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableFilterComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PerformerEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PerformerEntityTable> {
  $$PerformerEntityTableOrderingComposer({
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

  ColumnOrderings<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnOrderings(column));

  $$TeamEntityTableOrderingComposer get team {
    final $$TeamEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableOrderingComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PerformerEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerformerEntityTable> {
  $$PerformerEntityTableAnnotationComposer({
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

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);

  $$TeamEntityTableAnnotationComposer get team {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> penaltyEntityRefs<T extends Object>(
      Expression<T> Function($$PenaltyEntityTableAnnotationComposer a) f) {
    final $$PenaltyEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.performer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> starEntityRefs<T extends Object>(
      Expression<T> Function($$StarEntityTableAnnotationComposer a) f) {
    final $$StarEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.starEntity,
        getReferencedColumn: (t) => t.performer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StarEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.starEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PerformerEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PerformerEntityTable,
    PerformerEntityData,
    $$PerformerEntityTableFilterComposer,
    $$PerformerEntityTableOrderingComposer,
    $$PerformerEntityTableAnnotationComposer,
    $$PerformerEntityTableCreateCompanionBuilder,
    $$PerformerEntityTableUpdateCompanionBuilder,
    (PerformerEntityData, $$PerformerEntityTableReferences),
    PerformerEntityData,
    PrefetchHooks Function(
        {bool team, bool penaltyEntityRefs, bool starEntityRefs})> {
  $$PerformerEntityTableTableManager(
      _$AppDatabase db, $PerformerEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerformerEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PerformerEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerformerEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> team = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              PerformerEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            team: team,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int team,
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
          }) =>
              PerformerEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            team: team,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PerformerEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {team = false,
              penaltyEntityRefs = false,
              starEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (penaltyEntityRefs) db.penaltyEntity,
                if (starEntityRefs) db.starEntity
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (team) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.team,
                    referencedTable:
                        $$PerformerEntityTableReferences._teamTable(db),
                    referencedColumn:
                        $$PerformerEntityTableReferences._teamTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (penaltyEntityRefs)
                    await $_getPrefetchedData<PerformerEntityData,
                            $PerformerEntityTable, PenaltyEntityData>(
                        currentTable: table,
                        referencedTable: $$PerformerEntityTableReferences
                            ._penaltyEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PerformerEntityTableReferences(db, table, p0)
                                .penaltyEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.performer == item.id),
                        typedResults: items),
                  if (starEntityRefs)
                    await $_getPrefetchedData<PerformerEntityData,
                            $PerformerEntityTable, StarEntityData>(
                        currentTable: table,
                        referencedTable: $$PerformerEntityTableReferences
                            ._starEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PerformerEntityTableReferences(db, table, p0)
                                .starEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.performer == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PerformerEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PerformerEntityTable,
    PerformerEntityData,
    $$PerformerEntityTableFilterComposer,
    $$PerformerEntityTableOrderingComposer,
    $$PerformerEntityTableAnnotationComposer,
    $$PerformerEntityTableCreateCompanionBuilder,
    $$PerformerEntityTableUpdateCompanionBuilder,
    (PerformerEntityData, $$PerformerEntityTableReferences),
    PerformerEntityData,
    PrefetchHooks Function(
        {bool team, bool penaltyEntityRefs, bool starEntityRefs})>;
typedef $$ImprovisationEntityTableCreateCompanionBuilder
    = ImprovisationEntityCompanion Function({
  Value<int> id,
  required int order,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required ImprovisationType type,
  required String category,
  required String theme,
  required List<int> durationsInSeconds,
  required String performers,
  required String notes,
  required int timeBufferInSeconds,
  required int huddleTimerInSeconds,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
  Value<int?> pacing,
  Value<int?> match,
});
typedef $$ImprovisationEntityTableUpdateCompanionBuilder
    = ImprovisationEntityCompanion Function({
  Value<int> id,
  Value<int> order,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<ImprovisationType> type,
  Value<String> category,
  Value<String> theme,
  Value<List<int>> durationsInSeconds,
  Value<String> performers,
  Value<String> notes,
  Value<int> timeBufferInSeconds,
  Value<int> huddleTimerInSeconds,
  Value<String?> integrationEntityId,
  Value<String?> integrationAdditionalData,
  Value<int?> pacing,
  Value<int?> match,
});

final class $$ImprovisationEntityTableReferences extends BaseReferences<
    _$AppDatabase, $ImprovisationEntityTable, ImprovisationEntityData> {
  $$ImprovisationEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PacingEntityTable _pacingTable(_$AppDatabase db) =>
      db.pacingEntity.createAlias($_aliasNameGenerator(
          db.improvisationEntity.pacing, db.pacingEntity.id));

  $$PacingEntityTableProcessedTableManager? get pacing {
    final $_column = $_itemColumn<int>('pacing');
    if ($_column == null) return null;
    final manager = $$PacingEntityTableTableManager($_db, $_db.pacingEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacingTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias($_aliasNameGenerator(
          db.improvisationEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager? get match {
    final $_column = $_itemColumn<int>('match');
    if ($_column == null) return null;
    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PenaltyEntityTable, List<PenaltyEntityData>>
      _penaltyEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.penaltyEntity,
              aliasName: $_aliasNameGenerator(
                  db.improvisationEntity.id, db.penaltyEntity.improvisation));

  $$PenaltyEntityTableProcessedTableManager get penaltyEntityRefs {
    final manager = $$PenaltyEntityTableTableManager($_db, $_db.penaltyEntity)
        .filter((f) => f.improvisation.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_penaltyEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PointEntityTable, List<PointEntityData>>
      _pointEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pointEntity,
              aliasName: $_aliasNameGenerator(
                  db.improvisationEntity.id, db.pointEntity.improvisation));

  $$PointEntityTableProcessedTableManager get pointEntityRefs {
    final manager = $$PointEntityTableTableManager($_db, $_db.pointEntity)
        .filter((f) => f.improvisation.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pointEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ImprovisationEntityTableFilterComposer
    extends Composer<_$AppDatabase, $ImprovisationEntityTable> {
  $$ImprovisationEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ImprovisationType, ImprovisationType, int>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
      get durationsInSeconds => $composableBuilder(
          column: $table.durationsInSeconds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get performers => $composableBuilder(
      column: $table.performers, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeBufferInSeconds => $composableBuilder(
      column: $table.timeBufferInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get huddleTimerInSeconds => $composableBuilder(
      column: $table.huddleTimerInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnFilters(column));

  $$PacingEntityTableFilterComposer get pacing {
    final $$PacingEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableFilterComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> penaltyEntityRefs(
      Expression<bool> Function($$PenaltyEntityTableFilterComposer f) f) {
    final $$PenaltyEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.improvisation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableFilterComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pointEntityRefs(
      Expression<bool> Function($$PointEntityTableFilterComposer f) f) {
    final $$PointEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.improvisation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableFilterComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ImprovisationEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $ImprovisationEntityTable> {
  $$ImprovisationEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get durationsInSeconds => $composableBuilder(
      column: $table.durationsInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performers => $composableBuilder(
      column: $table.performers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeBufferInSeconds => $composableBuilder(
      column: $table.timeBufferInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get huddleTimerInSeconds => $composableBuilder(
      column: $table.huddleTimerInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData,
      builder: (column) => ColumnOrderings(column));

  $$PacingEntityTableOrderingComposer get pacing {
    final $$PacingEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableOrderingComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ImprovisationEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImprovisationEntityTable> {
  $$ImprovisationEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ImprovisationType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get durationsInSeconds =>
      $composableBuilder(
          column: $table.durationsInSeconds, builder: (column) => column);

  GeneratedColumn<String> get performers => $composableBuilder(
      column: $table.performers, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get timeBufferInSeconds => $composableBuilder(
      column: $table.timeBufferInSeconds, builder: (column) => column);

  GeneratedColumn<int> get huddleTimerInSeconds => $composableBuilder(
      column: $table.huddleTimerInSeconds, builder: (column) => column);

  GeneratedColumn<String> get integrationEntityId => $composableBuilder(
      column: $table.integrationEntityId, builder: (column) => column);

  GeneratedColumn<String> get integrationAdditionalData => $composableBuilder(
      column: $table.integrationAdditionalData, builder: (column) => column);

  $$PacingEntityTableAnnotationComposer get pacing {
    final $$PacingEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> penaltyEntityRefs<T extends Object>(
      Expression<T> Function($$PenaltyEntityTableAnnotationComposer a) f) {
    final $$PenaltyEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.penaltyEntity,
        getReferencedColumn: (t) => t.improvisation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PenaltyEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.penaltyEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pointEntityRefs<T extends Object>(
      Expression<T> Function($$PointEntityTableAnnotationComposer a) f) {
    final $$PointEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pointEntity,
        getReferencedColumn: (t) => t.improvisation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pointEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ImprovisationEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImprovisationEntityTable,
    ImprovisationEntityData,
    $$ImprovisationEntityTableFilterComposer,
    $$ImprovisationEntityTableOrderingComposer,
    $$ImprovisationEntityTableAnnotationComposer,
    $$ImprovisationEntityTableCreateCompanionBuilder,
    $$ImprovisationEntityTableUpdateCompanionBuilder,
    (ImprovisationEntityData, $$ImprovisationEntityTableReferences),
    ImprovisationEntityData,
    PrefetchHooks Function(
        {bool pacing,
        bool match,
        bool penaltyEntityRefs,
        bool pointEntityRefs})> {
  $$ImprovisationEntityTableTableManager(
      _$AppDatabase db, $ImprovisationEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImprovisationEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImprovisationEntityTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImprovisationEntityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<ImprovisationType> type = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<List<int>> durationsInSeconds = const Value.absent(),
            Value<String> performers = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<int> timeBufferInSeconds = const Value.absent(),
            Value<int> huddleTimerInSeconds = const Value.absent(),
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
            Value<int?> pacing = const Value.absent(),
            Value<int?> match = const Value.absent(),
          }) =>
              ImprovisationEntityCompanion(
            id: id,
            order: order,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            type: type,
            category: category,
            theme: theme,
            durationsInSeconds: durationsInSeconds,
            performers: performers,
            notes: notes,
            timeBufferInSeconds: timeBufferInSeconds,
            huddleTimerInSeconds: huddleTimerInSeconds,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
            pacing: pacing,
            match: match,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int order,
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required ImprovisationType type,
            required String category,
            required String theme,
            required List<int> durationsInSeconds,
            required String performers,
            required String notes,
            required int timeBufferInSeconds,
            required int huddleTimerInSeconds,
            Value<String?> integrationEntityId = const Value.absent(),
            Value<String?> integrationAdditionalData = const Value.absent(),
            Value<int?> pacing = const Value.absent(),
            Value<int?> match = const Value.absent(),
          }) =>
              ImprovisationEntityCompanion.insert(
            id: id,
            order: order,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            type: type,
            category: category,
            theme: theme,
            durationsInSeconds: durationsInSeconds,
            performers: performers,
            notes: notes,
            timeBufferInSeconds: timeBufferInSeconds,
            huddleTimerInSeconds: huddleTimerInSeconds,
            integrationEntityId: integrationEntityId,
            integrationAdditionalData: integrationAdditionalData,
            pacing: pacing,
            match: match,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ImprovisationEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {pacing = false,
              match = false,
              penaltyEntityRefs = false,
              pointEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (penaltyEntityRefs) db.penaltyEntity,
                if (pointEntityRefs) db.pointEntity
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pacing) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pacing,
                    referencedTable:
                        $$ImprovisationEntityTableReferences._pacingTable(db),
                    referencedColumn: $$ImprovisationEntityTableReferences
                        ._pacingTable(db)
                        .id,
                  ) as T;
                }
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$ImprovisationEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$ImprovisationEntityTableReferences._matchTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (penaltyEntityRefs)
                    await $_getPrefetchedData<ImprovisationEntityData,
                            $ImprovisationEntityTable, PenaltyEntityData>(
                        currentTable: table,
                        referencedTable: $$ImprovisationEntityTableReferences
                            ._penaltyEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ImprovisationEntityTableReferences(db, table, p0)
                                .penaltyEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.improvisation == item.id),
                        typedResults: items),
                  if (pointEntityRefs)
                    await $_getPrefetchedData<ImprovisationEntityData,
                            $ImprovisationEntityTable, PointEntityData>(
                        currentTable: table,
                        referencedTable: $$ImprovisationEntityTableReferences
                            ._pointEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ImprovisationEntityTableReferences(db, table, p0)
                                .pointEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.improvisation == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ImprovisationEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ImprovisationEntityTable,
    ImprovisationEntityData,
    $$ImprovisationEntityTableFilterComposer,
    $$ImprovisationEntityTableOrderingComposer,
    $$ImprovisationEntityTableAnnotationComposer,
    $$ImprovisationEntityTableCreateCompanionBuilder,
    $$ImprovisationEntityTableUpdateCompanionBuilder,
    (ImprovisationEntityData, $$ImprovisationEntityTableReferences),
    ImprovisationEntityData,
    PrefetchHooks Function(
        {bool pacing,
        bool match,
        bool penaltyEntityRefs,
        bool pointEntityRefs})>;
typedef $$PenaltyEntityTableCreateCompanionBuilder = PenaltyEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required bool major,
  required String type,
  required int match,
  required int team,
  required int improvisation,
  Value<int?> performer,
});
typedef $$PenaltyEntityTableUpdateCompanionBuilder = PenaltyEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<bool> major,
  Value<String> type,
  Value<int> match,
  Value<int> team,
  Value<int> improvisation,
  Value<int?> performer,
});

final class $$PenaltyEntityTableReferences extends BaseReferences<_$AppDatabase,
    $PenaltyEntityTable, PenaltyEntityData> {
  $$PenaltyEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias(
          $_aliasNameGenerator(db.penaltyEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager get match {
    final $_column = $_itemColumn<int>('match')!;

    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TeamEntityTable _teamTable(_$AppDatabase db) =>
      db.teamEntity.createAlias(
          $_aliasNameGenerator(db.penaltyEntity.team, db.teamEntity.id));

  $$TeamEntityTableProcessedTableManager get team {
    final $_column = $_itemColumn<int>('team')!;

    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ImprovisationEntityTable _improvisationTable(_$AppDatabase db) =>
      db.improvisationEntity.createAlias($_aliasNameGenerator(
          db.penaltyEntity.improvisation, db.improvisationEntity.id));

  $$ImprovisationEntityTableProcessedTableManager get improvisation {
    final $_column = $_itemColumn<int>('improvisation')!;

    final manager =
        $$ImprovisationEntityTableTableManager($_db, $_db.improvisationEntity)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_improvisationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PerformerEntityTable _performerTable(_$AppDatabase db) =>
      db.performerEntity.createAlias($_aliasNameGenerator(
          db.penaltyEntity.performer, db.performerEntity.id));

  $$PerformerEntityTableProcessedTableManager? get performer {
    final $_column = $_itemColumn<int>('performer');
    if ($_column == null) return null;
    final manager =
        $$PerformerEntityTableTableManager($_db, $_db.performerEntity)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_performerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PenaltyEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PenaltyEntityTable> {
  $$PenaltyEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get major => $composableBuilder(
      column: $table.major, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableFilterComposer get team {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableFilterComposer get improvisation {
    final $$ImprovisationEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.improvisation,
        referencedTable: $db.improvisationEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImprovisationEntityTableFilterComposer(
              $db: $db,
              $table: $db.improvisationEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PerformerEntityTableFilterComposer get performer {
    final $$PerformerEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableFilterComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PenaltyEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PenaltyEntityTable> {
  $$PenaltyEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get major => $composableBuilder(
      column: $table.major, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableOrderingComposer get team {
    final $$TeamEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableOrderingComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableOrderingComposer get improvisation {
    final $$ImprovisationEntityTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.improvisation,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableOrderingComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PerformerEntityTableOrderingComposer get performer {
    final $$PerformerEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableOrderingComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PenaltyEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PenaltyEntityTable> {
  $$PenaltyEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get major =>
      $composableBuilder(column: $table.major, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableAnnotationComposer get team {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableAnnotationComposer get improvisation {
    final $$ImprovisationEntityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.improvisation,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PerformerEntityTableAnnotationComposer get performer {
    final $$PerformerEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PenaltyEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PenaltyEntityTable,
    PenaltyEntityData,
    $$PenaltyEntityTableFilterComposer,
    $$PenaltyEntityTableOrderingComposer,
    $$PenaltyEntityTableAnnotationComposer,
    $$PenaltyEntityTableCreateCompanionBuilder,
    $$PenaltyEntityTableUpdateCompanionBuilder,
    (PenaltyEntityData, $$PenaltyEntityTableReferences),
    PenaltyEntityData,
    PrefetchHooks Function(
        {bool match, bool team, bool improvisation, bool performer})> {
  $$PenaltyEntityTableTableManager(_$AppDatabase db, $PenaltyEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PenaltyEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PenaltyEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PenaltyEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<bool> major = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> match = const Value.absent(),
            Value<int> team = const Value.absent(),
            Value<int> improvisation = const Value.absent(),
            Value<int?> performer = const Value.absent(),
          }) =>
              PenaltyEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            major: major,
            type: type,
            match: match,
            team: team,
            improvisation: improvisation,
            performer: performer,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required bool major,
            required String type,
            required int match,
            required int team,
            required int improvisation,
            Value<int?> performer = const Value.absent(),
          }) =>
              PenaltyEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            major: major,
            type: type,
            match: match,
            team: team,
            improvisation: improvisation,
            performer: performer,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PenaltyEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {match = false,
              team = false,
              improvisation = false,
              performer = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$PenaltyEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$PenaltyEntityTableReferences._matchTable(db).id,
                  ) as T;
                }
                if (team) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.team,
                    referencedTable:
                        $$PenaltyEntityTableReferences._teamTable(db),
                    referencedColumn:
                        $$PenaltyEntityTableReferences._teamTable(db).id,
                  ) as T;
                }
                if (improvisation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.improvisation,
                    referencedTable:
                        $$PenaltyEntityTableReferences._improvisationTable(db),
                    referencedColumn: $$PenaltyEntityTableReferences
                        ._improvisationTable(db)
                        .id,
                  ) as T;
                }
                if (performer) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.performer,
                    referencedTable:
                        $$PenaltyEntityTableReferences._performerTable(db),
                    referencedColumn:
                        $$PenaltyEntityTableReferences._performerTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PenaltyEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PenaltyEntityTable,
    PenaltyEntityData,
    $$PenaltyEntityTableFilterComposer,
    $$PenaltyEntityTableOrderingComposer,
    $$PenaltyEntityTableAnnotationComposer,
    $$PenaltyEntityTableCreateCompanionBuilder,
    $$PenaltyEntityTableUpdateCompanionBuilder,
    (PenaltyEntityData, $$PenaltyEntityTableReferences),
    PenaltyEntityData,
    PrefetchHooks Function(
        {bool match, bool team, bool improvisation, bool performer})>;
typedef $$PointEntityTableCreateCompanionBuilder = PointEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int value,
  required int match,
  required int team,
  required int improvisation,
});
typedef $$PointEntityTableUpdateCompanionBuilder = PointEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> value,
  Value<int> match,
  Value<int> team,
  Value<int> improvisation,
});

final class $$PointEntityTableReferences
    extends BaseReferences<_$AppDatabase, $PointEntityTable, PointEntityData> {
  $$PointEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias(
          $_aliasNameGenerator(db.pointEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager get match {
    final $_column = $_itemColumn<int>('match')!;

    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TeamEntityTable _teamTable(_$AppDatabase db) => db.teamEntity
      .createAlias($_aliasNameGenerator(db.pointEntity.team, db.teamEntity.id));

  $$TeamEntityTableProcessedTableManager get team {
    final $_column = $_itemColumn<int>('team')!;

    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ImprovisationEntityTable _improvisationTable(_$AppDatabase db) =>
      db.improvisationEntity.createAlias($_aliasNameGenerator(
          db.pointEntity.improvisation, db.improvisationEntity.id));

  $$ImprovisationEntityTableProcessedTableManager get improvisation {
    final $_column = $_itemColumn<int>('improvisation')!;

    final manager =
        $$ImprovisationEntityTableTableManager($_db, $_db.improvisationEntity)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_improvisationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PointEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PointEntityTable> {
  $$PointEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableFilterComposer get team {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableFilterComposer get improvisation {
    final $$ImprovisationEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.improvisation,
        referencedTable: $db.improvisationEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImprovisationEntityTableFilterComposer(
              $db: $db,
              $table: $db.improvisationEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PointEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PointEntityTable> {
  $$PointEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableOrderingComposer get team {
    final $$TeamEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableOrderingComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableOrderingComposer get improvisation {
    final $$ImprovisationEntityTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.improvisation,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableOrderingComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PointEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointEntityTable> {
  $$PointEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableAnnotationComposer get team {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ImprovisationEntityTableAnnotationComposer get improvisation {
    final $$ImprovisationEntityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.improvisation,
            referencedTable: $db.improvisationEntity,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ImprovisationEntityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.improvisationEntity,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PointEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PointEntityTable,
    PointEntityData,
    $$PointEntityTableFilterComposer,
    $$PointEntityTableOrderingComposer,
    $$PointEntityTableAnnotationComposer,
    $$PointEntityTableCreateCompanionBuilder,
    $$PointEntityTableUpdateCompanionBuilder,
    (PointEntityData, $$PointEntityTableReferences),
    PointEntityData,
    PrefetchHooks Function({bool match, bool team, bool improvisation})> {
  $$PointEntityTableTableManager(_$AppDatabase db, $PointEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> value = const Value.absent(),
            Value<int> match = const Value.absent(),
            Value<int> team = const Value.absent(),
            Value<int> improvisation = const Value.absent(),
          }) =>
              PointEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            value: value,
            match: match,
            team: team,
            improvisation: improvisation,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int value,
            required int match,
            required int team,
            required int improvisation,
          }) =>
              PointEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            value: value,
            match: match,
            team: team,
            improvisation: improvisation,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PointEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {match = false, team = false, improvisation = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$PointEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$PointEntityTableReferences._matchTable(db).id,
                  ) as T;
                }
                if (team) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.team,
                    referencedTable:
                        $$PointEntityTableReferences._teamTable(db),
                    referencedColumn:
                        $$PointEntityTableReferences._teamTable(db).id,
                  ) as T;
                }
                if (improvisation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.improvisation,
                    referencedTable:
                        $$PointEntityTableReferences._improvisationTable(db),
                    referencedColumn:
                        $$PointEntityTableReferences._improvisationTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PointEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PointEntityTable,
    PointEntityData,
    $$PointEntityTableFilterComposer,
    $$PointEntityTableOrderingComposer,
    $$PointEntityTableAnnotationComposer,
    $$PointEntityTableCreateCompanionBuilder,
    $$PointEntityTableUpdateCompanionBuilder,
    (PointEntityData, $$PointEntityTableReferences),
    PointEntityData,
    PrefetchHooks Function({bool match, bool team, bool improvisation})>;
typedef $$StarEntityTableCreateCompanionBuilder = StarEntityCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int match,
  required int performer,
  required int team,
});
typedef $$StarEntityTableUpdateCompanionBuilder = StarEntityCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> match,
  Value<int> performer,
  Value<int> team,
});

final class $$StarEntityTableReferences
    extends BaseReferences<_$AppDatabase, $StarEntityTable, StarEntityData> {
  $$StarEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias(
          $_aliasNameGenerator(db.starEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager get match {
    final $_column = $_itemColumn<int>('match')!;

    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PerformerEntityTable _performerTable(_$AppDatabase db) =>
      db.performerEntity.createAlias(
          $_aliasNameGenerator(db.starEntity.performer, db.performerEntity.id));

  $$PerformerEntityTableProcessedTableManager get performer {
    final $_column = $_itemColumn<int>('performer')!;

    final manager =
        $$PerformerEntityTableTableManager($_db, $_db.performerEntity)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_performerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TeamEntityTable _teamTable(_$AppDatabase db) => db.teamEntity
      .createAlias($_aliasNameGenerator(db.starEntity.team, db.teamEntity.id));

  $$TeamEntityTableProcessedTableManager get team {
    final $_column = $_itemColumn<int>('team')!;

    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StarEntityTableFilterComposer
    extends Composer<_$AppDatabase, $StarEntityTable> {
  $$StarEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PerformerEntityTableFilterComposer get performer {
    final $$PerformerEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableFilterComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableFilterComposer get team {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StarEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $StarEntityTable> {
  $$StarEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PerformerEntityTableOrderingComposer get performer {
    final $$PerformerEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableOrderingComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableOrderingComposer get team {
    final $$TeamEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableOrderingComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StarEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $StarEntityTable> {
  $$StarEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PerformerEntityTableAnnotationComposer get performer {
    final $$PerformerEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.performer,
        referencedTable: $db.performerEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PerformerEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.performerEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableAnnotationComposer get team {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StarEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StarEntityTable,
    StarEntityData,
    $$StarEntityTableFilterComposer,
    $$StarEntityTableOrderingComposer,
    $$StarEntityTableAnnotationComposer,
    $$StarEntityTableCreateCompanionBuilder,
    $$StarEntityTableUpdateCompanionBuilder,
    (StarEntityData, $$StarEntityTableReferences),
    StarEntityData,
    PrefetchHooks Function({bool match, bool performer, bool team})> {
  $$StarEntityTableTableManager(_$AppDatabase db, $StarEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StarEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StarEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StarEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> match = const Value.absent(),
            Value<int> performer = const Value.absent(),
            Value<int> team = const Value.absent(),
          }) =>
              StarEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            match: match,
            performer: performer,
            team: team,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int match,
            required int performer,
            required int team,
          }) =>
              StarEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            match: match,
            performer: performer,
            team: team,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StarEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {match = false, performer = false, team = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$StarEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$StarEntityTableReferences._matchTable(db).id,
                  ) as T;
                }
                if (performer) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.performer,
                    referencedTable:
                        $$StarEntityTableReferences._performerTable(db),
                    referencedColumn:
                        $$StarEntityTableReferences._performerTable(db).id,
                  ) as T;
                }
                if (team) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.team,
                    referencedTable: $$StarEntityTableReferences._teamTable(db),
                    referencedColumn:
                        $$StarEntityTableReferences._teamTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StarEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StarEntityTable,
    StarEntityData,
    $$StarEntityTableFilterComposer,
    $$StarEntityTableOrderingComposer,
    $$StarEntityTableAnnotationComposer,
    $$StarEntityTableCreateCompanionBuilder,
    $$StarEntityTableUpdateCompanionBuilder,
    (StarEntityData, $$StarEntityTableReferences),
    StarEntityData,
    PrefetchHooks Function({bool match, bool performer, bool team})>;
typedef $$TagEntityTableCreateCompanionBuilder = TagEntityCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
});
typedef $$TagEntityTableUpdateCompanionBuilder = TagEntityCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
});

final class $$TagEntityTableReferences
    extends BaseReferences<_$AppDatabase, $TagEntityTable, TagEntityData> {
  $$TagEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PacingTagEntityTable, List<PacingTagEntityData>>
      _pacingTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pacingTagEntity,
              aliasName: $_aliasNameGenerator(
                  db.tagEntity.id, db.pacingTagEntity.tag));

  $$PacingTagEntityTableProcessedTableManager get pacingTagEntityRefs {
    final manager =
        $$PacingTagEntityTableTableManager($_db, $_db.pacingTagEntity)
            .filter((f) => f.tag.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_pacingTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MatchTagEntityTable, List<MatchTagEntityData>>
      _matchTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.matchTagEntity,
              aliasName:
                  $_aliasNameGenerator(db.tagEntity.id, db.matchTagEntity.tag));

  $$MatchTagEntityTableProcessedTableManager get matchTagEntityRefs {
    final manager = $$MatchTagEntityTableTableManager($_db, $_db.matchTagEntity)
        .filter((f) => f.tag.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_matchTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TeamTagEntityTable, List<TeamTagEntityData>>
      _teamTagEntityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.teamTagEntity,
              aliasName:
                  $_aliasNameGenerator(db.tagEntity.id, db.teamTagEntity.tag));

  $$TeamTagEntityTableProcessedTableManager get teamTagEntityRefs {
    final manager = $$TeamTagEntityTableTableManager($_db, $_db.teamTagEntity)
        .filter((f) => f.tag.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teamTagEntityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagEntityTableFilterComposer
    extends Composer<_$AppDatabase, $TagEntityTable> {
  $$TagEntityTableFilterComposer({
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

  Expression<bool> pacingTagEntityRefs(
      Expression<bool> Function($$PacingTagEntityTableFilterComposer f) f) {
    final $$PacingTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pacingTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.pacingTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> matchTagEntityRefs(
      Expression<bool> Function($$MatchTagEntityTableFilterComposer f) f) {
    final $$MatchTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.matchTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> teamTagEntityRefs(
      Expression<bool> Function($$TeamTagEntityTableFilterComposer f) f) {
    final $$TeamTagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamTagEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $TagEntityTable> {
  $$TagEntityTableOrderingComposer({
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
}

class $$TagEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagEntityTable> {
  $$TagEntityTableAnnotationComposer({
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

  Expression<T> pacingTagEntityRefs<T extends Object>(
      Expression<T> Function($$PacingTagEntityTableAnnotationComposer a) f) {
    final $$PacingTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pacingTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pacingTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> matchTagEntityRefs<T extends Object>(
      Expression<T> Function($$MatchTagEntityTableAnnotationComposer a) f) {
    final $$MatchTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.matchTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> teamTagEntityRefs<T extends Object>(
      Expression<T> Function($$TeamTagEntityTableAnnotationComposer a) f) {
    final $$TeamTagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.teamTagEntity,
        getReferencedColumn: (t) => t.tag,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamTagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamTagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagEntityTable,
    TagEntityData,
    $$TagEntityTableFilterComposer,
    $$TagEntityTableOrderingComposer,
    $$TagEntityTableAnnotationComposer,
    $$TagEntityTableCreateCompanionBuilder,
    $$TagEntityTableUpdateCompanionBuilder,
    (TagEntityData, $$TagEntityTableReferences),
    TagEntityData,
    PrefetchHooks Function(
        {bool pacingTagEntityRefs,
        bool matchTagEntityRefs,
        bool teamTagEntityRefs})> {
  $$TagEntityTableTableManager(_$AppDatabase db, $TagEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
          }) =>
              TagEntityCompanion(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
          }) =>
              TagEntityCompanion.insert(
            id: id,
            name: name,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TagEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {pacingTagEntityRefs = false,
              matchTagEntityRefs = false,
              teamTagEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pacingTagEntityRefs) db.pacingTagEntity,
                if (matchTagEntityRefs) db.matchTagEntity,
                if (teamTagEntityRefs) db.teamTagEntity
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pacingTagEntityRefs)
                    await $_getPrefetchedData<TagEntityData, $TagEntityTable,
                            PacingTagEntityData>(
                        currentTable: table,
                        referencedTable: $$TagEntityTableReferences
                            ._pacingTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagEntityTableReferences(db, table, p0)
                                .pacingTagEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.tag == item.id),
                        typedResults: items),
                  if (matchTagEntityRefs)
                    await $_getPrefetchedData<TagEntityData, $TagEntityTable,
                            MatchTagEntityData>(
                        currentTable: table,
                        referencedTable: $$TagEntityTableReferences
                            ._matchTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagEntityTableReferences(db, table, p0)
                                .matchTagEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.tag == item.id),
                        typedResults: items),
                  if (teamTagEntityRefs)
                    await $_getPrefetchedData<TagEntityData, $TagEntityTable,
                            TeamTagEntityData>(
                        currentTable: table,
                        referencedTable: $$TagEntityTableReferences
                            ._teamTagEntityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagEntityTableReferences(db, table, p0)
                                .teamTagEntityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.tag == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagEntityTable,
    TagEntityData,
    $$TagEntityTableFilterComposer,
    $$TagEntityTableOrderingComposer,
    $$TagEntityTableAnnotationComposer,
    $$TagEntityTableCreateCompanionBuilder,
    $$TagEntityTableUpdateCompanionBuilder,
    (TagEntityData, $$TagEntityTableReferences),
    TagEntityData,
    PrefetchHooks Function(
        {bool pacingTagEntityRefs,
        bool matchTagEntityRefs,
        bool teamTagEntityRefs})>;
typedef $$PacingTagEntityTableCreateCompanionBuilder = PacingTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int tag,
  required int pacing,
});
typedef $$PacingTagEntityTableUpdateCompanionBuilder = PacingTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> tag,
  Value<int> pacing,
});

final class $$PacingTagEntityTableReferences extends BaseReferences<
    _$AppDatabase, $PacingTagEntityTable, PacingTagEntityData> {
  $$PacingTagEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TagEntityTable _tagTable(_$AppDatabase db) =>
      db.tagEntity.createAlias(
          $_aliasNameGenerator(db.pacingTagEntity.tag, db.tagEntity.id));

  $$TagEntityTableProcessedTableManager get tag {
    final $_column = $_itemColumn<int>('tag')!;

    final manager = $$TagEntityTableTableManager($_db, $_db.tagEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PacingEntityTable _pacingTable(_$AppDatabase db) =>
      db.pacingEntity.createAlias(
          $_aliasNameGenerator(db.pacingTagEntity.pacing, db.pacingEntity.id));

  $$PacingEntityTableProcessedTableManager get pacing {
    final $_column = $_itemColumn<int>('pacing')!;

    final manager = $$PacingEntityTableTableManager($_db, $_db.pacingEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacingTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PacingTagEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PacingTagEntityTable> {
  $$PacingTagEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  $$TagEntityTableFilterComposer get tag {
    final $$TagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableFilterComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PacingEntityTableFilterComposer get pacing {
    final $$PacingEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableFilterComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PacingTagEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PacingTagEntityTable> {
  $$PacingTagEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  $$TagEntityTableOrderingComposer get tag {
    final $$TagEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableOrderingComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PacingEntityTableOrderingComposer get pacing {
    final $$PacingEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableOrderingComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PacingTagEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PacingTagEntityTable> {
  $$PacingTagEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  $$TagEntityTableAnnotationComposer get tag {
    final $$TagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PacingEntityTableAnnotationComposer get pacing {
    final $$PacingEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pacing,
        referencedTable: $db.pacingEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PacingEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.pacingEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PacingTagEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PacingTagEntityTable,
    PacingTagEntityData,
    $$PacingTagEntityTableFilterComposer,
    $$PacingTagEntityTableOrderingComposer,
    $$PacingTagEntityTableAnnotationComposer,
    $$PacingTagEntityTableCreateCompanionBuilder,
    $$PacingTagEntityTableUpdateCompanionBuilder,
    (PacingTagEntityData, $$PacingTagEntityTableReferences),
    PacingTagEntityData,
    PrefetchHooks Function({bool tag, bool pacing})> {
  $$PacingTagEntityTableTableManager(
      _$AppDatabase db, $PacingTagEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PacingTagEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PacingTagEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PacingTagEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> tag = const Value.absent(),
            Value<int> pacing = const Value.absent(),
          }) =>
              PacingTagEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            pacing: pacing,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int tag,
            required int pacing,
          }) =>
              PacingTagEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            pacing: pacing,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PacingTagEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tag = false, pacing = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tag) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tag,
                    referencedTable:
                        $$PacingTagEntityTableReferences._tagTable(db),
                    referencedColumn:
                        $$PacingTagEntityTableReferences._tagTable(db).id,
                  ) as T;
                }
                if (pacing) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pacing,
                    referencedTable:
                        $$PacingTagEntityTableReferences._pacingTable(db),
                    referencedColumn:
                        $$PacingTagEntityTableReferences._pacingTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PacingTagEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PacingTagEntityTable,
    PacingTagEntityData,
    $$PacingTagEntityTableFilterComposer,
    $$PacingTagEntityTableOrderingComposer,
    $$PacingTagEntityTableAnnotationComposer,
    $$PacingTagEntityTableCreateCompanionBuilder,
    $$PacingTagEntityTableUpdateCompanionBuilder,
    (PacingTagEntityData, $$PacingTagEntityTableReferences),
    PacingTagEntityData,
    PrefetchHooks Function({bool tag, bool pacing})>;
typedef $$MatchTagEntityTableCreateCompanionBuilder = MatchTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int tag,
  required int match,
});
typedef $$MatchTagEntityTableUpdateCompanionBuilder = MatchTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> tag,
  Value<int> match,
});

final class $$MatchTagEntityTableReferences extends BaseReferences<
    _$AppDatabase, $MatchTagEntityTable, MatchTagEntityData> {
  $$MatchTagEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TagEntityTable _tagTable(_$AppDatabase db) =>
      db.tagEntity.createAlias(
          $_aliasNameGenerator(db.matchTagEntity.tag, db.tagEntity.id));

  $$TagEntityTableProcessedTableManager get tag {
    final $_column = $_itemColumn<int>('tag')!;

    final manager = $$TagEntityTableTableManager($_db, $_db.tagEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MatchEntityTable _matchTable(_$AppDatabase db) =>
      db.matchEntity.createAlias(
          $_aliasNameGenerator(db.matchTagEntity.match, db.matchEntity.id));

  $$MatchEntityTableProcessedTableManager get match {
    final $_column = $_itemColumn<int>('match')!;

    final manager = $$MatchEntityTableTableManager($_db, $_db.matchEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MatchTagEntityTableFilterComposer
    extends Composer<_$AppDatabase, $MatchTagEntityTable> {
  $$MatchTagEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  $$TagEntityTableFilterComposer get tag {
    final $$TagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableFilterComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableFilterComposer get match {
    final $$MatchEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableFilterComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MatchTagEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $MatchTagEntityTable> {
  $$MatchTagEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  $$TagEntityTableOrderingComposer get tag {
    final $$TagEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableOrderingComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableOrderingComposer get match {
    final $$MatchEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableOrderingComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MatchTagEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $MatchTagEntityTable> {
  $$MatchTagEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  $$TagEntityTableAnnotationComposer get tag {
    final $$TagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MatchEntityTableAnnotationComposer get match {
    final $$MatchEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.match,
        referencedTable: $db.matchEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MatchEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.matchEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MatchTagEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MatchTagEntityTable,
    MatchTagEntityData,
    $$MatchTagEntityTableFilterComposer,
    $$MatchTagEntityTableOrderingComposer,
    $$MatchTagEntityTableAnnotationComposer,
    $$MatchTagEntityTableCreateCompanionBuilder,
    $$MatchTagEntityTableUpdateCompanionBuilder,
    (MatchTagEntityData, $$MatchTagEntityTableReferences),
    MatchTagEntityData,
    PrefetchHooks Function({bool tag, bool match})> {
  $$MatchTagEntityTableTableManager(
      _$AppDatabase db, $MatchTagEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatchTagEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatchTagEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatchTagEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> tag = const Value.absent(),
            Value<int> match = const Value.absent(),
          }) =>
              MatchTagEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            match: match,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int tag,
            required int match,
          }) =>
              MatchTagEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            match: match,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MatchTagEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tag = false, match = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tag) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tag,
                    referencedTable:
                        $$MatchTagEntityTableReferences._tagTable(db),
                    referencedColumn:
                        $$MatchTagEntityTableReferences._tagTable(db).id,
                  ) as T;
                }
                if (match) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.match,
                    referencedTable:
                        $$MatchTagEntityTableReferences._matchTable(db),
                    referencedColumn:
                        $$MatchTagEntityTableReferences._matchTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MatchTagEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MatchTagEntityTable,
    MatchTagEntityData,
    $$MatchTagEntityTableFilterComposer,
    $$MatchTagEntityTableOrderingComposer,
    $$MatchTagEntityTableAnnotationComposer,
    $$MatchTagEntityTableCreateCompanionBuilder,
    $$MatchTagEntityTableUpdateCompanionBuilder,
    (MatchTagEntityData, $$MatchTagEntityTableReferences),
    MatchTagEntityData,
    PrefetchHooks Function({bool tag, bool match})>;
typedef $$TeamTagEntityTableCreateCompanionBuilder = TeamTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  required int tag,
  required int team,
});
typedef $$TeamTagEntityTableUpdateCompanionBuilder = TeamTagEntityCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<DateTime> modifiedDate,
  Value<int> tag,
  Value<int> team,
});

final class $$TeamTagEntityTableReferences extends BaseReferences<_$AppDatabase,
    $TeamTagEntityTable, TeamTagEntityData> {
  $$TeamTagEntityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TagEntityTable _tagTable(_$AppDatabase db) => db.tagEntity
      .createAlias($_aliasNameGenerator(db.teamTagEntity.tag, db.tagEntity.id));

  $$TagEntityTableProcessedTableManager get tag {
    final $_column = $_itemColumn<int>('tag')!;

    final manager = $$TagEntityTableTableManager($_db, $_db.tagEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TeamEntityTable _teamTable(_$AppDatabase db) =>
      db.teamEntity.createAlias(
          $_aliasNameGenerator(db.teamTagEntity.team, db.teamEntity.id));

  $$TeamEntityTableProcessedTableManager get team {
    final $_column = $_itemColumn<int>('team')!;

    final manager = $$TeamEntityTableTableManager($_db, $_db.teamEntity)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TeamTagEntityTableFilterComposer
    extends Composer<_$AppDatabase, $TeamTagEntityTable> {
  $$TeamTagEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  $$TagEntityTableFilterComposer get tag {
    final $$TagEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableFilterComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableFilterComposer get team {
    final $$TeamEntityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableFilterComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TeamTagEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $TeamTagEntityTable> {
  $$TeamTagEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  $$TagEntityTableOrderingComposer get tag {
    final $$TagEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableOrderingComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableOrderingComposer get team {
    final $$TeamEntityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableOrderingComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TeamTagEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeamTagEntityTable> {
  $$TeamTagEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  $$TagEntityTableAnnotationComposer get tag {
    final $$TagEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $db.tagEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.tagEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TeamEntityTableAnnotationComposer get team {
    final $$TeamEntityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.team,
        referencedTable: $db.teamEntity,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TeamEntityTableAnnotationComposer(
              $db: $db,
              $table: $db.teamEntity,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TeamTagEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TeamTagEntityTable,
    TeamTagEntityData,
    $$TeamTagEntityTableFilterComposer,
    $$TeamTagEntityTableOrderingComposer,
    $$TeamTagEntityTableAnnotationComposer,
    $$TeamTagEntityTableCreateCompanionBuilder,
    $$TeamTagEntityTableUpdateCompanionBuilder,
    (TeamTagEntityData, $$TeamTagEntityTableReferences),
    TeamTagEntityData,
    PrefetchHooks Function({bool tag, bool team})> {
  $$TeamTagEntityTableTableManager(_$AppDatabase db, $TeamTagEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamTagEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamTagEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamTagEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            Value<int> tag = const Value.absent(),
            Value<int> team = const Value.absent(),
          }) =>
              TeamTagEntityCompanion(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            team: team,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> modifiedDate = const Value.absent(),
            required int tag,
            required int team,
          }) =>
              TeamTagEntityCompanion.insert(
            id: id,
            createdDate: createdDate,
            modifiedDate: modifiedDate,
            tag: tag,
            team: team,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TeamTagEntityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tag = false, team = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tag) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tag,
                    referencedTable:
                        $$TeamTagEntityTableReferences._tagTable(db),
                    referencedColumn:
                        $$TeamTagEntityTableReferences._tagTable(db).id,
                  ) as T;
                }
                if (team) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.team,
                    referencedTable:
                        $$TeamTagEntityTableReferences._teamTable(db),
                    referencedColumn:
                        $$TeamTagEntityTableReferences._teamTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TeamTagEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TeamTagEntityTable,
    TeamTagEntityData,
    $$TeamTagEntityTableFilterComposer,
    $$TeamTagEntityTableOrderingComposer,
    $$TeamTagEntityTableAnnotationComposer,
    $$TeamTagEntityTableCreateCompanionBuilder,
    $$TeamTagEntityTableUpdateCompanionBuilder,
    (TeamTagEntityData, $$TeamTagEntityTableReferences),
    TeamTagEntityData,
    PrefetchHooks Function({bool tag, bool team})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PacingEntityTableTableManager get pacingEntity =>
      $$PacingEntityTableTableManager(_db, _db.pacingEntity);
  $$MatchEntityTableTableManager get matchEntity =>
      $$MatchEntityTableTableManager(_db, _db.matchEntity);
  $$TeamEntityTableTableManager get teamEntity =>
      $$TeamEntityTableTableManager(_db, _db.teamEntity);
  $$PerformerEntityTableTableManager get performerEntity =>
      $$PerformerEntityTableTableManager(_db, _db.performerEntity);
  $$ImprovisationEntityTableTableManager get improvisationEntity =>
      $$ImprovisationEntityTableTableManager(_db, _db.improvisationEntity);
  $$PenaltyEntityTableTableManager get penaltyEntity =>
      $$PenaltyEntityTableTableManager(_db, _db.penaltyEntity);
  $$PointEntityTableTableManager get pointEntity =>
      $$PointEntityTableTableManager(_db, _db.pointEntity);
  $$StarEntityTableTableManager get starEntity =>
      $$StarEntityTableTableManager(_db, _db.starEntity);
  $$TagEntityTableTableManager get tagEntity =>
      $$TagEntityTableTableManager(_db, _db.tagEntity);
  $$PacingTagEntityTableTableManager get pacingTagEntity =>
      $$PacingTagEntityTableTableManager(_db, _db.pacingTagEntity);
  $$MatchTagEntityTableTableManager get matchTagEntity =>
      $$MatchTagEntityTableTableManager(_db, _db.matchTagEntity);
  $$TeamTagEntityTableTableManager get teamTagEntity =>
      $$TeamTagEntityTableTableManager(_db, _db.teamTagEntity);
}
