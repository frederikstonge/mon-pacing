import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/match_model.dart';
import '../../models/tag_model.dart';
import '../../repositories/matches_repository.dart';
import '../../services/analytics_service.dart';
import '../../services/toaster_service.dart';
import 'matches_state.dart';
import 'matches_status.dart';

class MatchesCubit extends Cubit<MatchesState> {
  static const int _pageSize = 20;
  final MatchesRepository matchesRepository;
  final ToasterService toasterService;
  final AnalyticsService analyticsService;

  MatchesCubit({required this.matchesRepository, required this.toasterService, required this.analyticsService})
    : super(const MatchesState(status: MatchesStatus.initial));

  Future<MatchModel?> add(MatchModel model) async {
    try {
      if (model.improvisations.isEmpty) {
        toasterService.show(
          title: Localizer.current.toasterYouCantStartAMatchWithoutImprovisation,
          type: ToastificationType.error,
        );
        return null;
      }

      if (model.enableStatistics && model.teams.any((t) => t.performers.isEmpty)) {
        toasterService.show(
          title: Localizer.current.toasterYouCantStartAMatchWithAnEmptyTeam,
          type: ToastificationType.error,
        );
        return null;
      }

      if (model.enableStatistics && model.teams.any((t) => t.performers.any((p) => p.name.isEmpty))) {
        toasterService.show(
          title: Localizer.current.toasterYouMustFillAllPerformersName,
          type: ToastificationType.error,
        );
        return null;
      }

      final matchEntity = await matchesRepository.add(model.toEntity());
      final matchModel = MatchModel.fromEntity(entity: matchEntity);
      await analyticsService.logStartMatch(matchModel);
      return matchModel;
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<void> edit(MatchModel model) async {
    try {
      await matchesRepository.edit(model.toEntity());
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(MatchModel model) async {
    try {
      await matchesRepository.delete(model.id);
      toasterService.show(title: Localizer.current.toasterMatchDeleted);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> fetch() async {
    if (state.status == MatchesStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: MatchesStatus.loading));
    try {
      final response = await matchesRepository.getList(state.matches.length, _pageSize);
      emit(
        state.copyWith(
          status: MatchesStatus.success,
          matches: state.matches + response.map((e) => MatchModel.fromEntity(entity: e)).toList(),
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(MatchesState(status: MatchesStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<List<TagModel>> getAllTags({String query = ''}) async {
    final tags = await matchesRepository.getAllTags(search: query);
    return tags.map((e) => TagModel.fromEntity(entity: e)).toList();
  }

  Future<void> refresh() async {
    emit(const MatchesState(status: MatchesStatus.initial));
    await fetch();
  }
}
