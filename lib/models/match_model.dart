// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart';

import 'base_model.dart';
import 'entities/match_entity_model.dart';
import 'improvisation_model.dart';
import 'improvisation_type.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
@collection
class MatchModel with _$MatchModel implements BaseModel {
  const MatchModel._();

  @Implements<BaseModel>()
  const factory MatchModel({
    required int id,
    @index required String name,
    @index required DateTime? createdDate,
    required DateTime? modifiedDate,
    required List<TeamModel> teams,
    required List<ImprovisationModel> improvisations,
    required List<PenaltyModel> penalties,
    required List<PointModel> points,
    @Default(true) bool enablePenaltiesImpactPoints,
    @Default(PenaltiesImpactType.addPoints) PenaltiesImpactType penaltiesImpactType,
    @Default(3) int penaltiesRequiredToImpactPoints,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, Object?> json) => _$MatchModelFromJson(json);

  factory MatchModel.fromEntity(MatchEntityModel model) => MatchModel(
        id: model.id,
        name: model.name,
        createdDate: model.createdDate,
        modifiedDate: model.modifiedDate,
        teams: model.teams.map((e) => TeamModel.fromEntity(e)).toList(),
        improvisations: model.improvisations.map((e) => ImprovisationModel.fromEntity(e)).toList(),
        penalties: model.penalties.map((e) => PenaltyModel.fromEntity(e)).toList(),
        points: model.points.map((e) => PointModel.fromEntity(e)).toList(),
        enablePenaltiesImpactPoints: model.enablePenaltiesImpactPoints,
        penaltiesImpactType: PenaltiesImpactType.values.elementAt(model.penaltiesImpactType),
        penaltiesRequiredToImpactPoints: model.penaltiesRequiredToImpactPoints,
      );

  MatchEntityModel toEntity() => MatchEntityModel(
        id: this.id,
        name: name,
        createdDate: createdDate,
        modifiedDate: modifiedDate,
        teams: ToMany(items: teams.map((e) => e.toEntity()).toList()),
        improvisations: ToMany(items: improvisations.map((e) => e.toEntity()).toList()),
        penalties: ToMany(items: penalties.map((e) => e.toEntity()).toList()),
        points: ToMany(items: points.map((e) => e.toEntity()).toList()),
        enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
        penaltiesImpactType: penaltiesImpactType.index,
        penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints,
      );
}
