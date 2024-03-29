import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';

import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import 'pacings_state.dart';

class PacingsCubit extends Cubit<PacingsState> {
  static const int _pageSize = 20;
  final PacingsRepository pacingsRepository;
  bool _isFetching = false;

  PacingsCubit({required this.pacingsRepository}) : super(const PacingsState.initial());

  Future<PacingModel> add(PacingModel model) async {
    try {
      return await pacingsRepository.add(model);
    } finally {
      await refresh();
    }
  }

  Future<void> edit(PacingModel model) async {
    try {
      await pacingsRepository.edit(model);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(PacingModel model) async {
    try {
      await pacingsRepository.delete(model.id);
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
          final response = await pacingsRepository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length == _pageSize));
        },
        error: (error) async {
          final response = await pacingsRepository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length == _pageSize));
        },
        success: (pacings, hasReachedMax) async {
          final response = await pacingsRepository.getList(pacings.length, _pageSize);
          emit(PacingsState.success(pacings + response, response.length == _pageSize));
        },
      );
    } catch (exception) {
      emit(PacingsState.error(exception.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> refresh() async {
    emit(const PacingsState.initial());
    await fetch();
  }

  Future<PacingModel?> import() async {
    const params = OpenFileDialogParams(
      dialogType: OpenFileDialogType.document,
      sourceType: SourceType.photoLibrary,
      fileExtensionsFilter: ['json'],
    );
    final filePath = await FlutterFileDialog.pickFile(params: params);
    if (filePath != null) {
      final pacingValue = await File(filePath).readAsString();
      final pacing = PacingModel.fromJson(jsonDecode(pacingValue));
      return await add(pacing.copyWith(id: 0));
    }

    return null;
  }

  Future<bool> export(PacingModel model) async {
    final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
    final fileName = sanitizeFilename('${model.name}.json', replacement: '-');
    final params = SaveFileDialogParams(data: data, fileName: fileName);
    final filePath = await FlutterFileDialog.saveFile(params: params);
    return filePath != null;
  }
}
