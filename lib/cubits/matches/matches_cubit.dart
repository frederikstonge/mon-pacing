import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/match_model.dart';
import '../../repositories/matches_repository.dart';
import '../../services/analytics_service.dart';
import '../../services/toaster_service.dart';
import 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  static const int _pageSize = 20;
  final MatchesRepository matchesRepository;
  final ToasterService toasterService;
  final AnalyticsService analyticsService;
  bool _isFetching = false;

  MatchesCubit({
    required this.matchesRepository,
    required this.toasterService,
    required this.analyticsService,
  }) : super(const MatchesState.initial());

  Future<MatchModel?> add(MatchModel model) async {
    try {
      if (model.improvisations.isEmpty) {
        toasterService.show(title: Localizer.current.toasterYouCantStartAMatchWithoutImprovisation, type: ToastificationType.error);
        return null;
      }

      if (model.enableStatistics && model.teams.any((t) => t.performers.isEmpty)) {
        toasterService.show(title: Localizer.current.toasterYouCantStartAMatchWithAnEmptyTeam, type: ToastificationType.error);
        return null;
      }

      if (model.enableStatistics && model.teams.any((t) => t.performers.any((p) => p.name.isEmpty))) {
        toasterService.show(title: Localizer.current.toasterYouMustFillAllPerformersName, type: ToastificationType.error);
        return null;
      }

      final matchModel = await matchesRepository.add(model);
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
      await matchesRepository.edit(model);
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
    if (_isFetching) {
      return;
    }

    _isFetching = true;
    try {
      await state.when(
        initial: () async {
          final response = await matchesRepository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length == _pageSize));
        },
        error: (error) async {
          final response = await matchesRepository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length == _pageSize));
        },
        success: (matches, hasReachedMax) async {
          final response = await matchesRepository.getList(matches.length, _pageSize);
          emit(MatchesState.success(matches + response, response.length == _pageSize));
        },
      );
    } catch (exception) {
      emit(MatchesState.error(exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    return await matchesRepository.getAllTags(query: query);
  }

  Future<void> refresh() async {
    emit(const MatchesState.initial());
    await fetch();
  }
}
