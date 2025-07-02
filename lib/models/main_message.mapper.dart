// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'main_message.dart';

class MainMessageMapper extends ClassMapperBase<MainMessage> {
  MainMessageMapper._();

  static MainMessageMapper? _instance;
  static MainMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainMessageMapper._());
      TimerStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MainMessage';

  static int _$remainingMilliseconds(MainMessage v) => v.remainingMilliseconds;
  static const Field<MainMessage, int> _f$remainingMilliseconds =
      Field('remainingMilliseconds', _$remainingMilliseconds);
  static TimerStatus? _$requestedStatus(MainMessage v) => v.requestedStatus;
  static const Field<MainMessage, TimerStatus> _f$requestedStatus =
      Field('requestedStatus', _$requestedStatus, opt: true);

  @override
  final MappableFields<MainMessage> fields = const {
    #remainingMilliseconds: _f$remainingMilliseconds,
    #requestedStatus: _f$requestedStatus,
  };

  static MainMessage _instantiate(DecodingData data) {
    return MainMessage(
        remainingMilliseconds: data.dec(_f$remainingMilliseconds),
        requestedStatus: data.dec(_f$requestedStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static MainMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MainMessage>(map);
  }

  static MainMessage fromJson(String json) {
    return ensureInitialized().decodeJson<MainMessage>(json);
  }
}

mixin MainMessageMappable {
  String toJson() {
    return MainMessageMapper.ensureInitialized()
        .encodeJson<MainMessage>(this as MainMessage);
  }

  Map<String, dynamic> toMap() {
    return MainMessageMapper.ensureInitialized()
        .encodeMap<MainMessage>(this as MainMessage);
  }

  MainMessageCopyWith<MainMessage, MainMessage, MainMessage> get copyWith =>
      _MainMessageCopyWithImpl<MainMessage, MainMessage>(
          this as MainMessage, $identity, $identity);
  @override
  String toString() {
    return MainMessageMapper.ensureInitialized()
        .stringifyValue(this as MainMessage);
  }

  @override
  bool operator ==(Object other) {
    return MainMessageMapper.ensureInitialized()
        .equalsValue(this as MainMessage, other);
  }

  @override
  int get hashCode {
    return MainMessageMapper.ensureInitialized().hashValue(this as MainMessage);
  }
}

extension MainMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MainMessage, $Out> {
  MainMessageCopyWith<$R, MainMessage, $Out> get $asMainMessage =>
      $base.as((v, t, t2) => _MainMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MainMessageCopyWith<$R, $In extends MainMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? remainingMilliseconds, TimerStatus? requestedStatus});
  MainMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MainMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MainMessage, $Out>
    implements MainMessageCopyWith<$R, MainMessage, $Out> {
  _MainMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MainMessage> $mapper =
      MainMessageMapper.ensureInitialized();
  @override
  $R call({int? remainingMilliseconds, Object? requestedStatus = $none}) =>
      $apply(FieldCopyWithData({
        if (remainingMilliseconds != null)
          #remainingMilliseconds: remainingMilliseconds,
        if (requestedStatus != $none) #requestedStatus: requestedStatus
      }));
  @override
  MainMessage $make(CopyWithData data) => MainMessage(
      remainingMilliseconds:
          data.get(#remainingMilliseconds, or: $value.remainingMilliseconds),
      requestedStatus: data.get(#requestedStatus, or: $value.requestedStatus));

  @override
  MainMessageCopyWith<$R2, MainMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MainMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
