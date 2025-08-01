import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../extensions/iterable_extensions.dart';
import '../../l10n/localizer.dart';
import '../../models/match_model.dart';
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

  Future<MatchModel> edit(MatchModel model) async {
    try {
      final entity = await matchesRepository.edit(model.toEntity());
      return MatchModel.fromEntity(entity: entity);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
      return model;
    } finally {
      await refresh();
    }
  }

  Future<void> delete(MatchModel model) async {
    try {
      await matchesRepository.delete(model.toEntity());
      toasterService.show(title: Localizer.current.toasterMatchDeleted);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> selectTag(String tag) async {
    if (state.selectedTags.contains(tag)) {
      return;
    }

    emit(state.copyWith(selectedTags: [...state.selectedTags, tag]));
    await refresh();
  }

  Future<void> deselectTag(String tag) async {
    if (!state.selectedTags.contains(tag)) {
      return;
    }

    emit(state.copyWith(selectedTags: state.selectedTags.where((t) => t != tag).toList()));
    await refresh();
  }

  Future<void> fetch() async {
    if (state.status == MatchesStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: MatchesStatus.loading));
    try {
      final response = await matchesRepository.getList(state.matches.length, _pageSize, state.selectedTags);
      final matches = state.matches + response.map((e) => MatchModel.fromEntity(entity: e)).toList();
      final tags = matches
          .selectMany((e) => e.tags)
          .map((e) => e.name)
          .groupListsBy((e) => e)
          .values
          .sorted((a, b) => b.length - a.length)
          .map((e) => e.first)
          .toList();

      emit(
        state.copyWith(
          status: MatchesStatus.success,
          matches: matches,
          tags: tags,
          selectedTags: state.selectedTags.where((t) => tags.contains(t)).toList(),
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(MatchesState(status: MatchesStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<void> refresh() async {
    if (state.status != MatchesStatus.initial) {
      emit(MatchesState(status: MatchesStatus.initial, tags: state.tags, selectedTags: state.selectedTags));
      await fetch();
    }
  }
}
