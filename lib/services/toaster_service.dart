import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToasterService {
  final Toastification toastification;

  const ToasterService({required this.toastification});

  void show({
    required String title,
    String? description,
    ToastificationType type = ToastificationType.success,
    bool autoClose = true,
  }) {
    toastification.show(
      title: Text(title),
      description: description != null ? Text(description) : null,
      type: type,
      style: ToastificationStyle.minimal,
      boxShadow: lowModeShadow,
      autoCloseDuration: autoClose ? const Duration(seconds: 4) : null,
      showProgressBar: false,
      dragToClose: true,
    );
  }
}
