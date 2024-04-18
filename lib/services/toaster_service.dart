import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToasterService {
  void show({
    required String title,
    String? description,
    ToastificationType type = ToastificationType.success,
  }) {
    toastification.show(
      title: Text(title),
      description: description != null ? Text(description) : null,
      type: type,
      style: ToastificationStyle.flatColored,
      boxShadow: lowModeShadow,
      autoCloseDuration: const Duration(seconds: 5),
      showProgressBar: false,
      dragToClose: true,
    );
  }
}
