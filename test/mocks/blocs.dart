import 'package:mockito/annotations.dart';
import 'package:mon_pacing/cubits/matches/matches_cubit.dart';
import 'package:mon_pacing/cubits/pacings/pacings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/teams/teams_cubit.dart';
import 'package:mon_pacing/cubits/timer/timer_cubit.dart';
import 'package:mon_pacing/pages/match/cubits/match_cubit.dart';
import 'package:mon_pacing/pages/match_detail/cubits/match_detail_cubit.dart';
import 'package:mon_pacing/pages/match_improvisation/cubits/match_improvisation_cubit.dart';
import 'package:mon_pacing/pages/match_penalty/cubits/match_penalty_cubit.dart';
import 'package:mon_pacing/pages/pacing/cubits/pacing_cubit.dart';
import 'package:mon_pacing/pages/pacing_detail/cubits/pacing_detail_cubit.dart';
import 'package:mon_pacing/pages/team_detail/cubits/team_detail_cubit.dart';

@GenerateNiceMocks([MockSpec<PacingsCubit>()])
@GenerateNiceMocks([MockSpec<PacingCubit>()])
@GenerateNiceMocks([MockSpec<PacingDetailCubit>()])
@GenerateNiceMocks([MockSpec<MatchesCubit>()])
@GenerateNiceMocks([MockSpec<MatchCubit>()])
@GenerateNiceMocks([MockSpec<MatchDetailCubit>()])
@GenerateNiceMocks([MockSpec<MatchImprovisationCubit>()])
@GenerateNiceMocks([MockSpec<MatchPenaltyCubit>()])
@GenerateNiceMocks([MockSpec<TeamsCubit>()])
@GenerateNiceMocks([MockSpec<TeamDetailCubit>()])
@GenerateNiceMocks([MockSpec<SettingsCubit>()])
@GenerateNiceMocks([MockSpec<TimerCubit>()])
void main() {}
