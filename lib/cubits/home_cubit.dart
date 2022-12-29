import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  final pageController = PageController();

  HomeCubit() : super(0);

  void setPage(int page, {bool setController = true}) {
    if (setController) {
      pageController.jumpToPage(page);
    }
    emit(page);
  }
}
