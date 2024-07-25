import 'package:mockito/annotations.dart';
import 'package:mon_pacing/repositories/database_repository.dart';
import 'package:mon_pacing/repositories/matches_repository.dart';
import 'package:mon_pacing/repositories/pacings_repository.dart';
import 'package:mon_pacing/repositories/teams_repository.dart';
import 'package:mon_pacing/services/analytics_service.dart';
import 'package:mon_pacing/services/excel_service.dart';
import 'package:mon_pacing/services/toaster_service.dart';

@GenerateNiceMocks([MockSpec<DatabaseRepository>()])
@GenerateNiceMocks([MockSpec<AnalyticsService>()])
@GenerateNiceMocks([MockSpec<ToasterService>()])
@GenerateNiceMocks([MockSpec<ExcelService>()])
@GenerateNiceMocks([MockSpec<PacingsRepository>()])
@GenerateNiceMocks([MockSpec<MatchesRepository>()])
@GenerateNiceMocks([MockSpec<TeamsRepository>()])
void main() {}
