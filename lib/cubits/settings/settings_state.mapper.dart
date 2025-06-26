// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_state.dart';

class SettingsStateMapper extends ClassMapperBase<SettingsState> {
  SettingsStateMapper._();

  static SettingsStateMapper? _instance;
  static SettingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsStateMapper._());
      ThemeTypeMapper.ensureInitialized();
      PenaltiesImpactTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsState';

  static String _$language(SettingsState v) => v.language;
  static const Field<SettingsState, String> _f$language =
      Field('language', _$language);
  static ThemeType _$theme(SettingsState v) => v.theme;
  static const Field<SettingsState, ThemeType> _f$theme =
      Field('theme', _$theme);
  static bool _$enableWakelock(SettingsState v) => v.enableWakelock;
  static const Field<SettingsState, bool> _f$enableWakelock =
      Field('enableWakelock', _$enableWakelock, opt: true, def: true);
  static bool _$enableHapticFeedback(SettingsState v) => v.enableHapticFeedback;
  static const Field<SettingsState, bool> _f$enableHapticFeedback = Field(
      'enableHapticFeedback', _$enableHapticFeedback,
      opt: true, def: true);
  static bool _$enableTimerHapticFeedback(SettingsState v) =>
      v.enableTimerHapticFeedback;
  static const Field<SettingsState, bool> _f$enableTimerHapticFeedback = Field(
      'enableTimerHapticFeedback', _$enableTimerHapticFeedback,
      opt: true, def: true);
  static int _$defaultNumberOfTeams(SettingsState v) => v.defaultNumberOfTeams;
  static const Field<SettingsState, int> _f$defaultNumberOfTeams =
      Field('defaultNumberOfTeams', _$defaultNumberOfTeams, opt: true, def: 2);
  static int _$defaultImprovisationDurationInSeconds(SettingsState v) =>
      v.defaultImprovisationDurationInSeconds;
  static const Field<SettingsState, int>
      _f$defaultImprovisationDurationInSeconds = Field(
          'defaultImprovisationDurationInSeconds',
          _$defaultImprovisationDurationInSeconds,
          opt: true,
          def: 150);
  static int _$defaultTimeBufferInSeconds(SettingsState v) =>
      v.defaultTimeBufferInSeconds;
  static const Field<SettingsState, int> _f$defaultTimeBufferInSeconds = Field(
      'defaultTimeBufferInSeconds', _$defaultTimeBufferInSeconds,
      opt: true, def: 30);
  static int _$defaultHuddleTimerInSeconds(SettingsState v) =>
      v.defaultHuddleTimerInSeconds;
  static const Field<SettingsState, int> _f$defaultHuddleTimerInSeconds = Field(
      'defaultHuddleTimerInSeconds', _$defaultHuddleTimerInSeconds,
      opt: true, def: 30);
  static bool _$defaultEnableStatistics(SettingsState v) =>
      v.defaultEnableStatistics;
  static const Field<SettingsState, bool> _f$defaultEnableStatistics = Field(
      'defaultEnableStatistics', _$defaultEnableStatistics,
      opt: true, def: false);
  static bool _$enableDefaultPenaltiesImpactPoints(SettingsState v) =>
      v.enableDefaultPenaltiesImpactPoints;
  static const Field<SettingsState, bool>
      _f$enableDefaultPenaltiesImpactPoints = Field(
          'enableDefaultPenaltiesImpactPoints',
          _$enableDefaultPenaltiesImpactPoints,
          opt: true,
          def: true);
  static PenaltiesImpactType _$defaultPenaltiesImpactType(SettingsState v) =>
      v.defaultPenaltiesImpactType;
  static const Field<SettingsState, PenaltiesImpactType>
      _f$defaultPenaltiesImpactType = Field(
          'defaultPenaltiesImpactType', _$defaultPenaltiesImpactType,
          opt: true, def: PenaltiesImpactType.addPoints);
  static int _$defaultPenaltiesRequiredToImpactPoints(SettingsState v) =>
      v.defaultPenaltiesRequiredToImpactPoints;
  static const Field<SettingsState, int>
      _f$defaultPenaltiesRequiredToImpactPoints = Field(
          'defaultPenaltiesRequiredToImpactPoints',
          _$defaultPenaltiesRequiredToImpactPoints,
          opt: true,
          def: 3);
  static bool _$enableDefaultMatchExpulsion(SettingsState v) =>
      v.enableDefaultMatchExpulsion;
  static const Field<SettingsState, bool> _f$enableDefaultMatchExpulsion =
      Field('enableDefaultMatchExpulsion', _$enableDefaultMatchExpulsion,
          opt: true, def: true);
  static int _$defaultPenaltiesRequiredToExpel(SettingsState v) =>
      v.defaultPenaltiesRequiredToExpel;
  static const Field<SettingsState, int> _f$defaultPenaltiesRequiredToExpel =
      Field(
          'defaultPenaltiesRequiredToExpel', _$defaultPenaltiesRequiredToExpel,
          opt: true, def: 3);

  @override
  final MappableFields<SettingsState> fields = const {
    #language: _f$language,
    #theme: _f$theme,
    #enableWakelock: _f$enableWakelock,
    #enableHapticFeedback: _f$enableHapticFeedback,
    #enableTimerHapticFeedback: _f$enableTimerHapticFeedback,
    #defaultNumberOfTeams: _f$defaultNumberOfTeams,
    #defaultImprovisationDurationInSeconds:
        _f$defaultImprovisationDurationInSeconds,
    #defaultTimeBufferInSeconds: _f$defaultTimeBufferInSeconds,
    #defaultHuddleTimerInSeconds: _f$defaultHuddleTimerInSeconds,
    #defaultEnableStatistics: _f$defaultEnableStatistics,
    #enableDefaultPenaltiesImpactPoints: _f$enableDefaultPenaltiesImpactPoints,
    #defaultPenaltiesImpactType: _f$defaultPenaltiesImpactType,
    #defaultPenaltiesRequiredToImpactPoints:
        _f$defaultPenaltiesRequiredToImpactPoints,
    #enableDefaultMatchExpulsion: _f$enableDefaultMatchExpulsion,
    #defaultPenaltiesRequiredToExpel: _f$defaultPenaltiesRequiredToExpel,
  };

  static SettingsState _instantiate(DecodingData data) {
    return SettingsState(
        language: data.dec(_f$language),
        theme: data.dec(_f$theme),
        enableWakelock: data.dec(_f$enableWakelock),
        enableHapticFeedback: data.dec(_f$enableHapticFeedback),
        enableTimerHapticFeedback: data.dec(_f$enableTimerHapticFeedback),
        defaultNumberOfTeams: data.dec(_f$defaultNumberOfTeams),
        defaultImprovisationDurationInSeconds:
            data.dec(_f$defaultImprovisationDurationInSeconds),
        defaultTimeBufferInSeconds: data.dec(_f$defaultTimeBufferInSeconds),
        defaultHuddleTimerInSeconds: data.dec(_f$defaultHuddleTimerInSeconds),
        defaultEnableStatistics: data.dec(_f$defaultEnableStatistics),
        enableDefaultPenaltiesImpactPoints:
            data.dec(_f$enableDefaultPenaltiesImpactPoints),
        defaultPenaltiesImpactType: data.dec(_f$defaultPenaltiesImpactType),
        defaultPenaltiesRequiredToImpactPoints:
            data.dec(_f$defaultPenaltiesRequiredToImpactPoints),
        enableDefaultMatchExpulsion: data.dec(_f$enableDefaultMatchExpulsion),
        defaultPenaltiesRequiredToExpel:
            data.dec(_f$defaultPenaltiesRequiredToExpel));
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsState>(map);
  }

  static SettingsState fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsState>(json);
  }
}

mixin SettingsStateMappable {
  String toJson() {
    return SettingsStateMapper.ensureInitialized()
        .encodeJson<SettingsState>(this as SettingsState);
  }

  Map<String, dynamic> toMap() {
    return SettingsStateMapper.ensureInitialized()
        .encodeMap<SettingsState>(this as SettingsState);
  }

  SettingsStateCopyWith<SettingsState, SettingsState, SettingsState>
      get copyWith => _SettingsStateCopyWithImpl(
          this as SettingsState, $identity, $identity);
  @override
  String toString() {
    return SettingsStateMapper.ensureInitialized()
        .stringifyValue(this as SettingsState);
  }

  @override
  bool operator ==(Object other) {
    return SettingsStateMapper.ensureInitialized()
        .equalsValue(this as SettingsState, other);
  }

  @override
  int get hashCode {
    return SettingsStateMapper.ensureInitialized()
        .hashValue(this as SettingsState);
  }
}

extension SettingsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsState, $Out> {
  SettingsStateCopyWith<$R, SettingsState, $Out> get $asSettingsState =>
      $base.as((v, t, t2) => _SettingsStateCopyWithImpl(v, t, t2));
}

abstract class SettingsStateCopyWith<$R, $In extends SettingsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? language,
      ThemeType? theme,
      bool? enableWakelock,
      bool? enableHapticFeedback,
      bool? enableTimerHapticFeedback,
      int? defaultNumberOfTeams,
      int? defaultImprovisationDurationInSeconds,
      int? defaultTimeBufferInSeconds,
      int? defaultHuddleTimerInSeconds,
      bool? defaultEnableStatistics,
      bool? enableDefaultPenaltiesImpactPoints,
      PenaltiesImpactType? defaultPenaltiesImpactType,
      int? defaultPenaltiesRequiredToImpactPoints,
      bool? enableDefaultMatchExpulsion,
      int? defaultPenaltiesRequiredToExpel});
  SettingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsState, $Out>
    implements SettingsStateCopyWith<$R, SettingsState, $Out> {
  _SettingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsState> $mapper =
      SettingsStateMapper.ensureInitialized();
  @override
  $R call(
          {String? language,
          ThemeType? theme,
          bool? enableWakelock,
          bool? enableHapticFeedback,
          bool? enableTimerHapticFeedback,
          int? defaultNumberOfTeams,
          int? defaultImprovisationDurationInSeconds,
          int? defaultTimeBufferInSeconds,
          int? defaultHuddleTimerInSeconds,
          bool? defaultEnableStatistics,
          bool? enableDefaultPenaltiesImpactPoints,
          PenaltiesImpactType? defaultPenaltiesImpactType,
          int? defaultPenaltiesRequiredToImpactPoints,
          bool? enableDefaultMatchExpulsion,
          int? defaultPenaltiesRequiredToExpel}) =>
      $apply(FieldCopyWithData({
        if (language != null) #language: language,
        if (theme != null) #theme: theme,
        if (enableWakelock != null) #enableWakelock: enableWakelock,
        if (enableHapticFeedback != null)
          #enableHapticFeedback: enableHapticFeedback,
        if (enableTimerHapticFeedback != null)
          #enableTimerHapticFeedback: enableTimerHapticFeedback,
        if (defaultNumberOfTeams != null)
          #defaultNumberOfTeams: defaultNumberOfTeams,
        if (defaultImprovisationDurationInSeconds != null)
          #defaultImprovisationDurationInSeconds:
              defaultImprovisationDurationInSeconds,
        if (defaultTimeBufferInSeconds != null)
          #defaultTimeBufferInSeconds: defaultTimeBufferInSeconds,
        if (defaultHuddleTimerInSeconds != null)
          #defaultHuddleTimerInSeconds: defaultHuddleTimerInSeconds,
        if (defaultEnableStatistics != null)
          #defaultEnableStatistics: defaultEnableStatistics,
        if (enableDefaultPenaltiesImpactPoints != null)
          #enableDefaultPenaltiesImpactPoints:
              enableDefaultPenaltiesImpactPoints,
        if (defaultPenaltiesImpactType != null)
          #defaultPenaltiesImpactType: defaultPenaltiesImpactType,
        if (defaultPenaltiesRequiredToImpactPoints != null)
          #defaultPenaltiesRequiredToImpactPoints:
              defaultPenaltiesRequiredToImpactPoints,
        if (enableDefaultMatchExpulsion != null)
          #enableDefaultMatchExpulsion: enableDefaultMatchExpulsion,
        if (defaultPenaltiesRequiredToExpel != null)
          #defaultPenaltiesRequiredToExpel: defaultPenaltiesRequiredToExpel
      }));
  @override
  SettingsState $make(CopyWithData data) => SettingsState(
      language: data.get(#language, or: $value.language),
      theme: data.get(#theme, or: $value.theme),
      enableWakelock: data.get(#enableWakelock, or: $value.enableWakelock),
      enableHapticFeedback:
          data.get(#enableHapticFeedback, or: $value.enableHapticFeedback),
      enableTimerHapticFeedback: data.get(#enableTimerHapticFeedback,
          or: $value.enableTimerHapticFeedback),
      defaultNumberOfTeams:
          data.get(#defaultNumberOfTeams, or: $value.defaultNumberOfTeams),
      defaultImprovisationDurationInSeconds: data.get(
          #defaultImprovisationDurationInSeconds,
          or: $value.defaultImprovisationDurationInSeconds),
      defaultTimeBufferInSeconds: data.get(#defaultTimeBufferInSeconds,
          or: $value.defaultTimeBufferInSeconds),
      defaultHuddleTimerInSeconds: data.get(#defaultHuddleTimerInSeconds,
          or: $value.defaultHuddleTimerInSeconds),
      defaultEnableStatistics: data.get(#defaultEnableStatistics,
          or: $value.defaultEnableStatistics),
      enableDefaultPenaltiesImpactPoints: data.get(
          #enableDefaultPenaltiesImpactPoints,
          or: $value.enableDefaultPenaltiesImpactPoints),
      defaultPenaltiesImpactType: data.get(#defaultPenaltiesImpactType,
          or: $value.defaultPenaltiesImpactType),
      defaultPenaltiesRequiredToImpactPoints: data.get(
          #defaultPenaltiesRequiredToImpactPoints,
          or: $value.defaultPenaltiesRequiredToImpactPoints),
      enableDefaultMatchExpulsion: data.get(#enableDefaultMatchExpulsion,
          or: $value.enableDefaultMatchExpulsion),
      defaultPenaltiesRequiredToExpel: data.get(
          #defaultPenaltiesRequiredToExpel,
          or: $value.defaultPenaltiesRequiredToExpel));

  @override
  SettingsStateCopyWith<$R2, SettingsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SettingsStateCopyWithImpl($value, $cast, t);
}
