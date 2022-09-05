import 'package:freezed_annotation/freezed_annotation.dart';

part 'penalty_model.freezed.dart';
part 'penalty_model.g.dart';

@freezed
class PenaltyModel with _$PenaltyModel {
  const factory PenaltyModel({
    required bool major,
    required String player,
    required int teamId,
    required int improvisationId,
  }) = _PenaltyModel;

  factory PenaltyModel.fromJson(Map<String, dynamic> json) => _$PenaltyModelFromJson(json);
}
