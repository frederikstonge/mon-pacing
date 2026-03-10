import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/improvisation_model.dart';
import '../../repositories/improvisations_repository.dart';
import '../../services/toaster_service.dart';
import 'improvisations_state.dart';
import 'improvisations_status.dart';

class ImprovisationsCubit extends Cubit<ImprovisationsState> {
  static const int _pageSize = 20;
  final ImprovisationsRepository improvisationsRepository;
  final ToasterService toasterService;

  ImprovisationsCubit({required this.improvisationsRepository, required this.toasterService})
    : super(const ImprovisationsState(status: ImprovisationsStatus.initial));

  Future<ImprovisationModel?> add(ImprovisationModel model) async {
    try {
      final improvisationEntity = await improvisationsRepository.add(model.toEntity(order: 0, hasParent: false));
      final improvisationModel = ImprovisationModel.fromEntity(entity: improvisationEntity);
      return improvisationModel;
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<ImprovisationModel> edit(ImprovisationModel model) async {
    try {
      final entity = await improvisationsRepository.edit(model.toEntity(order: 0, hasParent: false));
      return ImprovisationModel.fromEntity(entity: entity);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
      return model;
    } finally {
      await refresh();
    }
  }

  Future<void> delete(ImprovisationModel model) async {
    try {
      await improvisationsRepository.delete(model.toEntity(order: 0, hasParent: false));
      toasterService.show(title: Localizer.current.toasterImprovisationDeleted);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> fetch() async {
    if (state.status == ImprovisationsStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: ImprovisationsStatus.loading));
    try {
      final response = await improvisationsRepository.getList(state.improvisations.length, _pageSize);
      final improvisations =
          state.improvisations + response.map((e) => ImprovisationModel.fromEntity(entity: e)).toList();

      emit(
        state.copyWith(
          status: ImprovisationsStatus.success,
          improvisations: improvisations,
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(ImprovisationsState(status: ImprovisationsStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<void> refresh() async {
    if (state.status != ImprovisationsStatus.initial) {
      emit(ImprovisationsState(status: ImprovisationsStatus.initial));
      await fetch();
    }
  }
}
