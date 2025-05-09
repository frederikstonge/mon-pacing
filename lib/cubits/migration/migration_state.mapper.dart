// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'migration_state.dart';

class MigrationStatusMapper extends EnumMapper<MigrationStatus> {
  MigrationStatusMapper._();

  static MigrationStatusMapper? _instance;
  static MigrationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MigrationStatusMapper._());
    }
    return _instance!;
  }

  static MigrationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MigrationStatus decode(dynamic value) {
    switch (value) {
      case 'initial':
        return MigrationStatus.initial;
      case 'running':
        return MigrationStatus.running;
      case 'error':
        return MigrationStatus.error;
      case 'success':
        return MigrationStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MigrationStatus self) {
    switch (self) {
      case MigrationStatus.initial:
        return 'initial';
      case MigrationStatus.running:
        return 'running';
      case MigrationStatus.error:
        return 'error';
      case MigrationStatus.success:
        return 'success';
    }
  }
}

extension MigrationStatusMapperExtension on MigrationStatus {
  String toValue() {
    MigrationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MigrationStatus>(this) as String;
  }
}

class MigrationStateMapper extends ClassMapperBase<MigrationState> {
  MigrationStateMapper._();

  static MigrationStateMapper? _instance;
  static MigrationStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MigrationStateMapper._());
      MigrationStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MigrationState';

  static MigrationStatus _$status(MigrationState v) => v.status;
  static const Field<MigrationState, MigrationStatus> _f$status =
      Field('status', _$status);
  static int? _$count(MigrationState v) => v.count;
  static const Field<MigrationState, int> _f$count =
      Field('count', _$count, opt: true);
  static int? _$total(MigrationState v) => v.total;
  static const Field<MigrationState, int> _f$total =
      Field('total', _$total, opt: true);
  static String? _$title(MigrationState v) => v.title;
  static const Field<MigrationState, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$errorMessage(MigrationState v) => v.errorMessage;
  static const Field<MigrationState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<MigrationState> fields = const {
    #status: _f$status,
    #count: _f$count,
    #total: _f$total,
    #title: _f$title,
    #errorMessage: _f$errorMessage,
  };

  static MigrationState _instantiate(DecodingData data) {
    return MigrationState(
        status: data.dec(_f$status),
        count: data.dec(_f$count),
        total: data.dec(_f$total),
        title: data.dec(_f$title),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static MigrationState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MigrationState>(map);
  }

  static MigrationState fromJson(String json) {
    return ensureInitialized().decodeJson<MigrationState>(json);
  }
}

mixin MigrationStateMappable {
  String toJson() {
    return MigrationStateMapper.ensureInitialized()
        .encodeJson<MigrationState>(this as MigrationState);
  }

  Map<String, dynamic> toMap() {
    return MigrationStateMapper.ensureInitialized()
        .encodeMap<MigrationState>(this as MigrationState);
  }

  MigrationStateCopyWith<MigrationState, MigrationState, MigrationState>
      get copyWith => _MigrationStateCopyWithImpl(
          this as MigrationState, $identity, $identity);
  @override
  String toString() {
    return MigrationStateMapper.ensureInitialized()
        .stringifyValue(this as MigrationState);
  }

  @override
  bool operator ==(Object other) {
    return MigrationStateMapper.ensureInitialized()
        .equalsValue(this as MigrationState, other);
  }

  @override
  int get hashCode {
    return MigrationStateMapper.ensureInitialized()
        .hashValue(this as MigrationState);
  }
}

extension MigrationStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MigrationState, $Out> {
  MigrationStateCopyWith<$R, MigrationState, $Out> get $asMigrationState =>
      $base.as((v, t, t2) => _MigrationStateCopyWithImpl(v, t, t2));
}

abstract class MigrationStateCopyWith<$R, $In extends MigrationState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {MigrationStatus? status,
      int? count,
      int? total,
      String? title,
      String? errorMessage});
  MigrationStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MigrationStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MigrationState, $Out>
    implements MigrationStateCopyWith<$R, MigrationState, $Out> {
  _MigrationStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MigrationState> $mapper =
      MigrationStateMapper.ensureInitialized();
  @override
  $R call(
          {MigrationStatus? status,
          Object? count = $none,
          Object? total = $none,
          Object? title = $none,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (count != $none) #count: count,
        if (total != $none) #total: total,
        if (title != $none) #title: title,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  MigrationState $make(CopyWithData data) => MigrationState(
      status: data.get(#status, or: $value.status),
      count: data.get(#count, or: $value.count),
      total: data.get(#total, or: $value.total),
      title: data.get(#title, or: $value.title),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  MigrationStateCopyWith<$R2, MigrationState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MigrationStateCopyWithImpl($value, $cast, t);
}
