import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../repositories/matches_repository.dart';
import '../../../services/toaster_service.dart';
import 'matches_search_state.dart';

class MatchesSearchCubit extends Cubit<MatchesSearchState> {
  static const int _pageSize = 20;
  final MatchesRepository matchesRepository;
  final ToasterService toasterService;
  final SettingsCubit settingsCubit;
  bool _isFetching = false;

  MatchesSearchCubit({
    required this.matchesRepository,
    required this.toasterService,
    required this.settingsCubit,
  }) : super(const MatchesSearchState(searchQuery: '', matches: [], hasMore: true));

  Future<void> fetch(String query) async {
    if (_isFetching) {
      return;
    }

    if (query.isEmpty) {
      emit(const MatchesSearchState(searchQuery: '', matches: [], hasMore: true));
      return;
    }

    _isFetching = true;
    try {
      final skip = query == state.searchQuery ? state.matches.length : 0;
      final response = await matchesRepository.search(query, skip, _pageSize);
      emit(MatchesSearchState(
        searchQuery: query,
        matches: query == state.searchQuery ? state.matches + response : response,
        hasMore: response.length == _pageSize,
      ));
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }
}