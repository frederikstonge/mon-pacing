import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../models/match_model.dart';
import '../../repositories/matches_repository.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  static const int _pageSize = 20;
  final MatchesRepository repository;
  final ToasterService toasterService;
  final SettingsCubit settingsCubit;
  bool _isFetching = false;

  MatchesCubit({
    required this.repository,
    required this.toasterService,
    required this.settingsCubit,
  }) : super(const MatchesState.initial());

  Future<MatchModel?> add(MatchModel model) async {
    try {
      if (model.improvisations.isEmpty) {
        toasterService.show(title: settingsCubit.localizer.toasterYouCantStartAMatchWithoutImprovisation, type: ToastificationType.error);
        return null;
      }
      final matchModel = await repository.add(model);
      return matchModel;
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<void> edit(MatchModel model) async {
    try {
      await repository.edit(model);
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(MatchModel model) async {
    try {
      await repository.delete(model.id);
      toasterService.show(title: settingsCubit.localizer.toasterMatchDeleted);
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
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
          final response = await repository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length == _pageSize));
        },
        error: (error) async {
          final response = await repository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length == _pageSize));
        },
        success: (matches, hasReachedMax) async {
          final response = await repository.getList(matches.length, _pageSize);
          emit(MatchesState.success(matches + response, response.length == _pageSize));
        },
      );
    } catch (exception) {
      emit(MatchesState.error(exception.toString()));
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> refresh() async {
    emit(const MatchesState.initial());
    await fetch();
  }
}
