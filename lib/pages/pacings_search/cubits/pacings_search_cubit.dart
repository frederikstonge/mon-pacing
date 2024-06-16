import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../repositories/pacings_repository.dart';
import '../../../services/toaster_service.dart';
import 'pacings_search_state.dart';

class PacingsSearchCubit extends Cubit<PacingsSearchState> {
  static const int _pageSize = 20;
  final PacingsRepository pacingsRepository;
  final ToasterService toasterService;
  final SettingsCubit settingsCubit;
  bool _isFetching = false;

  PacingsSearchCubit({
    required this.pacingsRepository,
    required this.toasterService,
    required this.settingsCubit,
  }) : super(const PacingsSearchState(searchQuery: '', pacings: [], hasMore: true, tags: {}));

  Future<void> initialize() async {
    _isFetching = true;
    try {
      final tags = await pacingsRepository.getAllTags();
      emit(state.copyWith(tags: tags));
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> fetch(String query, {List<String> selectedTags = const []}) async {
    if (_isFetching) {
      return;
    }

    if (query.isEmpty && selectedTags.isEmpty) {
      emit(state.copyWith(
        searchQuery: '',
        pacings: [],
        hasMore: true,
        selectedTags: selectedTags,
      ));
      return;
    }

    _isFetching = true;
    try {
      final skip = query == state.searchQuery ? state.pacings.length : 0;
      final response = await pacingsRepository.search(query, skip, _pageSize, selectedTags);
      emit(state.copyWith(
        searchQuery: query,
        pacings: query == state.searchQuery ? state.pacings + response : response,
        hasMore: response.length == _pageSize,
        selectedTags: selectedTags,
      ));
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }
}
