// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_message.dart';

class TaskMessageMapper extends ClassMapperBase<TaskMessage> {
  TaskMessageMapper._();

  static TaskMessageMapper? _instance;
  static TaskMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMessageMapper._());
      TimerStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskMessage';

  static int _$durationInSeconds(TaskMessage v) => v.durationInSeconds;
  static const Field<TaskMessage, int> _f$durationInSeconds =
      Field('durationInSeconds', _$durationInSeconds);
  static TimerStatus _$status(TaskMessage v) => v.status;
  static const Field<TaskMessage, TimerStatus> _f$status =
      Field('status', _$status);
  static bool _$hapticFeedback(TaskMessage v) => v.hapticFeedback;
  static const Field<TaskMessage, bool> _f$hapticFeedback =
      Field('hapticFeedback', _$hapticFeedback);
  static String _$notificationTitle(TaskMessage v) => v.notificationTitle;
  static const Field<TaskMessage, String> _f$notificationTitle =
      Field('notificationTitle', _$notificationTitle);

  @override
  final MappableFields<TaskMessage> fields = const {
    #durationInSeconds: _f$durationInSeconds,
    #status: _f$status,
    #hapticFeedback: _f$hapticFeedback,
    #notificationTitle: _f$notificationTitle,
  };

  static TaskMessage _instantiate(DecodingData data) {
    return TaskMessage(
        durationInSeconds: data.dec(_f$durationInSeconds),
        status: data.dec(_f$status),
        hapticFeedback: data.dec(_f$hapticFeedback),
        notificationTitle: data.dec(_f$notificationTitle));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskMessage>(map);
  }

  static TaskMessage fromJson(String json) {
    return ensureInitialized().decodeJson<TaskMessage>(json);
  }
}

mixin TaskMessageMappable {
  String toJson() {
    return TaskMessageMapper.ensureInitialized()
        .encodeJson<TaskMessage>(this as TaskMessage);
  }

  Map<String, dynamic> toMap() {
    return TaskMessageMapper.ensureInitialized()
        .encodeMap<TaskMessage>(this as TaskMessage);
  }

  TaskMessageCopyWith<TaskMessage, TaskMessage, TaskMessage> get copyWith =>
      _TaskMessageCopyWithImpl<TaskMessage, TaskMessage>(
          this as TaskMessage, $identity, $identity);
  @override
  String toString() {
    return TaskMessageMapper.ensureInitialized()
        .stringifyValue(this as TaskMessage);
  }

  @override
  bool operator ==(Object other) {
    return TaskMessageMapper.ensureInitialized()
        .equalsValue(this as TaskMessage, other);
  }

  @override
  int get hashCode {
    return TaskMessageMapper.ensureInitialized().hashValue(this as TaskMessage);
  }
}

extension TaskMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskMessage, $Out> {
  TaskMessageCopyWith<$R, TaskMessage, $Out> get $asTaskMessage =>
      $base.as((v, t, t2) => _TaskMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskMessageCopyWith<$R, $In extends TaskMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? durationInSeconds,
      TimerStatus? status,
      bool? hapticFeedback,
      String? notificationTitle});
  TaskMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskMessage, $Out>
    implements TaskMessageCopyWith<$R, TaskMessage, $Out> {
  _TaskMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskMessage> $mapper =
      TaskMessageMapper.ensureInitialized();
  @override
  $R call(
          {int? durationInSeconds,
          TimerStatus? status,
          bool? hapticFeedback,
          String? notificationTitle}) =>
      $apply(FieldCopyWithData({
        if (durationInSeconds != null) #durationInSeconds: durationInSeconds,
        if (status != null) #status: status,
        if (hapticFeedback != null) #hapticFeedback: hapticFeedback,
        if (notificationTitle != null) #notificationTitle: notificationTitle
      }));
  @override
  TaskMessage $make(CopyWithData data) => TaskMessage(
      durationInSeconds:
          data.get(#durationInSeconds, or: $value.durationInSeconds),
      status: data.get(#status, or: $value.status),
      hapticFeedback: data.get(#hapticFeedback, or: $value.hapticFeedback),
      notificationTitle:
          data.get(#notificationTitle, or: $value.notificationTitle));

  @override
  TaskMessageCopyWith<$R2, TaskMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
