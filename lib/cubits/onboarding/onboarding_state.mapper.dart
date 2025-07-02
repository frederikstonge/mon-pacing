// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'onboarding_state.dart';

class OnboardingStateMapper extends ClassMapperBase<OnboardingState> {
  OnboardingStateMapper._();

  static OnboardingStateMapper? _instance;
  static OnboardingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OnboardingStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OnboardingState';

  static bool _$onboardingFinished(OnboardingState v) => v.onboardingFinished;
  static const Field<OnboardingState, bool> _f$onboardingFinished =
      Field('onboardingFinished', _$onboardingFinished, opt: true, def: false);

  @override
  final MappableFields<OnboardingState> fields = const {
    #onboardingFinished: _f$onboardingFinished,
  };

  static OnboardingState _instantiate(DecodingData data) {
    return OnboardingState(onboardingFinished: data.dec(_f$onboardingFinished));
  }

  @override
  final Function instantiate = _instantiate;

  static OnboardingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OnboardingState>(map);
  }

  static OnboardingState fromJson(String json) {
    return ensureInitialized().decodeJson<OnboardingState>(json);
  }
}

mixin OnboardingStateMappable {
  String toJson() {
    return OnboardingStateMapper.ensureInitialized()
        .encodeJson<OnboardingState>(this as OnboardingState);
  }

  Map<String, dynamic> toMap() {
    return OnboardingStateMapper.ensureInitialized()
        .encodeMap<OnboardingState>(this as OnboardingState);
  }

  OnboardingStateCopyWith<OnboardingState, OnboardingState, OnboardingState>
      get copyWith =>
          _OnboardingStateCopyWithImpl<OnboardingState, OnboardingState>(
              this as OnboardingState, $identity, $identity);
  @override
  String toString() {
    return OnboardingStateMapper.ensureInitialized()
        .stringifyValue(this as OnboardingState);
  }

  @override
  bool operator ==(Object other) {
    return OnboardingStateMapper.ensureInitialized()
        .equalsValue(this as OnboardingState, other);
  }

  @override
  int get hashCode {
    return OnboardingStateMapper.ensureInitialized()
        .hashValue(this as OnboardingState);
  }
}

extension OnboardingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OnboardingState, $Out> {
  OnboardingStateCopyWith<$R, OnboardingState, $Out> get $asOnboardingState =>
      $base.as((v, t, t2) => _OnboardingStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OnboardingStateCopyWith<$R, $In extends OnboardingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? onboardingFinished});
  OnboardingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OnboardingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OnboardingState, $Out>
    implements OnboardingStateCopyWith<$R, OnboardingState, $Out> {
  _OnboardingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OnboardingState> $mapper =
      OnboardingStateMapper.ensureInitialized();
  @override
  $R call({bool? onboardingFinished}) => $apply(FieldCopyWithData({
        if (onboardingFinished != null) #onboardingFinished: onboardingFinished
      }));
  @override
  OnboardingState $make(CopyWithData data) => OnboardingState(
      onboardingFinished:
          data.get(#onboardingFinished, or: $value.onboardingFinished));

  @override
  OnboardingStateCopyWith<$R2, OnboardingState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OnboardingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
